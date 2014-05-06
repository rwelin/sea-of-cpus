library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO is
    generic (
        size: integer;
        word_len: integer
    );
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        input: in std_logic_vector(word_len-1 downto 0);
        push: in std_logic;
        pop: in std_logic;
        output: out std_logic_vector(word_len-1 downto 0);
        pushed: out std_logic;
        poped: out std_logic
    );
end FIFO;

architecture behav of FIFO is
begin

    write_data: process

        variable index: unsigned(size-1 downto 0);

        type fifo_t is array (0 to ((2**size)-1)) of std_logic_vector(word_len-1 downto 0);
        variable data: fifo_t;

    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            pushed <= '0';
            poped <= '0';

            if pop = '1' and index /= (index'range => '0') then
                data(size-2 downto 0) := data(size-1 downto 1);
                data(size-1) := (others => '0');
                poped <= '1';
                index := index - 1;
            end if;

            if push = '1' and index /= (index'range => '1') then
                data(to_integer(index)) := input;
                index := index + 1;
                pushed <= '1';
            end if;

            if reset = '1' then
                pushed <= '0';
                poped <= '0';
                index := to_unsigned(0, size);
                data := (others => (others => '0'));
            end if;

            output <= data(0);

        end if;

    end process write_data;

end behav;
