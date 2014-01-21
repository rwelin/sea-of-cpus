library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package alu_interface is

    constant ALU_OPMODE_LENGTH: integer := 7;
    
    subtype opmode is std_logic_vector(ALU_OPMODE_LENGTH - 1 downto 0);
    
    -- Z := C; X := 0; Y := 0
    constant OPMODE_ACC_THROUGH: opmode := "0110000";
    
    -- Z := 0; X := A:B; Y := 0
    constant OPMODE_AB_THROUGH: opmode  := "0000011";

end alu_interface;

package body alu_interface is
end package body;