library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dsp_mode.all;
use work.core_config.all;

-- Functions relating to instruction decode.
--
package instruction_decode is
    function sign_extend(v: std_logic_vector; len: integer) return std_logic_vector;
end package instruction_decode;

package body instruction_decode is

    -- Sign extends a given vector to a given length.
    --
    function sign_extend(v: std_logic_vector; len: integer) return std_logic_vector is
    begin
        assert len >= v'length
        report "sign_extend: output length must not be less than input length"
        severity warning;

        return std_logic_vector(to_signed(to_integer(signed(v)), len));
    end function sign_extend;

end package body instruction_decode;
