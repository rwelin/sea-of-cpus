library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package CoreInterface is

    constant WORD_LENGTH: integer := 18;
    constant REGISTER_ADDR_LENGTH: integer := 6;
    constant OPCODE_LENGTH: integer := 4;

    subtype word is std_logic_vector(WORD_LENGTH - 1 downto 0);
    subtype opcode is std_logic_vector(OPCODE_LENGTH - 1 downto 0);
    
end CoreInterface;

package body CoreInterface is
end package body;
