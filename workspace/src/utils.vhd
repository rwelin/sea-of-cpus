library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contains various utility functions for testing.
--
package utils is
    function uint2slv(i, len: integer) return std_logic_vector;
    function int2slv(i, len: integer) return std_logic_vector;
end package utils;

package body utils is

    -- Converts an unsigned integer to a std_logic_vector of a given length.
    --
    function uint2slv(i, len: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_unsigned(i, len));
    end function uint2slv;


    -- Converts a signed integer to a std_logic_vector of a given length.
    --
    function int2slv(i, len: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(i, len));
    end function int2slv;

end package body utils;
