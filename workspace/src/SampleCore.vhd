
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SampleCore is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           carry : out STD_LOGIC);
end SampleCore;

architecture Behavioural of SampleCore is
    signal sum_s : unsigned(8 downto 0);
begin

    sum <= std_logic_vector(sum_s(7 downto 0));
    carry <= std_logic(sum_s(8));
    
    add : process
    begin
        wait until clk'event and clk = '1';
        if clk_en = '1' then
            sum_s <= to_unsigned(to_integer(unsigned(a)) + to_integer(unsigned(b)), 9);
        end if;
    end process add;

end Behavioural;
