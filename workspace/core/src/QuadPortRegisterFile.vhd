library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_interface.all;

entity QuadPortRegisterFile is
    port (
        clk: std_logic;
        doa, dob, doc, dod: out word;
        did: in word;
        addra, addrb, addrc, addrd: in register_addr;
        we: in std_logic
    );
end QuadPortRegisterFile;

architecture behav of QuadPortRegisterFile is

    type distributed_ram is array (REGISTER_FILE_DEPTH - 1 downto 0) of word;
    signal mem: distributed_ram;
    
begin

    ReadPorts: process(mem, addra, addrb, addrc, addrd)
    begin
        doa <= mem(to_integer(unsigned(addra)));
        dob <= mem(to_integer(unsigned(addrb)));
        doc <= mem(to_integer(unsigned(addrc)));
        dod <= mem(to_integer(unsigned(addrd)));
    end process ReadPorts;
    
    PortDWrite: process
    begin
        wait until clk'event and clk = '1';
        if we = '1' then
            mem(to_integer(unsigned(addrd))) <= did;
        end if;
    end process PortDWrite;

end behav;