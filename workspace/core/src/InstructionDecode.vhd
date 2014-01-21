library ieee;
library work;
use ieee.std_logic_1164.all;
use work.core_interface.all;
use work.alu_interface.all;

entity InstructionDecode is
    port (
        instr_word: in word;
        instr: out Instruction
    );
end InstructionDecode;

architecture behav of InstructionDecode is

begin

    Decode: process(instr_word)
        variable op: opcode;
    begin
        op := instr_word(17 downto 12);

        instr.op <= op;

        instr.data <= instr_word(11 downto 0);

        instr.addra <= instr_word(11 downto 6);
        instr.addrb <= instr_word(5 downto 0);
        instr.addrc <= (others => '0');
        instr.addrd <= instr_word(11 downto 6);
        instr.rwe <= '0';

        instr.br_addrb <= (others => '0');
        instr.br_web <= '0';

        -- P := Z + X + Y
        instr.alumode <= "0000";
        instr.opmode <= OPMODE_ACC_THROUGH;

        instr.acc_we <= '0';

        case op is
            when OP_NOP =>
                instr.opmode <= OPMODE_ACC_THROUGH;

            when OP_MOVA =>
                instr.opmode <= OPMODE_AB_THROUGH;
                instr.acc_we <= '1';
            
            when OP_MOVAR =>
                instr.opmode <= OPMODE_AB_THROUGH;
                instr.acc_we <= '1';
                
            when OP_MOVRA =>
                instr.opmode <= OPMODE_ACC_THROUGH;
                instr.rwe <= '1';
            
            when OP_MOVRR =>
                instr.opmode <= OPMODE_AB_THROUGH;
                instr.rwe <= '1';

            when others =>

        end case;
    end process Decode;

end behav;
