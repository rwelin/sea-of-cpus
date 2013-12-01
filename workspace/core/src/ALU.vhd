library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_interface.all;

entity ALU is
    port (
        clk: in std_logic;    
        mode: in opcode; 
        ain, bin: in word;
        acc: out word
    );
end ALU;

architecture behav of ALU is

begin

    acc <= (others => '0');

end behav;
