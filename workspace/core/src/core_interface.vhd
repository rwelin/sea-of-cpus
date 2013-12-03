library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package core_interface is

    constant WORD_LENGTH: integer := 18;
    constant REGISTER_ADDR_LENGTH: integer := 6;
    constant REGISTER_FILE_DEPTH: integer := 2**REGISTER_ADDR_LENGTH;
    constant RAM_ADDR_LENGTH: integer := 11;
    constant RAM_DEPTH: integer := 2**RAM_ADDR_LENGTH;
    constant OPCODE_LENGTH: integer := 4;

    subtype word is std_logic_vector(WORD_LENGTH - 1 downto 0);
    subtype register_addr is std_logic_vector(REGISTER_ADDR_LENGTH - 1 downto 0);
    subtype ram_addr is std_logic_vector(RAM_ADDR_LENGTH - 1 downto 0);
    subtype opcode is std_logic_vector(OPCODE_LENGTH - 1 downto 0);

    type Instruction is
    record
        op: opcode;
        addra: register_addr;
        addrb: register_addr;
    end record;

    constant OP_NOP: opcode   := "0000"; --
    constant OP_MOVE: opcode  := "0001"; -- | r1:6 | const:8 |
    constant OP_LOAD: opcode  := "0010"; -- | r1:6 | addr:8 |
    constant OP_STORE: opcode := "0011"; -- | r1:6 | addr:8 |
    constant OP_J: opcode     := "0100"; -- | addr:11 |
    constant OP_JR: opcode    := "0101"; -- | r1:6 | addr:8 |
    constant OP_BEQ: opcode   := "0110"; -- | r1:6 | offset:8 |
    constant OP_BNQ: opcode   := "0111"; -- | r1:6 | offset:8 |
    constant OP_ADD: opcode   := "1000"; -- | unused:6 | r1:6 |
    constant OP_SUB: opcode   := "1001"; -- | unused:6 | r1:6 |
    constant OP_U1: opcode    := "1010";
    constant OP_U2: opcode    := "1011";
    constant OP_MAC: opcode   := "1100"; -- | r1:6 | r2:6 |
    constant OP_MSC: opcode   := "1101"; -- | r1:6 | r2:6 |
    constant OP_MULT: opcode  := "1110"; -- | r1:6 |
    constant OP_U3: opcode    := "1111";

end core_interface;

package body core_interface is
end package body;
