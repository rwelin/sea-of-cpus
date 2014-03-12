library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.core_config.all;
use work.opcodes.all;
use work.instruction_decode.all;

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

    signal instr_word: word;

    type opcode_sr_t is array (0 to 6) of opcode;
    signal opcode_sr: opcode_sr_t;

    signal pc: ram_addr;

    signal rf_inputs: RegisterFileInputs;
    signal rf_read_a: word;
    signal rf_read_b: word;
    signal rf_read_c: word;
    signal rf_read_d: word;

    signal dsp_inputs: DSPInputs;
    signal dsp_p: std_logic_vector(47 downto 0);

    signal a_write_enable: std_logic;
    signal a_input: word;
    signal a_output: word;

begin

    output <= a_input;
    br_web <= '0';


    shift_pipeline_opcode: process
    begin
        wait until clk'event and clk = '1';
        opcode_sr(0) <= decode_opcode(instr_word);
        opcode_sr(1 to 6) <= opcode_sr(0 to 5);
    end process shift_pipeline_opcode;


    fetch_instruction_word: process(pc, addr, we, br_doa)
    begin
        br_addra <= pc;
        instr_word <= br_doa;
        if we = '1' then
            br_addra <= addr;
            instr_word <= (others => '0');
        end if;
    end process fetch_instruction_word;


    calculate_program_counter: process
    begin
        wait until clk'event and clk = '1';

        if we = '0' then
            pc <= std_logic_vector(unsigned(pc) + 1);
        end if;

        if reset = '1' then
            pc <= (others => '0');
        end if;
    end process calculate_program_counter;


    set_dsp_inputs: process
        variable dsp_data_inputs: DSPDataInputs;
    begin
        wait until clk'event and clk = '1';

        dsp_data_inputs.accum := (others => '0');
        dsp_data_inputs.reg_a := (others => '0');
        dsp_data_inputs.reg_b := (others => '0');
        dsp_data_inputs.mem_a := (others => '0');
        dsp_data_inputs.const := (others => '0');

        dsp_inputs <= decode_dsp_inputs(opcode_sr(4), dsp_data_inputs);
    end process set_dsp_inputs;


    set_rf_inputs: process
    begin
        wait until clk'event and clk = '1';

        rf_inputs.write_enable <= '0';
        rf_inputs.addr_a <= (others => '0');
        rf_inputs.addr_b <= (others => '0');
        rf_inputs.addr_c <= (others => '0');
        rf_inputs.addr_d <= (others => '0');
        rf_inputs.write_data <= (others => '0');
    end process set_rf_inputs;


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
        read_a => rf_inputs.read_a,
        read_b => rf_inputs.read_b,
        read_c => rf_inputs.read_c,
        read_d => rf_inputs.read_d
    );


    accumulator_inst: entity Accumulator
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        write_enable => a_write_enable,
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
