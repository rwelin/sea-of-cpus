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
        input_data: in std_logic_vector(word_len-1 downto 0);
        write_req: in std_logic;
        write_done: out std_logic;
        output_data: out std_logic_vector(word_len-1 downto 0);
        valid: out std_logic
    );
end FIFO;

architecture behav of FIFO is

    type entry_t is
    record
        data: std_logic_vector(word_len-1 downto 0);
        valid: std_logic;
    end record entry_t;

    type fifo_t is array (0 to size-1) of entry_t;
    signal data: fifo_t;

begin

    write_data: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            data(0).data <= input_data;
            data(0).valid <= write_req;

        end if;

    end process write_data;


    shuffle_data: process
    begin
        wait until clk'event and clk = '1';

        if clk_en = '1' then

            data(1 to size-1) <= data(0 to size-2);

        end if;

    end process shuffle_data;


    read_data: process
        ( data(size-1)
        )
    begin

        output_data <= data(size-1).data;
        valid <= data(size-1).valid;

    end process read_data;

end behav;
