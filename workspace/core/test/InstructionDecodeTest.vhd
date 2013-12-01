library ieee;
library work;
use ieee.std_logic_1164.all;
use work.all;
use work.core_interface.all;

entity InstructionDecodeTest is
end InstructionDecodeTest;

architecture behav of InstructionDecodeTest is

    signal clk: std_logic;
    signal instr_word: word;
    signal instr: Instruction;

begin

    InstructionDecodeInst: entity InstructionDecode
    port map (
        instr_word => instr_word,
        instr => instr
    );

    ClkGen: process
    begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process ClkGen;

    Test: process
    begin

        instr_word <= (others => '0');
        wait until clk'event and clk = '1';
        assert instr.op = "0000" and instr.addra = "000000" and instr.addrb = "000000"
            report "op, addra and addrb should be all zero" severity failure;


        wait for 1000 ns;
        report "Done" severity failure;
    end process Test;

end behav;

