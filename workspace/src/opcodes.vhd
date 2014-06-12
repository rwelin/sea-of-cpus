-- Generated by opcode_vhdl_gen from instruction_set.txt
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_config.all;

package opcodes is

    constant OP_NOP: opcode := "000000";

    -- | const:12 | -- acc := const
    constant OP_MOVA: opcode := "000001";

    -- | ra:6 | -- acc := ra
    constant OP_MOVAR: opcode := "000010";

    -- | ra:6 | -- ra := acc
    constant OP_MOVRA: opcode := "000011";

    -- | const:6 | rb:6 | -- rb := const
    constant OP_MOVR: opcode := "000100";

    -- | ra:6 | rb:6 | -- ra := rb
    constant OP_MOVRR: opcode := "000101";

    -- | const:12 | -- acc := *const
    constant OP_LDA: opcode := "000110";

    -- | const:12 | -- *const := acc
    constant OP_STA: opcode := "000111";

    -- | -:6 | rb:6 | -- acc := *rb
    constant OP_LDAR: opcode := "001000";

    -- | -:6 | rb:6 | -- *rb := acc
    constant OP_STAR: opcode := "001001";

    -- | ra:6 | rb:6 | -- rb := *ra
    constant OP_LDRR: opcode := "001010";

    -- | ra:6 | rb:6 | -- *ra := rb
    constant OP_STRR: opcode := "001011";

    -- | const:12 | -- acc := acc + const
    constant OP_ADDA: opcode := "001100";

    -- | const:12 | -- acc := acc - const
    constant OP_SUBA: opcode := "001101";

    -- | -:6 | rb:6 | -- acc := acc + rb
    constant OP_ADDAR: opcode := "001110";

    -- | -:6 | rb:6 | -- acc := acc - rb
    constant OP_SUBAR: opcode := "001111";

    -- | ra:6 | const:6 | -- ra := ra + const
    constant OP_ADDR: opcode := "010000";

    -- | ra:6 | const:6 | -- ra := ra - const
    constant OP_SUBR: opcode := "010001";

    -- | ra:6 | rb:6 | -- ra := ra + *rb
    constant OP_ADDRM: opcode := "010010";

    -- | ra:6 | rb:6 | -- ra := ra - *rb
    constant OP_SUBRM: opcode := "010011";

    -- | ra:6 | rb:6 | -- acc := acc + ra * rb
    constant OP_MAC: opcode := "010100";

    -- | ra:6 | rb:6 | -- acc := p + ra * rb
    constant OP_MACP: opcode := "010101";

    -- | ra:6 | rb:6 | -- acc := p + *rb * ra
    constant OP_MACPM: opcode := "010110";

    -- | const:12 | -- coefa := const
    constant OP_COEFA: opcode := "010111";

    -- | const:12 | -- dataa := const
    constant OP_DATAA: opcode := "011000";

    -- | const:12 | -- datao := const
    constant OP_DATAO: opcode := "011001";

    -- | const:12 | -- datam := const
    constant OP_DATAM: opcode := "011010";

    -- | -:12 | -- acc := p + (*coef++) * (*data++)
    constant OP_CMAC: opcode := "011011";

    -- | ra:6 | -:6 | -- datao := (datao - 1) mod datam; *(dataa + datao) := ra
    constant OP_CSTR: opcode := "011100";

    -- | const:12 | -- pc := const
    constant OP_J: opcode := "011101";

    -- | -:6 | rb:6 | -- pc := rb
    constant OP_BR: opcode := "011110";

    -- | ra:6 | rb:6 | -- if rb = 0: pc := ra
    constant OP_BZ: opcode := "011111";

    -- | ra:6 | rb:6 | -- if rb != 0: pc := ra
    constant OP_BNZ: opcode := "100000";

    -- | ra:6 | rb:6 | -- if rb != 0: pc := ra; rb -= 1
    constant OP_BNZD: opcode := "100001";

    -- | ra:6 | const:6 | -- ra := fifo[const]
    constant OP_MOVRF: opcode := "100010";

    -- | ra:6 | const:6 | -- fifo[const] := ra
    constant OP_MOVFR: opcode := "100011";

end package opcodes;
