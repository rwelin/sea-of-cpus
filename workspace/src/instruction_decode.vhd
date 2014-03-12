library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dsp_mode.all;
use work.core_config.all;
use work.opcodes.all;

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
            read_a: word;
            read_b: word;
            read_c: word;
            read_d: word;
        end record;

    function sign_extend(v: std_logic_vector; len: integer) return std_logic_vector;
    function decode_dsp_inputs(op: opcode; inputs: DSPDataInputs) return DSPInputs;
    function decode_opcode(instruction: word) return opcode;
end package instruction_decode;

package body instruction_decode is

    -- Sign extends a given vector to a given length.
    --
    function sign_extend(v: std_logic_vector; len: integer) return std_logic_vector is
    begin
        assert len >= v'length
        report "sign_extend: output length must not be less than input length"
        severity failure;

        return std_logic_vector(to_signed(to_integer(signed(v)), len));
    end function sign_extend;


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

end package body instruction_decode;
