library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_interface.all;

entity QuadPortRam is
    port (
        clk: in std_logic;
        did: in std_logic;
        doa, dob, doc, dod: out std_logic;
        addra, addrb, addrc, addrd: in register_addr;
        we: in std_logic
    );
end QuadPortRam;

architecture behav of QuadPortRam is
    signal mem: std_logic_vector(REGISTER_FILE_DEPTH - 1 downto 0);
begin

    ReadPorts: process(mem, addra, addrb, addrc, addrd)
    begin
        doa <= mem(to_integer(unsigned(addra)));
        dob <= mem(to_integer(unsigned(addrb)));
        doc <= mem(to_integer(unsigned(addrc)));
        dod <= mem(to_integer(unsigned(addrd)));
    end process ReadPorts;
    
    WritePorts: process
    begin 
        wait until clk'event and clk = '1';
        if we = '1' then
            mem(to_integer(unsigned(addrd))) <= did;
        end if; 
    end process WritePorts;

end behav;