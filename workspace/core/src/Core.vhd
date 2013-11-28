library ieee;
library unisim;
library unimacro;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use unisim.vcomponents.all;
use unimacro.vcomponents.all;
use work.all;
use work.core_interface.all;

entity Core is
    port (
        clk: in std_logic;
        doa, dob, doc, dod: out word;
        addra, addrb, addrc, addrd: in register_addr;
        did: in word;
        we: in std_logic;
        br_addra, br_addrb: in ram_addr;
        br_doa, br_dob: out word;
        br_dia, br_dib: in word;
        br_wea, br_web: in std_logic
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

--    GenerateRegisterFile: for i in 0 to 17 generate
--        RAM64M_inst : RAM64M
--        generic map (
--            INIT_A => X"0000000000000000", -- Initial contents of A port
--            INIT_B => X"0000000000000000", -- Initial contents of B port
--            INIT_C => X"0000000000000000", -- Initial contents of C port
--            INIT_D => X"0000000000000000") -- Initial contents of D port
--        port map (
--             DOA => doa(i), -- Read port A 1-bit output
--             DOB => dob(i), -- Read port B 1-bit output
--             DOC => doc(i), -- Read port C 1-bit output
--             DOD => dod(i), -- Read/Write port D 1-bit output
--             ADDRA => addra, -- Read port A 6-bit address input
--             ADDRB => addrb, -- Read port B 6-bit address input
--             ADDRC => addrc, -- Read port C 6-bit address input
--             ADDRD => addrd, -- Read/Write port D 6-bit address input
--             DIA => did(i), -- RAM 1-bit data write input addressed by ADDRD,
--                         -- read addressed by ADDRA
--             DIB => did(i), -- RAM 1-bit data write input addressed by ADDRD,
--                         -- read addressed by ADDRB
--             DIC => did(i), -- RAM 1-bit data write input addressed by ADDRD,
--                         -- read addressed by ADDRC
--             DID => did(i), -- RAM 1-bit data write input addressed by ADDRD,
--                         -- read addressed by ADDRD
--             WCLK => clk, -- Write clock input
--             WE => we -- Write enable input
--         );
--    end generate GenerateRegisterFile;

--    GenerateRegisterFile: for i in 0 to 17 generate
--        RegisterFile : entity QuadPortRam
--        port map (
--             doa => doa(i), -- Read port A 1-bit output
--             dob => dob(i), -- Read port B 1-bit output
--             doc => doc(i), -- Read port C 1-bit output
--             dod => dod(i), -- Read/Write port D 1-bit output
--             addra => addra, -- Read port A 6-bit address input
--             addrb => addrb, -- Read port B 6-bit address input
--             addrc => addrc, -- Read port C 6-bit address input
--             addrd => addrd, -- Read/Write port D 6-bit address input
--             did => did(i), -- RAM 1-bit data write input addressed by ADDRD,
--                         -- read addressed by ADDRD
--             clk => clk, -- Write clock input
--             we => we -- Write enable input
--         );
--    end generate GenerateRegisterFile;

    RegisterFile : entity QuadPortRegisterFile
    port map (
        clk => clk,
        doa => doa,
        dob => dob,
        doc => doc,
        dod => dod,
        did => did,
        addra => addra,
        addrb => addrb,
        addrc => addrc,
        addrd => addrd,
        we => we
    );

--    GenerateRegisterFile: for i in 0 to 17 generate
--        RegisterFile : RAM64X1Q
--        port map (
--            clk => clk,
--            doa => doa(i),
--            dob => dob(i),
--            doc => doc(i),
--            dod => dod(i),
--            did => did(i),
--            addra => addra,
--            addrb => addrb,
--            addrc => addrc,
--            addrd => addrd,
--            we => we
--        );
--    end generate GenerateRegisterFile;

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
