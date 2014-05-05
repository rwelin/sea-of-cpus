library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RegisterFile;
use work.core_config.all;
use work.test_utils.all;
use work.core_utils.all;

entity RegisterFileTest is
end entity RegisterFileTest;

architecture behav of RegisterFileTest is
    signal clk, reset, write_enable: std_logic;
    signal addr_a, addr_b, addr_c, addr_d: register_addr;
    signal write_data: word;
    signal read_a, read_b, read_c, read_d: word;

    type TestData is
        record
            reset: std_logic;
            write_enable: std_logic;
            addr_a: register_addr;
            addr_b: register_addr;
            addr_c: register_addr;
            addr_d: register_addr;
            write_data: word;
            read_a: word;
            read_b: word;
            read_c: word;
            read_d: word;
            wait_cycles: integer;
        end record;

    type TestDataArray is array (0 to 5) of TestData;
    constant test_data: TestDataArray := (
        0 => -- Read ports should be set to zero on reset.
            ('1', '0', (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'),
             (others => '0'), (others => '0'), (others => '0'), (others => '0'), 1),

        1 => -- outputs should be synchronously written to when `write_enable' is set
            ('0', '1', (others => '0'), (others => '0'), (others => '0'), (others => '0'), int2word(1),
             (others => '0'), (others => '0'), (others => '0'), (others => '0'), 0),

        2 => -- ditto
            ('0', '1', (others => '0'), (others => '0'), (others => '0'), (others => '0'), int2word(1),
             (others => '0'), (others => '0'), (others => '0'), (others => '0'), 1),

        3 => -- ditto
            ('0', '0', (others => '0'), (others => '0'), (others => '0'), (others => '0'), int2word(1),
             int2word(1), int2word(1), int2word(1), int2word(1), 1),

        4 => -- register file should not be written to when `write_enable' is cleared
            ('0', '0', (others => '0'), (others => '0'), (others => '0'), (others => '0'), int2word(2),
             int2word(1), int2word(1), int2word(1), int2word(1), 2),

        5 => -- ditto
            ('0', '0', (others => '0'), (others => '0'), (others => '0'), (2 => '1', others => '0'), int2word(1),
             int2word(1), int2word(1), int2word(1), (others => '0'), 3)

    );

begin

    clk_gen : process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;

    register_file_inst : entity RegisterFile
    port map (
        clk => clk,
        reset => reset,
        write_enable => write_enable,
        addr_a => addr_a,
        addr_b => addr_b,
        addr_c => addr_c,
        addr_d => addr_d,
        write_data => write_data,
        read_a => read_a,
        read_b => read_b,
        read_c => read_c,
        read_d => read_d
    );

    sample_core_test : process
    begin
        wait until clk'event and clk = '1';

        for i in test_data'range loop
            reset <= test_data(i).reset;
            write_enable <= test_data(i).write_enable;
            addr_a <= test_data(i).addr_a;
            addr_b <= test_data(i).addr_b;
            addr_c <= test_data(i).addr_c;
            addr_d <= test_data(i).addr_d;
            write_data <= test_data(i).write_data;

            wait_for(test_data(i).wait_cycles, clk);

            assert read_a = test_data(i).read_a
            report "Test " & integer'image(i) & ":" &
                " read_a is " & to_string(read_a) &
                " should be " & to_string(test_data(i).read_a)
            severity failure;

            assert read_b = test_data(i).read_b
            report "Test " & integer'image(i) & ":" &
                " read_b is " & to_string(read_b) &
                " should be " & to_string(test_data(i).read_b)
            severity failure;

            assert read_c = test_data(i).read_c
            report "Test " & integer'image(i) & ":" &
                " read_c is " & to_string(read_c) &
                " should be " & to_string(test_data(i).read_c)
            severity failure;

            assert read_d = test_data(i).read_d
            report "Test " & integer'image(i) & ":" &
                " read_d is " & to_string(read_d) &
                " should be " & to_string(test_data(i).read_d)
            severity failure;
        end loop;

        wait_for(10, clk);

        report "DONE" severity failure;
    end process sample_core_test;

end behav;

