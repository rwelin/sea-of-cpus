library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dsp_mode.all;
use work.core_config.all;
use work.opcodes.all;
use work.utils.all;

-- Functions relating to instruction decode.
--
package instruction_decode is

    type DSPDataInputs is
        record
            accum: word;
            reg_a: word;
            reg_b: word;
            mem_a: word;
            const: word;
        end record;

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

    function decode_use_pc_next_address(op: opcode) return std_logic;

end package instruction_decode;

package body instruction_decode is

    -- Returns one if the next address logic should be used or if a calculated
    -- address should be used given an opcode.
    --
    function decode_use_pc_next_address(op: opcode) return std_logic is
    begin

        if op = OP_J
        or op = OP_BR then
            return '0';
        else
            return '1';
        end if;

    end function;

end package body instruction_decode;
