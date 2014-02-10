library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.test.all;

entity SampleCoreTest is
end entity SampleCoreTest;

architecture behav of SampleCoreTest is
    signal clk : std_logic;
    
    signal a, b, sum : std_logic_vector(7 downto 0);
    signal carry : std_logic;
begin

    clk_gen : process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;    
    
    sample_core : entity SampleCore
    port map (
        clk => clk,
        clk_en => '1',
        a => a,
        b => b,
        sum => sum,
        carry => carry
    );
    
    sample_core_test : process
    begin
        wait until clk'event and clk = '1';
    
        a <= "00000001";
        b <= "00000010";
            
        wait_for(2, clk);
        
        assert sum = "00000011" report "Wrong sum" severity failure;
        assert carry = '0' report "Wrong carry" severity failure;
    
        report "DONE" severity failure;
    end process sample_core_test;

end behav;
