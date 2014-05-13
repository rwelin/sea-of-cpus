library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dsp_mode.all;
use work.core_config.all;
use work.utils.all;

package instruction_decode is

    type DSPInputs is
        record
            mode: DSPMode;
            a: std_logic_vector(29 downto 0);
            b: std_logic_vector(17 downto 0);
            c: std_logic_vector(47 downto 0);
            d: std_logic_vector(24 downto 0);
        end record;

    type RegisterFileInputs is
        record
            write_enable: std_logic;
            addr_a: register_addr;
            addr_b: register_addr;
            addr_d: register_addr;
            write_data: word;
        end record;

end package instruction_decode;
