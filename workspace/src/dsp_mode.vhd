library ieee;
use ieee.std_logic_1164.all;

-- Types and constant related to per-cycle configuration of a DSP block.
--
package dsp_mode is

    constant DSP_OPMODE_LENGTH: integer := 7;
    constant DSP_INMODE_LENGTH: integer := 5;
    constant DSP_ALUMODE_LENGTH: integer := 4;
    
    type DSPMode is
        record
            opmode: std_logic_vector(DSP_OPMODE_LENGTH - 1 downto 0);
            inmode: std_logic_vector(DSP_INMODE_LENGTH - 1 downto 0);
            alumode: std_logic_vector(DSP_ALUMODE_LENGTH - 1 downto 0);
        end record;

    -- P := C
    constant DSP_C_PASSTHROUGH: DSPMode := ("0110000", "00000", "0000");

    -- P := A:B
    constant DSP_AB_PASSTHROUGH: DSPMode := ("0000011", "00000", "0000");

    -- P := C + A:B
    constant DSP_CpAB: DSPMode := ("0110011", "00000", "0000");

    -- P := C - A:B
    constant DSP_CsAB: DSPMode := ("0110011", "00000", "0011");

    -- P := C*A:B
    constant DSP_CtAB: DSPMode := ("0110011", "00000", "0011");

    -- P := A*B
    constant DSP_AtB: DSPMode := ("0000101", "00000", "0000");

    -- P := C + A*B
    constant DSP_CpAtB: DSPMode := ("0110101", "00000", "0000");

    -- P := P + A*B
    constant DSP_PpAtB: DSPMode := ("0100101", "00000", "0000");

end package dsp_mode;
