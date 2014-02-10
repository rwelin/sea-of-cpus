library ieee;
library work;
use ieee.std_logic_1164.all;
use work.core_config.all;

-- Defines a single word register with synchronous read and write.
--
entity Accumulator is
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        input: in word;
        write_enable: std_logic;
        output: out word
     );
end entity Accumulator;

architecture behav of Accumulator is
begin

    -- Control state of the accumulator data.
    --
    write: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            if write_enable = '1' then
                output <= input;
            end if;

            if reset = '1' then
                output <= (others => '0');
            end if;

        end if;

    end process write;

end architecture behav;