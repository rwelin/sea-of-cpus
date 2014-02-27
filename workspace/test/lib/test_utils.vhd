library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contains various utility functions for testing.
--
package test_utils is
    function to_string(v: std_logic_vector) return string;
    procedure wait_for(constant ticks: in integer; signal clk: in std_logic);
end package test_utils;

package body test_utils is

    -- Converts a std_logic_vector to a string.
    --
    function to_string(v: std_logic_vector) return string is
    begin
        if v'length = 0 then
            return "";
        else
            return std_logic'image(v(v'high))(2) & to_string(v(v'high-1 downto v'low));
        end if;
    end function to_string;


    -- Waits for a given number of positive clock edges.
    --
    procedure wait_for(constant ticks: in integer; signal clk: in std_logic) is
    begin
        if ticks > 0 then
            for count in 1 to ticks loop
                wait until clk'event and clk = '1';
            end loop;
        end if;
    end procedure wait_for;

end package body test_utils;