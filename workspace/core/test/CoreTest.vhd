library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity CoreTest is
end CoreTest;

architecture behav of CoreTest is

    signal clk: std_logic;
    signal doa, dob, doc, dod: word;
    signal addra, addrb, addrc, addrd: register_addr;
    signal dia, dib, dic, did: word;
    signal we: std_logic;
    signal br_addra, br_addrb: ram_addr;
    signal br_douta, br_doutb: word;
    signal br_dina, br_dinb: word;
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
    br_dina <= (others => '0');
    br_dinb <= (others => '0');
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
        br_addra,
        br_addrb,
        br_douta,
        br_doutb,
        br_dina,
        br_dinb,
        br_wea,
        br_web
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
