library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use unisim.vcomponents.all;
use work.all;
use work.core_interface.all;

entity Core is
    port (
        clk: in std_logic;
        reset: in std_logic;
        addra, addrb, addrc, addrd: in register_addr;
        did: in word;
        we: in std_logic;
        br_addra, br_addrb: in ram_addr;
        br_dia, br_dib: in word;
        br_wea, br_web: in std_logic;
        acc: out word
    );
end Core;

architecture behav of Core is

    -- read ports of the register file
    signal doa, dob, doc, dod: word;
    signal rdoa, rdob, rdoc, rdod: word;

    -- write ports of the register file
    --signal dia, dib, dic, did: word;

    -- address inputs of the register file
    --signal addra, addrb, addrc, addrd: register_addr;

    -- register file write enable
    --signal we: std_logic;

    -- address inputs of the block ram
    --signal br_addra, br_addrb: ram_addr;

    -- read ports of the block ram
    signal br_doa, br_dob: word;

    -- write ports of the block ram
    --signal br_dia, br_dib: word;

    -- block ram write enable
    --signal br_wea, br_web: std_logic;

    -- decoded instruction
    signal instr, rinstr: Instruction;

begin

    PipelineRegisters: process
    begin
        wait until clk'event and clk = '1';
        rdoa <= doa;
        rdob <= dob;
        rdoc <= doc;
        rdod <= dod;
        rinstr <= instr;
    end process PipelineRegisters;

    InstructionDecodeInst: entity InstructionDecode
    port map (
        instr_word => br_doa,
        instr => instr
    );

    ALUInst: entity ALU
    port map (
        clk => clk,
        reset => reset,
        mode => rinstr.op,
        ain => rdoa,
        bin => rdob,
        acc => acc
    );

    GenerateRegisterFile: for i in 0 to 17 generate
        RAM64M_inst : RAM64M
        generic map (
            INIT_A => X"0000000000000000", -- Initial contents of A port
            INIT_B => X"0000000000000000", -- Initial contents of B port
            INIT_C => X"0000000000000000", -- Initial contents of C port
            INIT_D => X"0000000000000000") -- Initial contents of D port
        port map (
             DOA => doa(i), -- Read port A 1-bit output
             DOB => dob(i), -- Read port B 1-bit output
             DOC => doc(i), -- Read port C 1-bit output
             DOD => dod(i), -- Read/Write port D 1-bit output
             ADDRA => rinstr.addra, -- Read port A 6-bit address input
             ADDRB => rinstr.addrb, -- Read port B 6-bit address input
             ADDRC => addrc, -- Read port C 6-bit address input
             ADDRD => addrd, -- Read/Write port D 6-bit address input
             DIA => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRA
             DIB => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRB
             DIC => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRC
             DID => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRD
             WCLK => clk, -- Write clock input
             WE => we -- Write enable input
         );
    end generate GenerateRegisterFile;

    MainRam : entity BlockRam
    port map (
        addra => br_addra,
        addrb => br_addrb,
        dia => br_dia,
        dib => br_dib,
        doa => br_doa,
        dob => br_dob,
        clk => clk,
        wea => br_wea,
        web => br_web
    );

end behav;
