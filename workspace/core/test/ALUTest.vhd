library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.core_interface.all;

entity ALUTest is
end ALUTest;

architecture behav of ALUTest is

    signal clk: std_logic;
    signal reset: std_logic;
    signal mode: opcode;
    signal ain, bin, acc: word;

begin

    ALUInst : entity ALU
    port map (
        clk => clk,
        reset => reset,
        mode => mode,
        ain => ain,
        bin => bin,
        acc => acc
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
        
        mode <= OP_MAC;
        ain <= (1 => '1', others => '0');
        bin <= (2 => '1', others => '0');
        reset <= '1';

        wait until clk'event and clk = '1';
        reset <= '0';

        wait for 1000 ns;
        report "Done" severity failure;
    end process Test;

end behav;

