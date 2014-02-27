-- Template generated by mktest from src/DSP.vhd
library ieee;
use ieee.std_logic_1164.all;
use work.DSP;
use work.dsp_mode.all;
use work.test.all;

entity DSPTest is
end entity DSPTest;

architecture behav of DSPTest is
    signal clk: std_logic;
    signal clk_en: std_logic;
    signal reset: std_logic;
    signal mode: DSPMode;
    signal a: std_logic_vector(29 downto 0);
    signal b: std_logic_vector(17 downto 0);
    signal c: std_logic_vector(47 downto 0);
    signal d: std_logic_vector(24 downto 0);
    signal p: std_logic_vector(47 downto 0);

    type TestData is
        record
            clk_en: std_logic;
            reset: std_logic;
            mode: DSPMode;
            a: std_logic_vector(29 downto 0);
            b: std_logic_vector(17 downto 0);
            c: std_logic_vector(47 downto 0);
            d: std_logic_vector(24 downto 0);
            p: std_logic_vector(47 downto 0);
            wait_cycles: integer;
        end record;

    type TestDataArray is array (0 to 8) of TestData;
    constant test_data: TestDataArray := (
        0 => -- P should be all zero on reset.
            ('1', '1', DSP_C_PASSTHROUGH,
             uint2slv(1, a'length), uint2slv(2, b'length), uint2slv(3, c'length), uint2slv(4, d'length),
             (others => '0'), 3),

        1 => -- P should not change when `clk_en' is cleared.
            ('0', '0', DSP_C_PASSTHROUGH,
             uint2slv(1, a'length), uint2slv(2, b'length), uint2slv(3, c'length), uint2slv(4, d'length),
             (others => '0'), 3),

        2 => -- C should synchronously be written to P on DSP_C_PASSTHROUGH.
            ('1', '0', DSP_C_PASSTHROUGH,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(0, p'length), 0),

        3 => -- ditto
            ('1', '0', DSP_C_PASSTHROUGH,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(0, p'length), 1),

        4 => -- ditto
            ('1', '0', DSP_C_PASSTHROUGH,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(0, p'length), 1),

        5 => -- ditto
            ('1', '0', DSP_C_PASSTHROUGH,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(5, p'length), 1),

        6 => -- A:B should be synchronously written to P on DSP_AB_PASSTHROUGH.
            ('1', '0', DSP_AB_PASSTHROUGH,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(2*2**18+3, p'length), 3),

        7 => -- P := C + A:B on DSP_CpAB
            ('1', '0', DSP_CpAB,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             uint2slv(2*2**18+3+5, p'length), 3),

        8 => -- P := C - A:B on DSP_CmAB
            ('1', '0', DSP_CmAB,
             uint2slv(2, a'length), uint2slv(3, b'length), uint2slv(5, c'length), uint2slv(7, d'length),
             int2slv(5-(2*2**18+3), p'length), 3)
    );

begin

    clk_gen: process
    begin
        clk <= '1';
        wait for 50 ns;
        clk <= '0';
        wait for 50 ns;
    end process clk_gen;

    DSP_inst: entity DSP
    port map (
        clk => clk,
        clk_en => clk_en,
        reset => reset,
        mode => mode,
        a => a,
        b => b,
        c => c,
        d => d,
        p => p
    );

    DSP_test: process
    begin
        wait until clk'event and clk = '1';

        for i in test_data'range loop

            clk_en <= test_data(i).clk_en;
            reset <= test_data(i).reset;
            mode <= test_data(i).mode;
            a <= test_data(i).a;
            b <= test_data(i).b;
            c <= test_data(i).c;
            d <= test_data(i).d;

            wait_for(test_data(i).wait_cycles, clk);

            assert p = test_data(i).p
            report "Test " & integer'image(i) & ":" &
                " `p' is " & to_string(p) &
                " should be " & to_string(test_data(i).p)
            severity failure;

        end loop;

        report "DONE" severity failure;
    end process DSP_test;

end architecture behav;

