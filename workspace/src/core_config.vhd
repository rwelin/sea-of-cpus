library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contains all parameters and necessesary type defenitions for the CPU.
--
package core_config is

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

    type dsp_input is (Ram1, Ram2, Zero, One, Reg1, Reg2, Reg3, Acc, Const, DspOut);
    type DspDataInputControl is
    record
        a, b, c, d: dsp_input;
    end record DspDataInputControl;

    type BlockRamAddrControlA is (PC, CmacCoef);
    type BlockRamDataInputControlB is (Acc, Reg2, Const);
    type BlockRamAddrControlB is (Reg1, Reg2, Const, CmacData);

    type BranchOp is (NoBr, UncondJ, UncondBr, CondBrZ, CondBrNZ);

    type InstructionType is (Normal, Mult);

end core_config;

package body core_config is
end package body;
