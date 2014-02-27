library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_config.all;
use work.utils.all;

package core_utils is
    function int2word(i: integer) return word;
end package core_utils;

package body core_utils is

    -- Convert an integer to a core word.
    --
    function int2word(i: integer) return word is
    begin
        return int2slv(i, word'length);
    end function int2word;

end package body core_utils;
