library ieee;
use ieee.std_logic_1164.all;

package vtypes is

    subtype slv48_t is std_logic_vector(47 downto 0);
    subtype slv18_t is std_logic_vector(17 downto 0);
    subtype slv30_t is std_logic_vector(29 downto 0);
    subtype slv25_t is std_logic_vector(24 downto 0);

end package vtypes;
