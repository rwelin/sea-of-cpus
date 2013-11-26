library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.core_interface.all;

entity CoreTest is
end CoreTest;

architecture behav of CoreTest is

    signal clk: std_logic;
    signal doa, dob, doc, dod: word;
    signal addra, addrb, addrc, addrd: register_addr;
    signal dia, dib, dic, did: word;
    signal we: std_logic;
    signal br_addra, br_addrb: ram_addr;
    signal br_doa, br_dob: word;
    signal br_dia, br_dib: word;
    signal br_wea, br_web: word;

begin

    dia <= (others => '0');
    dib <= (others => '0');
    dic <= (others => '0');
    did <= (others => '0');
    addra <= (others => '0');
    addrb <= (others => '0');
    addrc <= (others => '0');
    addrd <= (others => '0');
    we <= '0';

    br_addra <= (others => '0');
    br_addrb <= (others => '0');
    br_dia <= (others => '0');
    br_dib <= (others => '0');
    br_wea <= (others => '0');
    br_web <= (others => '0');

    CoreInst : entity Core
    port map (
        clk => clk,
        doa => doa,
        dob => dob,
        doc => doc,
        dod => dod,
        addra => addra,
        addrb => addrb,
        addrc => addrc,
        addrd => addrd,
        dia => dia,
        dib => dib,
        dic => dic,
        did => did,
        we => we,
        br_addra => br_addra,
        br_addrb => br_addrb,
        br_doa => br_doa,
        br_dob => br_dob,
        br_dia => br_dia,
        br_dib => br_dib ,
        br_wea => br_wea,
        br_web => br_web
    );

    ClkGen : process
    begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process ClkGen;

    Test : process
    begin
        wait for 1000 ns;
        report "Done" severity failure;
    end process Test;

end behav;
