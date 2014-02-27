library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.instruction_decode.all;

entity instruction_decode_test is
end entity instruction_decode_test;

architecture behav of instruction_decode_test is
    signal sign_extend_test_done: std_logic := '0';
    signal decode_dsp_inputs_test_done: std_logic := '0';
begin

    sign_extend_test: process
    begin
        wait for 1 ns;

        assert "0101" = sign_extend("0101", 4)
        report "Vector representing positive number extended to same length should result in the same vector."
        severity failure;

        assert "1101" = sign_extend("1101", 4)
        report "Vector representing negative number extended to same length should result in the same vector."
        severity failure;

        assert "00101" = sign_extend("0101", 5)
        report "Vector representing positive number extended to longer length should result in the same vector with prepended zeros."
        severity failure;

        assert "11101" = sign_extend("1101", 5)
        report "Vector representing negative number extended to longer length should result in the same vector with prepended ones."
        severity failure;

        sign_extend_test_done <= '1';
    end process sign_extend_test;


    decode_dsp_inputs_test: process
    begin
        wait for 1 ns;

        decode_dsp_inputs_test_done <= '1';
    end process decode_dsp_inputs_test;


    done: process(sign_extend_test_done, decode_dsp_inputs_test_done)
    begin
        if sign_extend_test_done = '1' and
           decode_dsp_inputs_test_done = '1' then
            report "DONE" severity failure;
        end if;
    end process done;

end architecture behav;
