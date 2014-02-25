library ieee;
library unisim;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use unisim.vcomponents.all;
use work.all;
use work.core_config.all;
use work.opcodes.all;

entity Core is
    port (
        clk: in std_logic;
        reset: in std_logic;
        addr: in ram_addr;
        data: in word;
        we: in std_logic
    );
end Core;

architecture behav of Core is

    -- read ports of the register file
    signal doa, dob, doc, dod: word;
    signal rdoa, rdob, rdoc, rdod: word;

    -- write ports of the register file
    signal did: word;

    -- block ram address for port a
    signal br_addra: ram_addr;

    -- read ports of the block ram
    signal br_doa, br_dob: word;

    -- write ports of the block ram
    signal br_dib: word;

    -- inputs to ALU
    signal ain, bin: word;

    -- instruction word
    signal instr_word: word;

    -- decoded instruction
    type instr_pipeline is array (0 to 5) of Instruction;
    signal instr: instr_pipeline;

    -- program counter
    signal pc: ram_addr;

    -- accumulator
    signal acc: word;
    signal alu_result: word;

begin

    Accumulator: process
    begin
        wait until clk'event and clk = '1';
        if instr(5).acc_we = '1' then
            acc <= alu_result;
        end if;

        if reset = '1' then
            acc <= (others => '0');
        end if;
    end process Accumulator;

    BlockRamPortAAddress: process(pc, addr, we)
    begin
        br_addra <= pc;
        if we = '1' then
            br_addra <= addr;
        end if;
    end process BlockRamPortAAddress;

    InstructionWord: process(we, br_doa)
    begin
        instr_word <= br_doa;
        if we = '1' then
            instr_word <= (others => '0');
        end if;
    end process InstructionWord;

    ProgramCounter: process
    begin
        wait until clk'event and clk = '1';

        if we = '0' then
            pc <= std_logic_vector(unsigned(pc) + 1);
        end if;

        if reset = '1' then
            pc <= (others => '0');
        end if;
    end process ProgramCounter;

    PipelineRegisters: process
    begin
        wait until clk'event and clk = '1';
        rdoa <= doa;
        rdob <= dob;
        rdoc <= doc;
        rdod <= dod;
        instr(1 to 5) <= instr(0 to 4);

        if reset = '1' then
            rdoa <= (others => '0');
            rdob <= (others => '0');
            rdoc <= (others => '0');
            rdod <= (others => '0');
            instr(1 to 5) <= (others => (
                (others => '0'),
                (others => '0'),
                (others => '0'),
                (others => '0'),
                (others => '0'),
                (others => '0'),
                '0',
                (others => '0'),
                '0',
                (others => '0'),
                (others => '0'),
                '0'
            ));
        end if;
    end process PipelineRegisters;

    InstructionDecodeInst: entity InstructionDecode
    port map (
        instr_word => instr_word,
        instr => instr(0)
    );

    ALUInputs: process(rdoa, rdob, instr)
    begin
        ain <= rdoa;
        bin <= rdob;
        case instr(3).op is
            when OP_MOVA =>
                ain <= (others => '0');
                bin <= (others => '0');
                bin(Instruction.data'range) <= instr(3).data;

            when OP_MOVAR =>
                ain <= (others => '0');

            when OP_MOVRR =>
                ain <= (others => '0');

            when others =>

        end case;
    end process ALUInputs;

    RegisterFileInput: process(alu_result)
    begin
        did <= alu_result;
    end process RegisterFileInput;

    --ALUInst: entity ALU
    --port map (
        --clk => clk,
        --reset => reset,
        --op => instr(3).op,
        --alumode => instr(3).alumode,
        --opmode => instr(3).opmode,
        --ain => ain,
        --bin => bin,
        --result => alu_result
    --);

    GenerateRegisterFile: for i in 0 to 17 generate
        RAM64M_inst : RAM64M
        generic map (
            INIT_A => X"0000000000000000", -- Initial contents of A port
            INIT_B => X"0000000000000000", -- Initial contents of B port
            INIT_C => X"0000000000000000", -- Initial contents of C port
            INIT_D => X"0000000000000000") -- Initial contents of D port
        port map (
             DOA => doa(i), -- Read port A 1-bit output
             DOB => dob(i), -- Read port B 1-bit output
             DOC => doc(i), -- Read port C 1-bit output
             DOD => dod(i), -- Read/Write port D 1-bit output
             ADDRA => instr(1).addra, -- Read port A 6-bit address input
             ADDRB => instr(1).addrb, -- Read port B 6-bit address input
             ADDRC => instr(1).addrc, -- Read port C 6-bit address input
             ADDRD => instr(5).addrd, -- Read/Write port D 6-bit address input
             DIA => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRA
             DIB => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRB
             DIC => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRC
             DID => did(i), -- RAM 1-bit data write input addressed by ADDRD,
                         -- read addressed by ADDRD
             WCLK => clk, -- Write clock input
             WE => instr(5).rwe -- Write enable input
         );
    end generate GenerateRegisterFile;

    MainRam : entity BlockRam
    port map (
        reset => reset,
        addra => br_addra,
        addrb => instr(1).br_addrb,
        dia => data,
        dib => br_dib,
        doa => br_doa,
        dob => br_dob,
        clk => clk,
        wea => we,
        web => instr(1).br_web
    );

end behav;
