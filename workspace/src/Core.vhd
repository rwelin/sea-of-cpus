library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.core_config.all;
use work.opcodes.all;
use work.instruction_decode.all;
use work.dsp_mode.all;
use work.utils.all;

entity Core is
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        addr: in ram_addr;
        data: in word;
        we: in std_logic;
        output: out word
    );
end Core;

architecture behav of Core is

    signal br_addra: ram_addr;
    signal br_addrb: ram_addr;
    signal br_doa: word;
    signal br_dob: word;
    signal br_dib: word;
    signal br_web: std_logic;

    signal pc: ram_addr; -- Program counter
    signal stall_pc: std_logic; -- Indicates whether to hold the PC or not
    signal next_calculated_pc: ram_addr; -- Next instruction memory address

    signal rf_inputs: RegisterFileInputs;
    signal rf_read_a: word;
    signal rf_read_b: word;
    signal rf_read_c: word;
    signal rf_read_d: word;

    signal dsp_inputs: DSPInputs;
    signal dsp_p: std_logic_vector(47 downto 0);

    signal a_input: word;
    signal a_output: word;

    signal s2_instruction_word: word;

    -- Data shift registers
    --

    type sr_rf_read_a_t is array (0 to 3) of word;
    signal sr_rf_read_a: sr_rf_read_a_t;

    type sr_rf_read_b_t is array (0 to 3) of word;
    signal sr_rf_read_b: sr_rf_read_b_t;

    type sr_rf_read_c_t is array (0 to 3) of word;
    signal sr_rf_read_c: sr_rf_read_c_t;

    type sr_accumulator_t is array (0 to 3) of word;
    signal sr_accumulator: sr_accumulator_t;

    type sr_br_dob_t is array (0 to 0) of word;
    signal sr_br_dob: sr_br_dob_t;

    type sr_instruction_constant_t is array (0 to 3) of word;
    signal sr_instruction_constant: sr_instruction_constant_t;

    type sr_write_register_t is array (0 to 6) of register_addr;
    signal sr_write_register: sr_write_register_t;

    type sr_dsp_p_t is array (0 to 0) of word;
    signal sr_dsp_p: sr_dsp_p_t;

    -- Control flags
    --

    type sr_core_we_t is array (0 to 1) of std_logic;
    signal sr_core_we: sr_core_we_t;

    type sr_a_write_enable_t is array (0 to 6) of std_logic;
    signal sr_a_write_enable: sr_a_write_enable_t;

    type sr_rf_write_enable_t is array (0 to 6) of std_logic;
    signal sr_rf_write_enable: sr_rf_write_enable_t;

    type sr_br_web_t is array (0 to 1) of std_logic;
    signal sr_br_web: sr_br_web_t;

    type sr_dsp_input_control_t is array (0 to 3) of DspDataInputControl;
    signal sr_dsp_input_control: sr_dsp_input_control_t;

    type sr_dsp_mode_t is array (0 to 3) of DSPMode;
    signal sr_dsp_mode: sr_dsp_mode_t;

    type sr_block_ram_input_control_t is array (0 to 1) of BlockRamDataInputControl;
    signal sr_block_ram_input_control: sr_block_ram_input_control_t;

    type sr_block_ram_addr_control_t is array (0 to 1) of BlockRamAddrControl;
    signal sr_block_ram_addr_control: sr_block_ram_addr_control_t;

    type sr_branch_t is array (0 to 1) of BranchOp;
    signal sr_branch: sr_branch_t;

    -- Indicates whether to simply increment the PC or use `next_calculated_pc'
    type sr_use_pc_next_address_t is array (0 to 1) of std_logic;
    signal sr_use_pc_next_address: sr_use_pc_next_address_t;

    signal op: opcode;

begin


    output <= (others => '0');
    stall_pc <= '0';
    op <= s2_instruction_word(17 downto 12);


    pipeline_stage_1: process
    begin
        wait until clk'event and clk = '1';
        
        if clk_en = '1' then

            ------------
            -- Update PC

            if we = '0' and stall_pc = '0' then
                if sr_use_pc_next_address(1) = '0' then
                    pc <= next_calculated_pc;
                else
                    pc <= std_logic_vector(unsigned(pc) + 1);
                end if;
            end if;

            sr_core_we(0) <= we;
            sr_core_we(1) <= sr_core_we(0);

            if reset = '1' then
                pc <= (others => '0');
                sr_core_we <= (others => '0');
            end if;

        end if;

    end process pipeline_stage_1;


    pipeline_stage_1_unclocked: process
        ( pc
        , addr
        , we
        )
    begin

        ---------------------------------
        -- Set instruction memory address

        br_addra <= pc;
        if we = '1' then
            br_addra <= addr;
        end if;

    end process pipeline_stage_1_unclocked;


    pipeline_stage_2: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            s2_instruction_word <= br_doa; 
            if reset = '1' or sr_core_we(1) = '1' then
                s2_instruction_word <= (others => '0');
            end if;

        end if;

    end process pipeline_stage_2;


    pipeline_stage_3: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            sr_instruction_constant(0) <= sign_extend(s2_instruction_word(11 downto 0), word'length);

            sr_write_register(0) <= s2_instruction_word(5 downto 0);

            sr_branch(0) <= NoBr;

            sr_rf_write_enable(0) <= '0';
            sr_a_write_enable(0) <= '0';
            sr_br_web(0) <= '0';

            sr_dsp_input_control(0).a <= Zero;
            sr_dsp_input_control(0).b <= Zero;
            sr_dsp_input_control(0).c <= Zero;
            sr_dsp_input_control(0).d <= Zero;

            sr_dsp_mode(0) <= DSP_C_PASSTHROUGH;

            case op is
                when OP_MOVA =>
                    sr_dsp_input_control(0).c <= Const;
                    sr_a_write_enable(0) <= '1';

                when OP_MOVAR =>
                    sr_dsp_input_control(0).c <= Reg1;
                    sr_a_write_enable(0) <= '1';

                when OP_MOVRA =>
                    sr_dsp_input_control(0).c <= Acc;
                    sr_rf_write_enable(0) <= '1';

                when OP_MOVRR =>
                    sr_dsp_input_control(0).c <= Reg1;
                    sr_rf_write_enable(0) <= '1';

                when OP_LDA =>
                    sr_dsp_input_control(0).c <= Ram;
                    sr_block_ram_addr_control(0) <= Const;
                    sr_a_write_enable(0) <= '1';

                when OP_STA =>
                    sr_block_ram_input_control(0) <= Acc;
                    sr_block_ram_addr_control(0) <= Const;
                    sr_br_web(0) <= '1';

                when OP_LDAR =>
                    sr_dsp_input_control(0).c <= Ram;
                    sr_block_ram_addr_control(0) <= Reg1;
                    sr_a_write_enable(0) <= '1';

                when OP_STAR =>
                    sr_block_ram_input_control(0) <= Acc;
                    sr_block_ram_addr_control(0) <= Reg1;
                    sr_br_web(0) <= '1';

                when OP_ADDA =>
                    sr_dsp_input_control(0).c <= Acc;
                    sr_dsp_input_control(0).b <= Const;
                    sr_dsp_mode(0) <= DSP_CpAB; 
                    sr_a_write_enable(0) <= '1';

                when OP_SUBA =>
                    sr_dsp_input_control(0).c <= Acc;
                    sr_dsp_input_control(0).b <= Const;
                    sr_dsp_mode(0) <= DSP_CsAB; 
                    sr_a_write_enable(0) <= '1';

                when OP_ADDAR =>
                    sr_dsp_input_control(0).c <= Acc;
                    sr_dsp_input_control(0).b <= Reg1;
                    sr_dsp_mode(0) <= DSP_CpAB; 
                    sr_a_write_enable(0) <= '1';

                when OP_SUBAR =>
                    sr_dsp_input_control(0).c <= Acc;
                    sr_dsp_input_control(0).b <= Reg1;
                    sr_dsp_mode(0) <= DSP_CsAB; 
                    sr_a_write_enable(0) <= '1';

                when OP_ADDR =>
                    sr_instruction_constant(0) <= sign_extend(s2_instruction_word(11 downto 6), word'length);
                    sr_dsp_input_control(0).c <= Reg1;
                    sr_dsp_input_control(0).b <= Const;
                    sr_dsp_mode(0) <= DSP_CpAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_SUBR =>
                    sr_instruction_constant(0) <= sign_extend(s2_instruction_word(11 downto 6), word'length);
                    sr_dsp_input_control(0).c <= Reg1;
                    sr_dsp_input_control(0).b <= Const;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_J =>
                    sr_branch(0) <= UncondBr;

                when OP_BR =>
                    sr_branch(0) <= UncondBr;

                when OP_BZ =>
                    sr_branch(0) <= CondBrZ;

                when OP_BNZ =>
                    sr_branch(0) <= CondBrNZ;

                when others =>

            end case;

            sr_instruction_constant(1 to 3) <= sr_instruction_constant(0 to 2);
            sr_write_register(1 to 6) <= sr_write_register(0 to 5);
            sr_branch(1) <= sr_branch(0);
            sr_rf_write_enable(1 to 6) <= sr_rf_write_enable(0 to 5);
            sr_a_write_enable(1 to 6) <= sr_a_write_enable(0 to 5);
            sr_br_web(1) <= sr_br_web(0);
            sr_block_ram_input_control(1) <= sr_block_ram_input_control(0);
            sr_block_ram_addr_control(1) <= sr_block_ram_addr_control(0);
            sr_dsp_input_control(1 to 3) <= sr_dsp_input_control(0 to 2);
            sr_dsp_mode(1 to 3) <= sr_dsp_mode(0 to 2);

            if reset = '1' then
                sr_branch <= (others => NoBr);
                sr_instruction_constant <= (others => (others => '0'));
                sr_write_register <= (others => (others => '0'));
                sr_rf_write_enable <= (others => '0');
                sr_a_write_enable <= (others => '0');
                sr_br_web <= (others => '0');
                sr_block_ram_input_control <= (others => Reg2);
                sr_block_ram_addr_control <= (others => Reg1);
                sr_dsp_input_control <= (others => (others => Zero));
                sr_dsp_mode <= (others => DSP_C_PASSTHROUGH);
            end if;

        end if;
        
    end process pipeline_stage_3;


    pipeline_stage_3_unclocked: process(s2_instruction_word)
    begin

        rf_inputs.addr_a <= s2_instruction_word(5 downto 0);
        rf_inputs.addr_b <= s2_instruction_word(11 downto 6);
        rf_inputs.addr_c <= (others => '0');

    end process pipeline_stage_3_unclocked;

    pipeline_stage_4: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            sr_rf_read_a(0) <= rf_read_a;
            sr_rf_read_a(1 to 3) <= sr_rf_read_a(0 to 2);

            sr_rf_read_b(0) <= rf_read_b;
            sr_rf_read_b(1 to 3) <= sr_rf_read_b(0 to 2);

            sr_rf_read_c(0) <= rf_read_c;
            sr_rf_read_c(1 to 3) <= sr_rf_read_c(0 to 2);

            sr_accumulator(0) <= a_output;
            sr_accumulator(1 to 3) <= sr_accumulator(0 to 2);

            if reset = '1' then
                sr_rf_read_a <= (others => (others => '0'));
                sr_rf_read_b <= (others => (others => '0'));
                sr_rf_read_c <= (others => (others => '0'));
                sr_accumulator <= (others => (others => '0'));
            end if;

        end if;

    end process pipeline_stage_4;


    pipeline_stage_5: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            sr_use_pc_next_address(0) <= '1';
            if sr_branch(1) = UncondBr
            or (sr_branch(1) = CondBrZ and sr_rf_read_a(1) = (word'range => '0'))
            or (sr_branch(1) = CondBrNZ and sr_rf_read_a(1) /= (word'range => '0')) then
                sr_use_pc_next_address(0) <= '0';
            end if;

            sr_use_pc_next_address(1) <= sr_use_pc_next_address(0);

            if reset = '1' then
                sr_use_pc_next_address <= (others => '1');
            end if;

        end if;

    end process pipeline_stage_5;


    pipeline_stage_5_unclocked: process
        ( sr_accumulator(1)
        , sr_rf_read_a(1)
        , sr_rf_read_b(1)
        , sr_br_web(1)
        , sr_block_ram_input_control(1)
        , sr_block_ram_addr_control(1)
        , sr_instruction_constant(1)
        )
    begin

        case sr_block_ram_input_control(1) is
            when Acc   => br_dib <= sr_accumulator(1);
            when Reg2  => br_dib <= sr_rf_read_b(1);
            when Const => br_dib <= sr_instruction_constant(1);
        end case;

        case sr_block_ram_addr_control(1) is
            when Reg1  => br_addrb <= sr_rf_read_a(1)(ram_addr'range);
            when Const => br_addrb <= sr_instruction_constant(1)(ram_addr'range);
        end case;

        br_web <= sr_br_web(1);

    end process pipeline_stage_5_unclocked;


    pipeline_stage_6: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            sr_br_dob(0) <= br_dob;

            if reset = '1' then
                sr_br_dob <= (others => (others => '0'));
            end if;

        end if;

    end process pipeline_stage_6;


    pipeline_stage_7: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

        end if;

    end process pipeline_stage_7;


    pipeline_stage_7_unclocked: process
        ( sr_rf_read_a(3)
        , sr_rf_read_b(3)
        , sr_rf_read_c(3)
        , sr_accumulator(3)
        , sr_br_dob(0)
        , sr_instruction_constant(3)
        , sr_dsp_input_control(3)
        , sr_dsp_mode(3)
        )

        type dsp_data_input_control_array_t is array (0 to 3) of dsp_input;
        variable dsp_data_input_control_array: dsp_data_input_control_array_t;

        type dsp_input_array_t is array (0 to 3) of word;
        variable dsp_in: dsp_input_array_t;

    begin

        dsp_inputs.mode <= sr_dsp_mode(3);

        dsp_data_input_control_array(0) := sr_dsp_input_control(3).a;
        dsp_data_input_control_array(1) := sr_dsp_input_control(3).b;
        dsp_data_input_control_array(2) := sr_dsp_input_control(3).c;
        dsp_data_input_control_array(3) := sr_dsp_input_control(3).d;

        dsp_in := (others => (others => '0'));

        for i in dsp_in'range loop
            case dsp_data_input_control_array(i) is
                when Zero  => dsp_in(i) := (others => '0');
                when One   => dsp_in(i)(0) := '1';
                when Ram   => dsp_in(i) := sr_br_dob(0);
                when Acc   => dsp_in(i) := sr_accumulator(3);
                when Const => dsp_in(i) := sr_instruction_constant(3);
                when Reg1  => dsp_in(i) := sr_rf_read_a(3);
                when Reg2  => dsp_in(i) := sr_rf_read_b(3);
                when Reg3  => dsp_in(i) := sr_rf_read_c(3);
            end case;
        end loop;

        dsp_inputs.a <= sign_extend(dsp_in(0), dsp_inputs.a'length);
        dsp_inputs.b <= sign_extend(dsp_in(1), dsp_inputs.b'length);
        dsp_inputs.c <= sign_extend(dsp_in(2), dsp_inputs.c'length);
        dsp_inputs.d <= sign_extend(dsp_in(3), dsp_inputs.d'length);

        next_calculated_pc <= sr_rf_read_b(3)(ram_addr'range);

    end process pipeline_stage_7_unclocked;


    pipeline_stage_8: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

        end if;

    end process pipeline_stage_8;


    pipeline_stage_9: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            sr_dsp_p(0) <= dsp_p(word'range);

            if reset = '1' then
                sr_dsp_p <= (others => (others => '0'));
            end if;

        end if;

    end process pipeline_stage_9;


    pipeline_stage_10: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

        end if;

    end process pipeline_stage_10;


    pipeline_stage_10_unclocked: process
        ( sr_write_register(6)
        , sr_rf_write_enable(6)
        , sr_dsp_p(0)
        )
    begin

        rf_inputs.write_enable <= sr_rf_write_enable(6);
        rf_inputs.addr_d <= sr_write_register(6);
        rf_inputs.write_data <= sr_dsp_p(0);

        a_input <= sr_dsp_p(0);

    end process pipeline_stage_10_unclocked;


    block_ram : entity BlockRam
    port map (
        clk => clk,
        reset => reset,
        addra => br_addra,
        addrb => br_addrb,
        dia => data,
        dib => br_dib,
        doa => br_doa,
        dob => br_dob,
        wea => we,
        web => br_web
    );


    register_file: entity RegisterFile
    port map (
        clk => clk,
        reset => reset,
        write_enable => rf_inputs.write_enable,
        addr_a => rf_inputs.addr_a,
        addr_b => rf_inputs.addr_b,
        addr_c => rf_inputs.addr_c,
        addr_d => rf_inputs.addr_d,
        write_data => rf_inputs.write_data,
        read_a => rf_read_a,
        read_b => rf_read_b,
        read_c => rf_read_c,
        read_d => rf_read_d
    );


    accumulator_inst: entity Accumulator
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        write_enable => sr_a_write_enable(6),
        input => a_input,
        output => a_output
    );


    dsp_inst: entity DSP
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        mode => dsp_inputs.mode,
        a => dsp_inputs.a,
        b => dsp_inputs.b,
        c => dsp_inputs.c,
        d => dsp_inputs.d,
        p => dsp_p
    );

end behav;
