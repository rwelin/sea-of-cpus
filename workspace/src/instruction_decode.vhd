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
            addr_c: register_addr;
            addr_d: register_addr;
            write_data: word;
        end record;

    function decode_dsp_inputs(op: opcode; inputs: DSPDataInputs) return DSPInputs;
    function decode_opcode(instruction: word) return opcode;

    function decode_use_pc_next_address(op: opcode) return std_logic;
end package instruction_decode;

package body instruction_decode is

    -- Maps an opcode and a set of inputs to the ports of the DSP block.
    --
    function decode_dsp_inputs(op: opcode; inputs: DSPDataInputs) return DSPInputs is
        variable output: DSPInputs;
    begin
        output.mode := DSP_C_PASSTHROUGH;
        output.a := (others => '0');
        output.b := (others => '0');
        output.c := (others => '0');
        output.d := (others => '0');
        case op is
            when OP_MOVA =>
                output.c := sign_extend(inputs.const, output.c'length);
            when others =>
        end case;

        return output;
    end function decode_dsp_inputs;


    -- Returns the opcode of an instruction word.
    --
    function decode_opcode(instruction: word) return opcode is
    begin
        return instruction(opcode'range);
    end function decode_opcode;


    -- Returns one if the next address logic should be used or if a calculated
    -- address should be used given an opcode.
    --
    function decode_use_pc_next_address(op: opcode) return std_logic is
    begin

        return '1';

    end function;

end package body instruction_decode;
