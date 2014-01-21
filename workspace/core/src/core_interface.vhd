library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package core_interface is

    constant WORD_LENGTH: integer := 18;
    constant REGISTER_ADDR_LENGTH: integer := 6;
    constant REGISTER_FILE_DEPTH: integer := 2**REGISTER_ADDR_LENGTH;
    constant RAM_ADDR_LENGTH: integer := 11;
    constant RAM_DEPTH: integer := 2**RAM_ADDR_LENGTH;
    constant OPCODE_LENGTH: integer := 6;

    subtype word is std_logic_vector(WORD_LENGTH - 1 downto 0);
    subtype register_addr is std_logic_vector(REGISTER_ADDR_LENGTH - 1 downto 0);
    subtype ram_addr is std_logic_vector(RAM_ADDR_LENGTH - 1 downto 0);
    subtype opcode is std_logic_vector(OPCODE_LENGTH - 1 downto 0);

    type Instruction is
    record
        op: opcode;

        data: std_logic_vector(WORD_LENGTH - OPCODE_LENGTH - 1 downto 0);

        addra: register_addr;
        addrb: register_addr;
        addrc: register_addr;
        addrd: register_addr;
        rwe: std_logic;

        br_addrb: ram_addr;
        br_web: std_logic;

        alumode: std_logic_vector(3 downto 0);
        opmode: std_logic_vector(6 downto 0);

        acc_we: std_logic;
    end record;

    constant OP_NOP: opcode   := "000000"; --
    constant OP_MOVA: opcode  := "000001"; -- | const:12 |       -- acc := const
    constant OP_MOVAR: opcode := "000010"; -- | ra:6 |           -- acc := ra
    constant OP_MOVR: opcode  := "000011"; -- | ra:6 | const:6 | -- ra := const
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

end core_interface;

package body core_interface is
end package body;
