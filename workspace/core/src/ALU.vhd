library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;
use work.core_interface.all;

entity ALU is
    port (
        clk: in std_logic;
        mode: in opcode;
        ain, bin: in word;
        acc: out word
    );
end ALU;

architecture behav of ALU is

    signal accumulator: std_logic_vector(47 downto 0);
    signal a: std_logic_vector(29 downto 0);
    signal b: std_logic_vector(17 downto 0);

    signal acout: std_logic_vector(29 downto 0);
    signal bcout: std_logic_vector(17 downto 0);
    signal carrycascout, multisignout: std_logic;
    signal pcout: std_logic_vector(47 downto 0);
    signal overflow, patternbdetect, patterndetect, underflow: std_logic;
    signal carryout: std_logic_vector(3 downto 0);
    signal acin: std_logic_vector(29 downto 0);
    signal bcin: std_logic_vector(17 downto 0);
    signal multisignin: std_logic;
    signal alumode: std_logic_vector(3 downto 0);
    signal carryinsel: std_logic_vector(2 downto 0);
    signal inmode: std_logic_vector(4 downto 0);
    signal opmode: std_logic_vector(6 downto 0);

begin

    acc <= accumulator(17 downto 0);

    -- Unused inputs with default values
    acin <= (others => '0');
    bcin <= (others => '0');
    carryinsel <= "000"; -- General interconnect
    multisignin <= '0';

    DSPInputs: process(mode)
    begin
        a <= (others => '0');
        b <= bin;
        inmode <= "00000";
        case mode is
            when OP_ADD =>
                if b(17) = '1' then
                    a <= (others => '1');
                end if;
                alumode <= "0000";
                opmode <= "0110011";

            when OP_SUB =>
                if b(17) = '1' then
                    a <= (others => '1');
                end if;
                alumode <= "0011";
                opmode <= "0110011";

            when OP_MAC =>
                a(17 downto 0) <= ain;
                alumode <= "0000";
                opmode <= "0110101";

            when OP_MSC =>
                a(17 downto 0) <= ain;
                alumode <= "0011";
                opmode <= "0110101";

            when others =>
                alumode <= "0000";
                opmode <= "0000000";
        end case;
    end process DSPControlInputs;


    DSP48E1_inst : DSP48E1
    generic map (
        -- Feature Control Attributes: Data Path Selection
        A_INPUT => "DIRECT", -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
        B_INPUT => "DIRECT", -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
        USE_DPORT => FALSE, -- Select D port usage (TRUE or FALSE)
        USE_MULT => "MULTIPLY", -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
        -- Pattern Detector Attributes: Pattern Detection Configuration
        AUTORESET_PATDET => "NO_RESET", -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
        MASK => X"3fffffffffff", -- 48-bit mask value for pattern detect (1=ignore)
        PATTERN => X"000000000000", -- 48-bit pattern match for pattern detect
        SEL_MASK => "MASK", -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
        SEL_PATTERN => "PATTERN", -- Select pattern value ("PATTERN" or "C")
        USE_PATTERN_DETECT => "NO_PATDET", -- Enable pattern detect ("PATDET" or "NO_PATDET")
        -- Register Control Attributes: Pipeline Register Configuration
        ACASCREG => 2, -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
        ADREG => 1, -- Number of pipeline stages for pre-adder (0 or 1)
        ALUMODEREG => 1, -- Number of pipeline stages for ALUMODE (0 or 1)
        AREG => 2, -- Number of pipeline stages for A (0, 1 or 2)
        BCASCREG => 2, -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
        BREG => 2, -- Number of pipeline stages for B (0, 1 or 2)
        CARRYINREG => 1, -- Number of pipeline stages for CARRYIN (0 or 1)
        CARRYINSELREG => 1, -- Number of pipeline stages for CARRYINSEL (0 or 1)
        CREG => 1, -- Number of pipeline stages for C (0 or 1)
        DREG => 1, -- Number of pipeline stages for D (0 or 1)
        INMODEREG => 1, -- Number of pipeline stages for INMODE (0 or 1)
        MREG => 1, -- Number of multiplier pipeline stages (0 or 1)
        OPMODEREG => 1, -- Number of pipeline stages for OPMODE (0 or 1)
        PREG => 1, -- Number of pipeline stages for P (0 or 1)
        USE_SIMD => "ONE48" -- SIMD selection ("ONE48", "TWO24", "FOUR12")
    )
    port map (
        -- Cascade: 30-bit (each) output: Cascade Ports
        ACOUT => acout, -- 30-bit output: A port cascade output
        BCOUT => bcout, -- 18-bit output: B port cascade output
        CARRYCASCOUT => carrycascout, -- 1-bit output: Cascade carry output
        MULTSIGNOUT => multisignout, -- 1-bit output: Multiplier sign cascade output
        PCOUT => pcout, -- 48-bit output: Cascade output
        -- Control: 1-bit (each) output: Control Inputs/Status Bits
        OVERFLOW => overflow, -- 1-bit output: Overflow in add/acc output
        PATTERNBDETECT => patternbdetect, -- 1-bit output: Pattern bar detect output
        PATTERNDETECT => patterndetect, -- 1-bit output: Pattern detect output
        UNDERFLOW => underflow, -- 1-bit output: Underflow in add/acc output
        -- Data: 4-bit (each) output: Data Ports
        CARRYOUT => carryout, -- 4-bit output: Carry output
        P => accumulator, -- 48-bit output: Primary data output
        -- Cascade: 30-bit (each) input: Cascade Ports
        ACIN => acin, -- 30-bit input: A cascade data input
        BCIN => bcin, -- 18-bit input: B cascade input
        CARRYCASCIN => '0', -- 1-bit input: Cascade carry input
        MULTSIGNIN => multisignin, -- 1-bit input: Multiplier sign input
        PCIN => (others => '0'), -- 48-bit input: P cascade input
        -- Control: 4-bit (each) input: Control Inputs/Status Bits
        ALUMODE => alumode, -- 4-bit input: ALU control input
        CARRYINSEL => carryinsel, -- 3-bit input: Carry select input
        CEINMODE => '1', -- 1-bit input: Clock enable input for INMODEREG
        CLK => clk, -- 1-bit input: Clock input
        INMODE => inmode, -- 5-bit input: INMODE control input
        OPMODE => opmode, -- 7-bit input: Operation mode input
        RSTINMODE => '0', -- 1-bit input: Reset input for INMODEREG
        -- Data: 30-bit (each) input: Data Ports
        A => a, -- 30-bit input: A data input
        B => b, -- 18-bit input: B data input
        C => accumulator, -- 48-bit input: C data input
        CARRYIN => '0', -- 1-bit input: Carry input signal
        D => (others => '0'), -- 25-bit input: D data input
        -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
        CEA1 => '1', -- 1-bit input: Clock enable input for 1st stage AREG
        CEA2 => '1', -- 1-bit input: Clock enable input for 2nd stage AREG
        CEAD => '1', -- 1-bit input: Clock enable input for ADREG
        CEALUMODE => '1', -- 1-bit input: Clock enable input for ALUMODERE
        CEB1 => '1', -- 1-bit input: Clock enable input for 1st stage BREG
        CEB2 => '1', -- 1-bit input: Clock enable input for 2nd stage BREG
        CEC => '1', -- 1-bit input: Clock enable input for CREG
        CECARRYIN => '1', -- 1-bit input: Clock enable input for CARRYINREG
        CECTRL => '1', -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
        CED => '1', -- 1-bit input: Clock enable input for DREG
        CEM => '1', -- 1-bit input: Clock enable input for MREG
        CEP => '1', -- 1-bit input: Clock enable input for PREG
        RSTA => '0', -- 1-bit input: Reset input for AREG
        RSTALLCARRYIN => '0', -- 1-bit input: Reset input for CARRYINREG
        RSTALUMODE => '0', -- 1-bit input: Reset input for ALUMODEREG
        RSTB => '0', -- 1-bit input: Reset input for BREG
        RSTC => '0', -- 1-bit input: Reset input for CREG
        RSTCTRL => '0', -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
        RSTD => '0', -- 1-bit input: Reset input for DREG and ADREG
        RSTM => '0', -- 1-bit input: Reset input for MREG
        RSTP => '0' -- 1-bit input: Reset input for PREG
    );

end behav;
