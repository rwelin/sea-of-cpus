library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;
use work.core_config.all;

-- 64 address 18-bit word quad-port (3 ro, 1 rw) RAM with synchronous read and write.
--
entity RegisterFile is
    port (
        clk: in std_logic;
        reset: in std_logic;
        write_enable: in std_logic;
        addr_a: in register_addr;
        addr_b: in register_addr;
        addr_c: in register_addr;
        addr_d: in register_addr;
        write_data: in word;
        read_a: out word;
        read_b: out word;
        read_c: out word;
        read_d: out word
    );
end entity RegisterFile;

architecture behav of RegisterFile is
    signal a, b, c, d: word;
begin

    -- Drives output from pipeline registers.
    --
    read_output: process
    begin
        wait until clk'event and clk = '1';
        read_a <= a;
        read_b <= b;
        read_c <= c;
        read_d <= d;

        if reset = '1' then
            read_a <= (others => '0');
            read_b <= (others => '0');
            read_c <= (others => '0');
            read_d <= (others => '0');
        end if;
    end process read_output;

    -- Register file implemented using the RAM64M primitive.
    --
    GenerateRegisterFile: for i in word'range generate
        RAM64M_inst : RAM64M
        generic map (
            INIT_A => X"0000000000000000", -- Initial contents of A port
            INIT_B => X"0000000000000000", -- Initial contents of B port
            INIT_C => X"0000000000000000", -- Initial contents of C port
            INIT_D => X"0000000000000000") -- Initial contents of D port
        port map (
             WCLK => clk, -- Write clock input
             WE => write_enable, -- Write enable input
             ADDRA => addr_a, -- Read port A 6-bit address input
             ADDRB => addr_b, -- Read port B 6-bit address input
             ADDRC => addr_c, -- Read port C 6-bit address input
             ADDRD => addr_d, -- Read/Write port D 6-bit address input
             DIA => write_data(i), -- RAM 1-bit data write input addressed by ADDRD
             DIB => write_data(i), -- RAM 1-bit data write input addressed by ADDRD
             DIC => write_data(i), -- RAM 1-bit data write input addressed by ADDRD
             DID => write_data(i), -- RAM 1-bit data write input addressed by ADDRD
             DOA => a(i), -- Read port A 1-bit output
             DOB => b(i), -- Read port B 1-bit output
             DOC => c(i), -- Read port C 1-bit output
             DOD => d(i)  -- Read/Write port D 1-bit output
         );
    end generate GenerateRegisterFile;

end architecture behav;
