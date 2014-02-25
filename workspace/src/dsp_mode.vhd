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

    constant DSP_ACCUMULATOR_THROUGH: DSPMode := ("0110000", "00000", "0000");

end package dsp_mode;
