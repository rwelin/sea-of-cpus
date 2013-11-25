library ieee;
library unisim;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use unisim.vcomponents.all;

entity Core is
    port (
        clk: std_logic
    );
end Core;

architecture behav of Core is

    -- read ports of the register file
    signal doa, dob, doc, dod: std_logic_vector(5 downto 0);

    -- write ports of the register file
    signal dia, dib, dic, did: std_logic_vector(5 downto 0);

    -- address inputs of the register file
    signal addra, addrb, addrc, addrd: std_logic_vector(5 downto 0);

    -- register file write enable
    signal we: std_logic;

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

    RAMB36E1_inst : RAMB36E1
    generic map (
        -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
        SIM_COLLISION_CHECK => "ALL",
        -- DOA_REG, DOB_REG: Optional output register (0 or 1)
        DOA_REG => 1,
        DOB_REG => 1,
        READ_WIDTH_A => 18,
        READ_WIDTH_B => 18,
        WRITE_WIDTH_A => 18,
        WRITE_WIDTH_B => 18
    )
    port map (
        DOADO => brOutA,
        DOBDO => brOutB,
        ADDRAWDADDR => brAddrA,
        ADDRBWDADDR => brAddrB,
        WEA => brWEA
    );

end behav;
