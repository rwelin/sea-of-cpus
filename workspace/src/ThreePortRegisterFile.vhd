library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_config.all;

entity ThreePortRegisterFile is
    port (
        clk: in std_logic;
        write_enable: in std_logic;
        addr_a: in register_addr;
        addr_b: in register_addr;
        addr_d: in register_addr;
        write_data: in word;
        read_a: out word;
        read_b: out word
    );
end entity ThreePortRegisterFile;

architecture behav of ThreePortRegisterFile is
    type data_t is array (0 to 63) of word;
    signal data: data_t;
begin

    write: process
    begin
        wait until clk'event and clk = '1';

        if write_enable = '1' then
            data(to_integer(unsigned(addr_d))) <= write_data;
        end if;

    end process write;


    read: process
        ( addr_a
        , addr_b
        , data
        )
    begin

        read_a <= data(to_integer(unsigned(addr_a)));
        read_b <= data(to_integer(unsigned(addr_b)));

    end process read;

end architecture behav;
