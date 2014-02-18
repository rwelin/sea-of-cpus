library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_config.all;

entity BlockRam is
    port (
        clk: in std_logic;
        reset: in std_logic;
        addra: in ram_addr;
        addrb: in ram_addr;
        dia: in word;
        dib: in word;
        doa: out word;
        dob: out word;
        wea: in std_logic;
        web: in std_logic
    );
end BlockRam;

architecture behav of BlockRam is

    type block_ram is array (RAM_DEPTH - 1 downto 0) of word;
    shared variable mem: block_ram;
    signal regA, regB: word;
    signal iaddra, iaddrb: integer;

begin

    iaddra <= to_integer(unsigned(addra));
    iaddrb <= to_integer(unsigned(addrb));

    PortAWrite: process
    begin
        wait until clk'event and clk = '1';
        if wea = '1' then
            mem(iaddra) := dia;
        end if;
    end process PortAWrite;

    PortARead: process
    begin
        wait until clk'event and clk = '1';
        regA <= mem(iaddra);
        doa <= regA;
    end process PortARead;

    PortBWrite: process
    begin
        wait until clk'event and clk = '1';
        if web = '1' then
            mem(iaddrb) := dib;
        end if;
    end process PortBWrite;

    PortBRead: process
    begin
        wait until clk'event and clk = '1';
        regB <= mem(iaddrb);
        dob <= regB;
    end process PortBRead;

end behav;
