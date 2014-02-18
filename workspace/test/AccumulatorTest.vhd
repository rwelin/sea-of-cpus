library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Accumulator;
use work.core_config.all;
use work.test.all;

entity AccumulatorTest is
end entity AccumulatorTest;

architecture behav of AccumulatorTest is
    signal clk, clk_en, reset, write_enable: std_logic;
    signal input, output: word;

    type TestData is
        record
            clk_en, reset, write_enable: std_logic;
            input, output: word;
            wait_cycles: integer;
        end record;

    type TestDataArray is array (0 to 5) of TestData;
    constant test_data: TestDataArray := (
        0 => -- `output' should be zero on reset
            ('1', '1', '0', uint2slv(1, input'length),
             uint2slv(0, output'length), 2),

        1 => -- `output' should be synchronously written to when `write_enable' is set
            ('1', '0', '1', uint2slv(1, input'length),
             uint2slv(0, output'length), 0),

        2 => -- ditto
            ('1', '0', '1', uint2slv(1, input'length),
             uint2slv(0, output'length), 1),

        3 => -- ditto
            ('1', '0', '0', uint2slv(1, input'length),
             uint2slv(1, output'length), 1),

        4 => -- accumulator should not be written to when `write_enable' is cleared
            ('1', '0', '0', uint2slv(2, input'length),
             uint2slv(1, output'length), 2),

        5 => -- accumulator should not be written to when `clk_en' is cleared
            ('0', '0', '1', uint2slv(2, input'length),
             uint2slv(1, output'length), 2)
    );

begin

    clk_gen : process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;

    accumulator_inst : entity Accumulator
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        write_enable => write_enable,
        input => input,
        output => output
    );

    sample_core_test : process
    begin

        for i in test_data'range loop
            clk_en <= test_data(i).clk_en;
            reset <= test_data(i).reset;
            write_enable <= test_data(i).write_enable;
            input <= test_data(i).input;

            wait_for(test_data(i).wait_cycles, clk);

            assert output = test_data(i).output
            report "Test " & integer'image(i) & ":" &
                " output is " & to_string(output) &
                " should be " & to_string(test_data(i).output)
            severity failure;
        end loop;

        report "DONE" severity failure;
    end process sample_core_test;

end behav;
