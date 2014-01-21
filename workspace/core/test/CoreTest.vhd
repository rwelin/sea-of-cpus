library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.core_interface.all;

entity CoreTest is
end CoreTest;

architecture behav of CoreTest is

    signal clk: std_logic;
    signal reset: std_logic;
    signal addr: ram_addr;
    signal data: word;
    signal we: std_logic;

begin

    CoreInst : entity Core
    port map (
        clk => clk,
        reset => reset,
        addr => addr,
        data => data,
        we => we
    );

    ClkGen : process
    begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process ClkGen;

    Test : process
    begin
        reset <= '1';
        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        reset <= '0';

        we <= '1';
        addr <= (others => '0');
        data <= OP_MOVA & "010101010101";

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(1, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(2, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(3, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(4, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(5, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';
        addr <= std_logic_vector(to_unsigned(6, RAM_ADDR_LENGTH));
        data <= (others => '0');

        wait until clk'event and clk = '1';

        we <= '0';

        

        wait for 2000 ns;

        report "Done" severity failure;

    end process Test;

end behav;
