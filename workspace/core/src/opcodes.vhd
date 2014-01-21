library ieee;
library work;
use ieee.std_logic_1164.all;
use work.core_interface.all;

package opcodes is

    constant OP_NOP: opcode   := "000000"; --
    constant OP_MOVA: opcode  := "000001"; -- | const:12 |       -- acc := const
    constant OP_MOVAR: opcode := "000010"; -- | ra:6 |           -- acc := ra
    constant OP_MOVRA: opcode := "000011"; -- | ra:6 |           -- ra := acc
    constant OP_MOVRR: opcode := "000100"; -- | ra:6 | rb:6 |    -- ra := rb
    constant OP_LDA: opcode   := "000101"; -- | const:12 |       -- acc := *const
    constant OP_STA: opcode   := "000110"; -- | const:12 |       -- *const := acc
    constant OP_LDAR: opcode  := "000111"; -- | ra:6 |           -- acc := *ra
    constant OP_STAR: opcode  := "001000"; -- | ra:6 |           -- *ra := acc
    constant OP_LDR: opcode   := "001001"; -- | ra:6 | rb:6 |    -- ra := *rb
    constant OP_STR: opcode   := "001010"; -- | ra:6 | rb:6 |    -- *rb := ra
    constant OP_J: opcode     := "001011"; -- | ra:6 |           -- PC := ra
    constant OP_BEQ: opcode   := "001100"; -- | ra:6 | rb:6 |    -- if ra = acc: PC := rb
    constant OP_BNQ: opcode   := "001101"; -- | ra:6 | rb:6 |    -- if ra <> acc: PC := rb
    constant OP_ADD: opcode   := "001110"; -- | ra:6 |           -- acc = acc + ra
    constant OP_SUB: opcode   := "001111"; -- | ra:6 |           -- acc = acc - rb
    constant OP_MAC: opcode   := "010000"; -- | ra:6 | rb:6 |    -- acc = acc + ra * rb

end package opcodes;
