library ieee;
library unimacro;
library unisim;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use unimacro.vcomponents.all;
use unisim.vcomponents.all;
use work.core_interface.all;

entity Core is
    port (
        clk: in std_logic;
        doa, dob, doc, dod: out word;
        addra, addrb, addrc, addrd: in register_addr;
        dia, dib, dic, did: in word;
        we: in std_logic;
        br_addra, br_addrb: in ram_addr;
        br_doa, br_dob: out word;
        br_dia, br_dib: in word;
        br_wea, br_web: in word
    );
end Core;

architecture behav of Core is

    -- read ports of the register file
    --signal doa, dob, doc, dod: word;

    -- write ports of the register file
    --signal dia, dib, dic, did: word;

    -- address inputs of the register file
    --signal addra, addrb, addrc, addrd: register_addr;

    -- register file write enable
    --signal we: std_logic;

    -- address inputs of the block ram
    --signal br_addra, br_addrb: ram_addr;

    -- read ports of the block ram
    --signal br_doa, br_dob: word;

    -- write ports of the block ram
    --signal br_dia, br_dib: word;

    -- block ram write enable
    --signal br_wea, br_web: std_logic;

begin

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
             ADDRA => addra, -- Read port A 6-bit address input
             ADDRB => addrb, -- Read port B 6-bit address input
             ADDRC => addrc, -- Read port C 6-bit address input
             ADDRD => addrd, -- Read/Write port D 6-bit address input
             DIA => dia(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRA
             DIB => dib(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRB
             DIC => dic(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRC
             DID => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRD
             WCLK => clk, -- Write clock input
             WE => we -- Write enable input
         );
    end generate GenerateRegisterFile;

    block_ram : BRAM_TDP_MACRO
    generic map (
        BRAM_SIZE => "36Kb",
        DEVICE => "Virtex6",
        DOA_REG => 1,
        DOB_REG => 1,
        READ_WIDTH_A => WORD_LENGTH,
        READ_WIDTH_B => WORD_LENGTH,
        SIM_COLLISION_CHECK => "ALL",
        WRITE_MODE_A => "WRITE_FIRST",
        WRITE_MODE_B => "WRITE_FIRST",
        WRITE_WIDTH_A => WORD_LENGTH,
        WRITE_WIDTH_B => WORD_LENGTH)
    port map (
        ADDRA => br_addra,
        ADDRB => br_addrb,
        DIA => br_dia,
        DIB => br_dib,
        DOA => br_doa,
        DOB => br_dob,
        CLKA => clk,
        CLKB => clk,
        ENA => '1',
        ENB => '1',
        REGCEA => '1',
        REGCEB => '1',
        RSTA => '0',
        RSTB => '0',
        WEA => br_wea,
        WEB => br_web 
    );

end behav;
