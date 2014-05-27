library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SysUnit;
use work.core_config.all;
use work.test_utils.all;
use work.opcodes.all;
use work.utils.all;
use work.movre.all;

entity SysUnitTest is
end entity SysUnitTest;

architecture behav of SysUnitTest is
    signal clk: std_logic;
    signal clk_en: std_logic;
    signal reset: std_logic;
    signal addr: ram_addr;
    signal data: word;
    signal we: std_logic;
    signal output: word;
    signal input_data: word;
    signal write_req: std_logic;

    type TestData is
        record
            clk_en: std_logic;
            reset: std_logic;
            addr: ram_addr;
            data: word;
            we: std_logic;
            output: word;
            input_data: word;
            write_req: std_logic;
            wait_cycles: integer;
        end record;

    type TestDataArray is array (0 to 3) of TestData;
    constant test_data: TestDataArray := (
        0 =>
            ('1', '1', (others => '0'), (others => '0'), '0', (others => '0'), (others => '0'), '0', 10),
        1 =>
            ('1', '0', (others => '0'), (others => '0'), '0', (others => '0'), (others => '0'), '0', 30),
        2 =>
            ('1', '0', (others => '0'), (others => '0'), '0', (others => '0'), int2slv(11, WORD_LENGTH), '1', 1),
        3 =>
            ('1', '0', (others => '0'), (others => '0'), '0', (others => '0'), (others => '0'), '0', 30)
    );

begin

    clk_gen: process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;

    SysUnit_inst: entity SysUnit
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        addr => addr,
        data => data,
        we => we,
        output => output,
        input_data => input_data,
        write_req => write_req
    );

    SysUnit_test: process
    begin
        wait_for(1, clk);

        clk_en <= '1';
        reset <= '1';
        we <= '1';

        wait_for(1, clk);

        reset <= '0';

        for i in movre_code'range loop
            wait_for(1, clk);

            addr <= int2slv(i, ram_addr'length);
            report integer'image(i);
            data <= movre_code(i);
            report "Loading data '" & to_string(movre_code(i)) & "' to address " & integer'image(i);
        end loop;

        wait_for(1, clk);

        for i in test_data'range loop

            clk_en <= test_data(i).clk_en;
            reset <= test_data(i).reset;
            addr <= test_data(i).addr;
            data <= test_data(i).data;
            we <= test_data(i).we;
            input_data <= test_data(i).input_data;
            write_req <= test_data(i).write_req;

            wait_for(test_data(i).wait_cycles, clk);

            assert output = test_data(i).output
            report "Test " & integer'image(i) & ":" &
                " `output' is " & to_string(output) &
                " should be " & to_string(test_data(i).output)
            severity failure;

        end loop;

        report "DONE" severity failure;
    end process SysUnit_test;

end architecture behav;

