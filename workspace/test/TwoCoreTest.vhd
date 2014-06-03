-- Template generated by mktest from ../src/Core.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Core;
use work.core_config.all;
use work.test_utils.all;
use work.opcodes.all;
use work.utils.all;
use work.twocore.all;
use work.twocore2.all;

entity TwoCoreTest is
end entity TwoCoreTest;

architecture behav of TwoCoreTest is
    signal clk: std_logic;
    signal clk_en: std_logic;
    signal reset: std_logic;
    signal addr: ram_addr;
    signal data1: word;
    signal data2: word;
    signal fifo_inputs1: core_fifo_inputs_t;
    signal fifo_inputs2: core_fifo_inputs_t;
    signal fifo_full1: std_logic_vector(core_fifo_inputs_t'range);
    signal fifo_full2: std_logic_vector(core_fifo_inputs_t'range);
    signal we1: std_logic;
    signal we2: std_logic;
    signal outputs1: core_fifo_inputs_t;
    signal outputs2: core_fifo_inputs_t;
    signal outputs_full: std_logic_vector(core_fifo_inputs_t'range);
    signal outputs_full1: std_logic_vector(core_fifo_inputs_t'range);
    signal outputs_full2: std_logic_vector(core_fifo_inputs_t'range);

    type TestData is
        record
            clk_en: std_logic;
            reset: std_logic;
            addr: ram_addr;
            data: word;
            wait_cycles: integer;
        end record;

    type TestDataArray is array (0 to 1) of TestData;
    constant test_data: TestDataArray := (
        0 =>
            ('1', '1', (others => '0'), (others => '0'), 10),
        1 =>
            ('1', '0', (others => '0'), (others => '0'), 1000)
    );



begin

    clk_gen: process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;

    Core1_inst: entity Core
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        addr => addr,
        data => data1,
        we => we1,
        fifo_inputs => fifo_inputs1,
        fifo_full => fifo_full1,
        outputs => outputs1,
        outputs_full => outputs_full1
    );


    Core2_inst: entity Core
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        addr => addr,
        data => data2,
        we => we2,
        fifo_inputs => fifo_inputs2,
        fifo_full => fifo_full2,
        outputs => outputs2,
        outputs_full => outputs_full2
    );

    set_fifo_inputs: process
        ( outputs2
        , outputs1
        , fifo_full1
        , fifo_full2
        )
    begin

        fifo_inputs1 <= outputs2;
        fifo_inputs2 <= outputs1;

        outputs_full2 <= fifo_full1;
        outputs_full1 <= fifo_full2;

    end process set_fifo_inputs;


    Core_test: process
    begin
        wait_for(1, clk);

        clk_en <= '1';
        reset <= '1';

        wait_for(1, clk);

        reset <= '0';

        for i in twocore_code'range loop
            wait_for(1, clk);

            we2 <= '0';
            we1 <= '1';

            addr <= int2slv(i, ram_addr'length);
            report integer'image(i);
            data1 <= twocore_code(i);
            report "Loading data '" & to_string(twocore_code(i)) & "' to address " & integer'image(i);
        end loop;

        wait_for(1, clk);

        for i in twocore2_code'range loop
            wait_for(1, clk);

            we1 <= '0';
            we2 <= '1';

            addr <= int2slv(i, ram_addr'length);
            report integer'image(i);
            data2 <= twocore2_code(i);
            report "Loading data '" & to_string(twocore2_code(i)) & "' to address " & integer'image(i);
        end loop;

        wait_for(1, clk);

        we1 <= '0';
        we2 <= '0';

        for i in test_data'range loop

            clk_en <= test_data(i).clk_en;
            reset <= test_data(i).reset;
            addr <= test_data(i).addr;

            wait_for(test_data(i).wait_cycles, clk);

        end loop;

        report "DONE" severity failure;
    end process Core_test;

end architecture behav;

