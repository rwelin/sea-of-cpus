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

end core_interface;

package body core_interface is
end package body;
