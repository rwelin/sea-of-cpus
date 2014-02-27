library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.instruction_decode.all;

entity instruction_decode_test is
end entity instruction_decode_test;

architecture behav of instruction_decode_test is
begin

    sign_extend_test: process
    begin
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

        report "DONE" severity failure;
    end process sign_extend_test;

end architecture behav;
