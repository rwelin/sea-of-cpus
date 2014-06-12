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
use work.vtypes.all;

entity Core is
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        addr: in ram_addr;
        data: in word;
        we: in std_logic;
        fifo_inputs: in core_fifo_inputs_t;
        fifo_full: out std_logic_vector(0 to NUM_CORE_FIFOS-1);
        outputs: out core_fifo_inputs_t;
        outputs_full: in std_logic_vector(0 to NUM_CORE_FIFOS-1)
    );
end Core;

architecture behav of Core is

    signal br_addra: ram_addr;
    signal br_addrb: ram_addr;
    signal br_doa: word;
    signal br_dob: word;
    signal br_dib: word;
    signal br_web: std_logic;

    signal core_en: std_logic;

    signal program_counter: ram_addr; -- Program counter
    signal sr_stall_pc: std_logic_vector(0 to 1); -- Indicates whether to hold the PC or not
    signal next_calculated_pc: ram_addr; -- Next instruction memory address

    signal rf_inputs: RegisterFileInputs;
    signal rf_read_a: word;
    signal rf_read_b: word;
    signal rf_read_c: word;
    signal rf_read_d: word;

    signal dsp_inputs: DSPInputs;
    signal dsp_p: slv48_t;

    signal a_write_enable: std_logic;
    signal a_input: slv48_t;
    signal a_output: slv48_t;

    signal s2_instruction_word: word;
    signal resume_instruction_word: word;
    signal repeat_instruction: std_logic;

    -- Data shift registers
    --

    type sr_rf_read_a_t is array (0 to 3) of word;
    signal sr_rf_read_a: sr_rf_read_a_t;

    type sr_rf_read_b_t is array (0 to 3) of word;
    signal sr_rf_read_b: sr_rf_read_b_t;

    type sr_accumulator_t is array (0 to 3) of slv48_t;
    signal sr_accumulator: sr_accumulator_t;

    type sr_br_dob_t is array (0 to 0) of word;
    signal sr_br_dob: sr_br_dob_t;

    type sr_br_doa_t is array (0 to 0) of word;
    signal sr_br_doa: sr_br_doa_t;

    type sr_instruction_constant_t is array (0 to 3) of word;
    signal sr_instruction_constant: sr_instruction_constant_t;

    type sr_write_register_t is array (0 to 8) of register_addr;
    signal sr_write_register: sr_write_register_t;

    type sr_dsp_p_t is array (0 to 0) of slv48_t;
    signal sr_dsp_p: sr_dsp_p_t;

    type sr_dsp_a_t is array (0 to 0) of slv30_t;
    signal sr_dsp_a: sr_dsp_a_t;

    type sr_dsp_b_t is array (0 to 0) of slv18_t;
    signal sr_dsp_b: sr_dsp_b_t;

    type sr_dsp_c_t is array (0 to 1) of slv48_t;
    signal sr_dsp_c: sr_dsp_c_t;

    type sr_dsp_d_t is array (0 to 0) of slv25_t;
    signal sr_dsp_d: sr_dsp_d_t;

    -- Control flags
    --

    type sr_core_we_t is array (0 to 1) of std_logic;
    signal sr_core_we: sr_core_we_t;

    type sr_a_write_enable_t is array (0 to 8) of std_logic;
    signal sr_a_write_enable: sr_a_write_enable_t;

    type sr_rf_write_enable_t is array (0 to 8) of std_logic;
    signal sr_rf_write_enable: sr_rf_write_enable_t;

    type sr_br_web_t is array (0 to 1) of std_logic;
    signal sr_br_web: sr_br_web_t;

    type sr_dsp_input_control_a_t is array (0 to 3) of dsp_input_control_a_t;
    signal sr_dsp_input_control_a: sr_dsp_input_control_a_t;

    type sr_dsp_input_control_b_t is array (0 to 3) of dsp_input_control_b_t;
    signal sr_dsp_input_control_b: sr_dsp_input_control_b_t;

    type sr_dsp_input_control_c_t is array (0 to 3) of dsp_input_control_c_t;
    signal sr_dsp_input_control_c: sr_dsp_input_control_c_t;

    type sr_dsp_mode_t is array (0 to 5) of DSPMode;
    signal sr_dsp_mode: sr_dsp_mode_t;

    type sr_block_ram_input_control_t is array (0 to 1) of BlockRamDataInputControlB;
    signal sr_block_ram_input_control: sr_block_ram_input_control_t;

    type sr_block_ram_addr_control_a_t is array (0 to 1) of BlockRamAddrControlA;
    signal sr_block_ram_addr_control_a: sr_block_ram_addr_control_a_t;

    type sr_block_ram_addr_control_b_t is array (0 to 1) of BlockRamAddrControlB;
    signal sr_block_ram_addr_control_b: sr_block_ram_addr_control_b_t;

    type sr_branch_type_t is array (0 to 3) of BranchOp;
    signal sr_branch_type: sr_branch_type_t;

    type sr_instruction_type_t is array(0 to 8) of InstructionType;
    signal sr_instruction_type: sr_instruction_type_t;

    type sr_increment_cmac_registers_t is array (0 to 1) of std_logic;
    signal sr_increment_cmac_registers: sr_increment_cmac_registers_t;

    -- Indicates whether to simply increment the PC or use `next_calculated_pc'
    type sr_use_pc_next_address_t is array (0 to 1) of std_logic;
    signal sr_use_pc_next_address: sr_use_pc_next_address_t;

    signal op: opcode;


    -- CMAC registers
    --

    signal coefa: ram_addr; -- Base address of coefficients
    signal dataa: ram_addr; -- Base address of data
    signal datao: ram_addr; -- Offset in circular buffer starting from dataa
    signal datam: ram_addr; -- Bitmask for circular buffer
    signal cmac_counter: ram_addr; -- Index variable during the multiply accumulate

    signal cmac_coef_addr: ram_addr;
    signal cmac_data_addr: ram_addr;
    signal cmac_last_data_addr: ram_addr;
    signal rotate_cmac_data_addr: std_logic_vector(0 to 1);


    -- FIFO signal
    --

    subtype fifo_index_t is integer range 0 to NUM_CORE_FIFOS-1;
    type sr_fifo_index_t is array (0 to 3) of fifo_index_t;
    type sr_fifo_rd_en_t is array (0 to 2) of core_fifo_rd_en_t;
    type sr_outputs_wr_en_t is array (0 to 2) of core_fifo_wr_en_t;

    signal sr_fifo_rd_en: sr_fifo_rd_en_t;
    signal sr_fifo_index: sr_fifo_index_t;
    signal sr_outputs_wr_en: sr_outputs_wr_en_t;

    signal fifo_outputs: core_fifo_outputs_t;


begin


    op <= s2_instruction_word(17 downto 12);


    set_core_en: process
    begin
        wait until clk'event and clk = '1';

        core_en <= clk_en;
        if (sr_fifo_rd_en(1)(sr_fifo_index(1)) = '1' and
            fifo_outputs(sr_fifo_index(1)).empty = '1') or
           (outputs_full(sr_fifo_index(1)) = '1' and
            sr_outputs_wr_en(1)(sr_fifo_index(1)) = '1') then
            core_en <= '0';
        end if;

        if core_en = '0' and
           ((sr_fifo_rd_en(2)(sr_fifo_index(2)) = '1' and
            fifo_outputs(sr_fifo_index(2)).empty = '1') or
           (outputs_full(sr_fifo_index(2)) = '1' and
           sr_outputs_wr_en(2)(sr_fifo_index(2)) = '1')) then
            core_en <= '0';
        end if;

    end process set_core_en;




    set_fifo_full: process
        ( fifo_outputs
        )
    begin

        for i in fifo_outputs'range loop
            fifo_full(i) <= fifo_outputs(i).full;
        end loop;

    end process set_fifo_full;


    set_outputs: process
        ( clk
        , sr_rf_read_a(2)
        , sr_outputs_wr_en(2)
        )
    begin

        for i in outputs'range loop
            outputs(i).wr_clk <= clk;
            outputs(i).din <= sr_rf_read_a(2);
            outputs(i).wr_en <= sr_outputs_wr_en(2)(i);
        end loop;

    end process set_outputs;


    pipeline_stage_1: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            ------------
            -- Update PC

            if we = '0' and sr_stall_pc(0) = '0' then
                if sr_use_pc_next_address(1) = '0' then
                    program_counter <= next_calculated_pc;
                else
                    program_counter <= std_logic_vector(unsigned(program_counter) + 1);
                end if;
            end if;

            sr_core_we(0) <= we;
            sr_core_we(1) <= sr_core_we(0);

            if reset = '1' then
                program_counter <= (others => '0');
            end if;

        end if;

    end process pipeline_stage_1;


    pipeline_stage_1_unclocked: process
        ( program_counter
        , addr
        , we
        , sr_block_ram_addr_control_a(1)
        , cmac_coef_addr
        )
    begin

        ---------------------------------
        -- Set instruction memory address

        case sr_block_ram_addr_control_a(1) is
            when PC => br_addra <= program_counter;
            when CmacCoef => br_addra <= cmac_coef_addr;
        end case;

        if we = '1' then
            br_addra <= addr;
        end if;

    end process pipeline_stage_1_unclocked;


    pipeline_stage_2: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            if repeat_instruction = '0' then
                s2_instruction_word <= br_doa;
                if sr_stall_pc(0) = '1' then
                    s2_instruction_word <= (others => '0');
                end if;
            end if;

            if repeat_instruction = '1' and sr_stall_pc(0) = '0' then
                resume_instruction_word <= br_doa;
            end if;

            if sr_stall_pc(0) = '0' and sr_stall_pc(1) = '1' then
                s2_instruction_word <= resume_instruction_word;
            end if;

            repeat_instruction <= '0';
            if s2_instruction_word(17 downto 12) = OP_CMAC and
               unsigned(cmac_counter) > 3 then
                repeat_instruction <= '1';
                s2_instruction_word <= s2_instruction_word;
            end if;

            if reset = '1' or sr_core_we(1) = '1' then
                s2_instruction_word <= (others => '0');
                repeat_instruction <= '0';
                resume_instruction_word <= (others => '0');
            end if;

        end if;

    end process pipeline_stage_2;


    pipeline_stage_3: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            sr_fifo_rd_en(0) <= (others => '0');
            sr_outputs_wr_en(0) <= (others => '0');
            sr_fifo_index(0) <= 0;

            sr_stall_pc(0) <= '0';
            sr_stall_pc(1) <= sr_stall_pc(0);

            sr_increment_cmac_registers(0) <= '0';

            sr_instruction_constant(0) <= sign_extend(s2_instruction_word(11 downto 0), word'length);

            sr_write_register(0) <= s2_instruction_word(11 downto 6);

            sr_branch_type(0) <= NoBr;

            sr_block_ram_input_control(0) <= Acc;
            sr_block_ram_addr_control_b(0) <= Const;
            sr_block_ram_addr_control_a(0) <= PC;

            sr_instruction_type(0) <= Normal;

            sr_rf_write_enable(0) <= '0';
            sr_a_write_enable(0) <= '0';
            sr_br_web(0) <= '0';

            sr_dsp_input_control_a(0) <= Zero;
            sr_dsp_input_control_b(0) <= Zero;
            sr_dsp_input_control_c(0) <= Zero;

            sr_dsp_mode(0) <= DSP_C_PASSTHROUGH;

            case op is
                when OP_MOVA =>
                    sr_dsp_input_control_c(0) <= Const;
                    sr_a_write_enable(0) <= '1';

                when OP_MOVAR =>
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_a_write_enable(0) <= '1';

                when OP_MOVR =>
                    sr_dsp_input_control_c(0) <= Const;
                    sr_instruction_constant(0) <= sign_extend(s2_instruction_word(5 downto 0), word'length);
                    sr_rf_write_enable(0) <= '1';

                when OP_MOVRA =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_rf_write_enable(0) <= '1';

                when OP_MOVRR =>
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_rf_write_enable(0) <= '1';

                when OP_LDA =>
                    sr_dsp_input_control_c(0) <= Ram2;
                    sr_block_ram_addr_control_b(0) <= Const;
                    sr_a_write_enable(0) <= '1';

                when OP_STA =>
                    sr_block_ram_input_control(0) <= Acc;
                    sr_block_ram_addr_control_b(0) <= Const;
                    sr_br_web(0) <= '1';

                when OP_LDAR =>
                    sr_dsp_input_control_c(0) <= Ram2;
                    sr_block_ram_addr_control_b(0) <= Reg1;
                    sr_a_write_enable(0) <= '1';

                when OP_STAR =>
                    sr_block_ram_input_control(0) <= Acc;
                    sr_block_ram_addr_control_b(0) <= Reg1;
                    sr_br_web(0) <= '1';

                when OP_LDRR =>
                    sr_dsp_input_control_c(0) <= Ram2;
                    sr_block_ram_addr_control_b(0) <= Reg2;
                    sr_rf_write_enable(0) <= '1';

                when OP_STRR =>
                    sr_block_ram_input_control(0) <= Reg2;
                    sr_block_ram_addr_control_b(0) <= Reg1;
                    sr_rf_write_enable(0) <= '1';

                when OP_ADDA =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_dsp_input_control_b(0) <= Const;
                    sr_dsp_mode(0) <= DSP_CpAB;
                    sr_a_write_enable(0) <= '1';

                when OP_SUBA =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_dsp_input_control_b(0) <= Const;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_a_write_enable(0) <= '1';

                when OP_ADDAR =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_dsp_input_control_b(0) <= Reg1;
                    sr_dsp_mode(0) <= DSP_CpAB;
                    sr_a_write_enable(0) <= '1';

                when OP_SUBAR =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_dsp_input_control_b(0) <= Reg1;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_a_write_enable(0) <= '1';

                when OP_ADDR =>
                    sr_instruction_constant(0) <= sign_extend(s2_instruction_word(5 downto 0), word'length);
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Const;
                    sr_dsp_mode(0) <= DSP_CpAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_SUBR =>
                    sr_instruction_constant(0) <= sign_extend(s2_instruction_word(5 downto 0), word'length);
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Const;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_ADDRM =>
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Ram1;
                    sr_dsp_mode(0) <= DSP_CpAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_SUBRM =>
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Ram1;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_MAC =>
                    sr_dsp_input_control_c(0) <= Acc;
                    sr_dsp_input_control_a(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Reg2;
                    sr_dsp_mode(0) <= DSP_CpAtB;
                    sr_a_write_enable(0) <= '1';
                    sr_instruction_type(0) <= Mult;

                when OP_MACP =>
                    sr_dsp_input_control_c(0) <= DspOut;
                    sr_dsp_input_control_a(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= Reg2;
                    sr_dsp_mode(0) <= DSP_CpAtB;
                    sr_a_write_enable(0) <= '1';
                    sr_instruction_type(0) <= Mult;

                when OP_MACPM =>
                    sr_dsp_input_control_c(0) <= DspOut;
                    sr_dsp_input_control_a(0) <= Ram2;
                    sr_dsp_input_control_b(0) <= Reg2;
                    sr_block_ram_addr_control_b(0) <= Reg1;
                    sr_dsp_mode(0) <= DSP_CpAtB;
                    sr_a_write_enable(0) <= '1';
                    sr_instruction_type(0) <= Mult;

                when OP_COEFA =>
                    coefa <= s2_instruction_word(ram_addr'range);

                when OP_DATAA =>
                    dataa <= s2_instruction_word(ram_addr'range);

                when OP_DATAO =>
                    datao <= s2_instruction_word(ram_addr'range);

                when OP_DATAM =>
                    datam <= s2_instruction_word(ram_addr'range);

                when OP_CMAC =>
                    sr_instruction_type(0) <= Mult;
                    sr_increment_cmac_registers(0) <= '1';
                    if signed(cmac_counter) > 1 then
                        sr_stall_pc(0) <= '1';
                        sr_a_write_enable(0) <= '1';
                        sr_block_ram_addr_control_a(0) <= CmacCoef;
                        sr_block_ram_addr_control_b(0) <= CmacData;
                        sr_dsp_mode(0) <= DSP_PpAtB;
                        sr_dsp_input_control_c(0) <= Zero;
                        sr_dsp_input_control_a(0) <= Ram2;
                        sr_dsp_input_control_b(0) <= Ram1;
                    end if;

                when OP_CSTR =>
                    sr_block_ram_input_control(0) <= Reg2;
                    sr_block_ram_addr_control_b(0) <= CmacData;
                    sr_br_web(0) <= '1';
                    if signed(datao) > 0 then
                        datao <= std_logic_vector(unsigned(datao)-1);
                    else
                        datao <= datam;
                    end if;

                when OP_J =>
                    sr_branch_type(0) <= UncondJ;

                when OP_BR =>
                    sr_branch_type(0) <= UncondBr;

                when OP_BZ =>
                    sr_branch_type(0) <= CondBrZ;

                when OP_BNZ =>
                    sr_branch_type(0) <= CondBrNZ;

                when OP_BNZD =>
                    sr_branch_type(0) <= CondBrNZ;
                    sr_dsp_input_control_c(0) <= Reg1;
                    sr_dsp_input_control_b(0) <= One;
                    sr_dsp_mode(0) <= DSP_CsAB;
                    sr_rf_write_enable(0) <= '1';

                when OP_MOVRF =>
                    sr_dsp_input_control_c(0) <= ExtData;
                    sr_fifo_rd_en(0)(to_integer(unsigned(s2_instruction_word(5 downto 0)))) <= '1';
                    sr_fifo_index(0) <= to_integer(unsigned(s2_instruction_word(5 downto 0)));
                    sr_rf_write_enable(0) <= '1';

                when OP_MOVFR =>
                    sr_outputs_wr_en(0)(to_integer(unsigned(s2_instruction_word(5 downto 0)))) <= '1';
                    sr_fifo_index(0) <= to_integer(unsigned(s2_instruction_word(5 downto 0)));

                when others =>

            end case;

            sr_fifo_rd_en(1 to 2) <= sr_fifo_rd_en(0 to 1);
            sr_outputs_wr_en(1 to 2) <= sr_outputs_wr_en(0 to 1);
            sr_fifo_index(1 to 3) <= sr_fifo_index(0 to 2);
            sr_dsp_input_control_a(1 to 3) <= sr_dsp_input_control_a(0 to 2);
            sr_dsp_input_control_b(1 to 3) <= sr_dsp_input_control_b(0 to 2);
            sr_dsp_input_control_c(1 to 3) <= sr_dsp_input_control_c(0 to 2);
            sr_instruction_constant(1 to 3) <= sr_instruction_constant(0 to 2);
            sr_write_register(1 to 8) <= sr_write_register(0 to 7);
            sr_branch_type(1 to 3) <= sr_branch_type(0 to 2);
            sr_instruction_type(1 to 8) <= sr_instruction_type(0 to 7);
            sr_rf_write_enable(1 to 8) <= sr_rf_write_enable(0 to 7);
            sr_a_write_enable(1 to 8) <= sr_a_write_enable(0 to 7);
            sr_br_web(1) <= sr_br_web(0);
            sr_block_ram_input_control(1) <= sr_block_ram_input_control(0);
            sr_block_ram_addr_control_a(1) <= sr_block_ram_addr_control_a(0);
            sr_block_ram_addr_control_b(1) <= sr_block_ram_addr_control_b(0);
            sr_increment_cmac_registers(1) <= sr_increment_cmac_registers(0);
            sr_dsp_mode(1 to 5) <= sr_dsp_mode(0 to 4);

        end if;

    end process pipeline_stage_3;


    pipeline_stage_3_unclocked: process(s2_instruction_word)
    begin

        rf_inputs.addr_a <= s2_instruction_word(11 downto 6);
        rf_inputs.addr_b <= s2_instruction_word(5 downto 0);

    end process pipeline_stage_3_unclocked;


    pipeline_stage_4: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            sr_rf_read_a(0) <= rf_read_a;
            sr_rf_read_a(1 to 3) <= sr_rf_read_a(0 to 2);

            sr_rf_read_b(0) <= rf_read_b;
            sr_rf_read_b(1 to 3) <= sr_rf_read_b(0 to 2);

            sr_accumulator(0) <= a_output;
            sr_accumulator(1 to 3) <= sr_accumulator(0 to 2);

            cmac_counter <= datam;
            cmac_data_addr <= std_logic_vector(unsigned(dataa)+unsigned(datao));
            cmac_last_data_addr <= std_logic_vector(unsigned(datam)-unsigned(datao));
            cmac_coef_addr <= coefa;
            rotate_cmac_data_addr(0) <= '0';
            rotate_cmac_data_addr(1) <= rotate_cmac_data_addr(0);

            if sr_increment_cmac_registers(0) = '1' then
                if signed(cmac_last_data_addr)-1 < 0 then
                    rotate_cmac_data_addr(0) <= '1';
                end if;
                cmac_last_data_addr <= std_logic_vector(unsigned(cmac_last_data_addr)-1);
            end if;

            if sr_increment_cmac_registers(1) = '1' then
                cmac_counter <= std_logic_vector(unsigned(cmac_counter)-1);
                cmac_data_addr <= std_logic_vector(unsigned(cmac_data_addr)+1);
                if rotate_cmac_data_addr(0) = '1' and rotate_cmac_data_addr(1) = '0' then
                    cmac_data_addr <= dataa;
                end if;
                cmac_coef_addr <= std_logic_vector(unsigned(cmac_coef_addr)+1);
            end if;

        end if;

    end process pipeline_stage_4;


    pipeline_stage_5: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            sr_use_pc_next_address(0) <= '1';
            if sr_branch_type(1) = UncondBr
            or sr_branch_type(1) = UncondJ
            or (sr_branch_type(1) = CondBrZ and sr_rf_read_a(1) = (word'range => '0'))
            or (sr_branch_type(1) = CondBrNZ and sr_rf_read_a(1) /= (word'range => '0')) then
                sr_use_pc_next_address(0) <= '0';
            end if;

            sr_use_pc_next_address(1) <= sr_use_pc_next_address(0);

        end if;

    end process pipeline_stage_5;


    pipeline_stage_5_unclocked: process
        ( sr_accumulator(1)
        , sr_rf_read_a(1)
        , sr_rf_read_b(1)
        , sr_br_web(1)
        , sr_block_ram_input_control(1)
        , sr_block_ram_addr_control_b(1)
        , sr_instruction_constant(1)
        , cmac_data_addr
        )
    begin

        case sr_block_ram_input_control(1) is
            when Acc   => br_dib <= sr_accumulator(1)(word'range);
            when Reg2  => br_dib <= sr_rf_read_b(1);
            when Const => br_dib <= sr_instruction_constant(1);
        end case;

        case sr_block_ram_addr_control_b(1) is
            when Reg1  => br_addrb <= sr_rf_read_a(1)(ram_addr'range);
            when Reg2  => br_addrb <= sr_rf_read_b(1)(ram_addr'range);
            when Const => br_addrb <= sr_instruction_constant(1)(ram_addr'range);
            when CmacData => br_addrb <= cmac_data_addr;
        end case;

        br_web <= sr_br_web(1);

    end process pipeline_stage_5_unclocked;


    pipeline_stage_6: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            sr_br_doa(0) <= br_doa;
            sr_br_dob(0) <= br_dob;

        end if;

    end process pipeline_stage_6;


    pipeline_stage_7: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            case sr_dsp_input_control_a(3) is
                when Zero   => sr_dsp_a(0) <= (others => '0');
                when Ram2   => sr_dsp_a(0) <= sign_extend(sr_br_dob(0), sr_dsp_a(0)'length);
                when Reg1   => sr_dsp_a(0) <= sign_extend(sr_rf_read_a(3), sr_dsp_a(0)'length);
            end case;

            case sr_dsp_input_control_b(3) is
                when Zero   => sr_dsp_b(0) <= (others => '0');
                when One    => sr_dsp_b(0) <= (0 => '1', others => '0');
                when Ram1   => sr_dsp_b(0) <= sr_br_doa(0);
                when Const  => sr_dsp_b(0) <= sr_instruction_constant(3);
                when Reg1   => sr_dsp_b(0) <= sr_rf_read_a(3);
                when Reg2   => sr_dsp_b(0) <= sr_rf_read_b(3);
            end case;

            case sr_dsp_input_control_c(3) is
                when Zero    => sr_dsp_c(0) <= (others => '0');
                when Ram2    => sr_dsp_c(0) <= sign_extend(sr_br_dob(0), sr_dsp_c(0)'length);
                when Acc     => sr_dsp_c(0) <= sr_accumulator(3);
                when Const   => sr_dsp_c(0) <= sign_extend(sr_instruction_constant(3), sr_dsp_c(0)'length);
                when Reg1    => sr_dsp_c(0) <= sign_extend(sr_rf_read_a(3), sr_dsp_c(0)'length);
                when DspOut  => sr_dsp_c(0) <= sr_dsp_p(0);
                when ExtData => sr_dsp_c(0) <= sign_extend(fifo_outputs(sr_fifo_index(3)).dout, sr_dsp_c(0)'length);
            end case;

            sr_dsp_c(1) <= sr_dsp_c(0);

        end if;

    end process pipeline_stage_7;

    pipeline_stage_7_unclocked: process
        ( sr_rf_read_b(3)
        , sr_instruction_constant(3)
        , sr_branch_type(3)
        )
    begin

        next_calculated_pc <= sr_rf_read_b(3)(ram_addr'range);
        if sr_branch_type(3) = UncondJ then
            next_calculated_pc <= sr_instruction_constant(3)(ram_addr'range);
        end if;

    end process pipeline_stage_7_unclocked;


    pipeline_stage_8_unclocked: process
        ( sr_dsp_a(0)
        , sr_dsp_b(0)
        , sr_dsp_c(0)
        , sr_dsp_c(1)
        , sr_dsp_d(0)
        , sr_instruction_type(5)
        , sr_dsp_mode(4)
        , sr_dsp_mode(5)
        )
    begin

        dsp_inputs.mode <= sr_dsp_mode(4);
        if sr_instruction_type(5) = Mult then
            dsp_inputs.mode <= sr_dsp_mode(5);
        end if;

        dsp_inputs.a <= sr_dsp_a(0);
        dsp_inputs.b <= sr_dsp_b(0);

        dsp_inputs.c <= sr_dsp_c(0);
        if sr_instruction_type(5) = Mult then
            dsp_inputs.c <= sr_dsp_c(1);
        end if;

        dsp_inputs.d <= sr_dsp_d(0);

    end process pipeline_stage_8_unclocked;


    pipeline_stage_10: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

            sr_dsp_p(0) <= dsp_p;

        end if;

    end process pipeline_stage_10;


    pipeline_stage_11: process
    begin
        wait until clk'event and clk = '1';

        if core_en = '1' then

        end if;

    end process pipeline_stage_11;


    pipeline_stage_11_unclocked: process
        ( sr_write_register(7)
        , sr_write_register(8)
        , sr_rf_write_enable(7)
        , sr_rf_write_enable(8)
        , sr_dsp_p(0)
        , sr_instruction_type(8)
        , sr_a_write_enable(7)
        )
    begin

        a_write_enable <= sr_a_write_enable(7);
        rf_inputs.write_enable <= sr_rf_write_enable(7);
        rf_inputs.addr_d <= sr_write_register(7);
        if sr_instruction_type(8) = Mult then
            a_write_enable <= sr_a_write_enable(8);
            rf_inputs.write_enable <= sr_rf_write_enable(8);
            rf_inputs.addr_d <= sr_write_register(8);
        end if;

        rf_inputs.write_data <= sr_dsp_p(0)(word'range);

        a_input <= sr_dsp_p(0);

    end process pipeline_stage_11_unclocked;


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


    register_file: entity ThreePortRegisterFile
    port map (
        clk => clk,
        write_enable => rf_inputs.write_enable,
        addr_a => rf_inputs.addr_a,
        addr_b => rf_inputs.addr_b,
        addr_d => rf_inputs.addr_d,
        write_data => rf_inputs.write_data,
        read_a => rf_read_a,
        read_b => rf_read_b
    );


    accumulator_inst: entity Accumulator
    port map (
        clk => clk,
        clk_en => core_en,
        reset => reset,
        write_enable => a_write_enable,
        input => a_input,
        output => a_output
    );


    dsp_inst: entity DSP
    port map (
        clk => clk,
        clk_en => core_en,
        reset => reset,
        mode => dsp_inputs.mode,
        a => dsp_inputs.a,
        b => dsp_inputs.b,
        c => dsp_inputs.c,
        d => dsp_inputs.d,
        p => dsp_p
    );


    gen_fifos: for i in 0 to (NUM_CORE_FIFOS-1) generate
        fifo_inst: entity dual_clk_fifo
        port map (
            rst => reset,
            wr_clk => fifo_inputs(i).wr_clk,
            rd_clk => clk,
            din => fifo_inputs(i).din,
            wr_en => fifo_inputs(i).wr_en,
            rd_en => sr_fifo_rd_en(2)(i),
            dout => fifo_outputs(i).dout,
            full => fifo_outputs(i).full,
            empty => fifo_outputs(i).empty
        );
    end generate gen_fifos;

end behav;
