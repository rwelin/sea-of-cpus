library ieee;
library work;
use ieee.std_logic_1164.all;
use work.core_interface.all;

entity InstructionDecode is
    port (
        instr_word: in word;
        instr: out Instruction
    );
end InstructionDecode;

architecture behav of InstructionDecode is

begin

    Decode: process(instr_word)
    begin
        instr.op <= instr_word(17 downto 12);
        instr.addra <= instr_word(11 downto 6);
        instr.addrb <= instr_word(5 downto 0);
    end process Decode;

end behav;
