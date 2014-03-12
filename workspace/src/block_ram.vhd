library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;

package block_ram is

    type BlockRamInputs is
        record
            addra: ram_addr;
            addrb: ram_addr;
            dia: word;
            dib: word;
            wea: std_logic;
            web: std_logic;
        end record BlockRamInputs;

end package block_ram;
