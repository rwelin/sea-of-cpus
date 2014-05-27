library ieee;
use ieee.std_logic_1164.all;
use work.all;
use work.core_config.all;

entity SysUnit is
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        addr: in ram_addr;
        data: in word;
        we: in std_logic;
        output: out word;
        input_data: in word;
        write_req: in std_logic
    );
end SysUnit;


architecture behav of SysUnit is
    
    signal fifo_output: word;
    signal fifo_valid: std_logic;

    signal core_data_input: word;
    signal core_clk_en: std_logic;
    signal core_read_req: std_logic;

begin


    set_core_data_input: process
        ( fifo_output
        , data
        )
    begin

        core_data_input <= data;
        if we = '0' then
            core_data_input <= fifo_output;
        end if;

    end process set_core_data_input;


    set_core_clk_en: process
        ( fifo_valid
        , core_read_req
        , clk_en
        )
    begin

        core_clk_en <= '1';
        if clk_en = '0' or (core_read_req = '1' and fifo_valid = '0') then
            core_clk_en <= '0';
        end if;

    end process set_core_clk_en;


    core_inst: entity Core
    port map (
        clk => clk,
        clk_en => core_clk_en,
        reset => reset,
        addr => addr,
        data => core_data_input,
        we => we,
        read_req => core_read_req,
        output => output
    );


    fifo_inst: entity FIFO
    generic map (
        size => 16,
        word_len => WORD_LENGTH
    )
    port map (
        clk => clk,
        clk_en => clk_en,
        input_data => input_data,
        write_req => write_req,
        output_data => fifo_output,
        valid => fifo_valid
    );

end behav;
