
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Grid4x4 is
    port (
        clk: in std_logic;
        clk_en: in std_logic;
        reset: in std_logic;
        addr: in ram_addr;
        data: in word;
        we: in std_logic;
        fifo_inputs: in core_fifo_inputs_t;
        fifo_full: out std_logic_vector(0 to NUM_CORE_FIFOS-1);
        outputs: out core_fifo_inputs_t;
        outputs_full: in std_logic_vector(0 to NUM_CORE_FIFOS-1)
    );
end Grid4x4;

architecture behav of Grid4x4 is

    
        signal fifo_inputs_140247160412312: core_fifo_inputs_t;
        signal fifo_full_140247160412312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412312: core_fifo_inputs_t;
        signal outputs_full_140247160412312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412536: core_fifo_inputs_t;
        signal fifo_full_140247160412536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412536: core_fifo_inputs_t;
        signal outputs_full_140247160412536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412480: core_fifo_inputs_t;
        signal fifo_full_140247160412480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412480: core_fifo_inputs_t;
        signal outputs_full_140247160412480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412592: core_fifo_inputs_t;
        signal fifo_full_140247160412592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412592: core_fifo_inputs_t;
        signal outputs_full_140247160412592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412648: core_fifo_inputs_t;
        signal fifo_full_140247160412648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412648: core_fifo_inputs_t;
        signal outputs_full_140247160412648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412704: core_fifo_inputs_t;
        signal fifo_full_140247160412704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412704: core_fifo_inputs_t;
        signal outputs_full_140247160412704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412760: core_fifo_inputs_t;
        signal fifo_full_140247160412760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412760: core_fifo_inputs_t;
        signal outputs_full_140247160412760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412816: core_fifo_inputs_t;
        signal fifo_full_140247160412816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412816: core_fifo_inputs_t;
        signal outputs_full_140247160412816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412872: core_fifo_inputs_t;
        signal fifo_full_140247160412872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412872: core_fifo_inputs_t;
        signal outputs_full_140247160412872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412424: core_fifo_inputs_t;
        signal fifo_full_140247160412424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412424: core_fifo_inputs_t;
        signal outputs_full_140247160412424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412928: core_fifo_inputs_t;
        signal fifo_full_140247160412928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412928: core_fifo_inputs_t;
        signal outputs_full_140247160412928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160412984: core_fifo_inputs_t;
        signal fifo_full_140247160412984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160412984: core_fifo_inputs_t;
        signal outputs_full_140247160412984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160413040: core_fifo_inputs_t;
        signal fifo_full_140247160413040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160413040: core_fifo_inputs_t;
        signal outputs_full_140247160413040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160413096: core_fifo_inputs_t;
        signal fifo_full_140247160413096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160413096: core_fifo_inputs_t;
        signal outputs_full_140247160413096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160413152: core_fifo_inputs_t;
        signal fifo_full_140247160413152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160413152: core_fifo_inputs_t;
        signal outputs_full_140247160413152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140247160413208: core_fifo_inputs_t;
        signal fifo_full_140247160413208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140247160413208: core_fifo_inputs_t;
        signal outputs_full_140247160413208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

    
        fifo_inputs_140247160412648(0) <= outputs_140247160412312(0);
        outputs_full_140247160412312(0) <= fifo_full_140247160412648(0);
        
        fifo_inputs_140247160412536(1) <= outputs_140247160412312(1);
        outputs_full_140247160412312(1) <= fifo_full_140247160412536(1);
        
        fifo_inputs_140247160412704(0) <= outputs_140247160412536(0);
        outputs_full_140247160412536(0) <= fifo_full_140247160412704(0);
        
        fifo_inputs_140247160412480(1) <= outputs_140247160412536(1);
        outputs_full_140247160412536(1) <= fifo_full_140247160412480(1);
        
        fifo_inputs_140247160412312(2) <= outputs_140247160412536(2);
        outputs_full_140247160412536(2) <= fifo_full_140247160412312(2);
        
        fifo_inputs_140247160412760(0) <= outputs_140247160412480(0);
        outputs_full_140247160412480(0) <= fifo_full_140247160412760(0);
        
        fifo_inputs_140247160412592(1) <= outputs_140247160412480(1);
        outputs_full_140247160412480(1) <= fifo_full_140247160412592(1);
        
        fifo_inputs_140247160412536(2) <= outputs_140247160412480(2);
        outputs_full_140247160412480(2) <= fifo_full_140247160412536(2);
        
        fifo_inputs_140247160412816(0) <= outputs_140247160412592(0);
        outputs_full_140247160412592(0) <= fifo_full_140247160412816(0);
        
        fifo_inputs_140247160412480(1) <= outputs_140247160412592(1);
        outputs_full_140247160412592(1) <= fifo_full_140247160412480(1);
        
        fifo_inputs_140247160412872(0) <= outputs_140247160412648(0);
        outputs_full_140247160412648(0) <= fifo_full_140247160412872(0);
        
        fifo_inputs_140247160412704(1) <= outputs_140247160412648(1);
        outputs_full_140247160412648(1) <= fifo_full_140247160412704(1);
        
        fifo_inputs_140247160412312(2) <= outputs_140247160412648(2);
        outputs_full_140247160412648(2) <= fifo_full_140247160412312(2);
        
        fifo_inputs_140247160412424(0) <= outputs_140247160412704(0);
        outputs_full_140247160412704(0) <= fifo_full_140247160412424(0);
        
        fifo_inputs_140247160412760(1) <= outputs_140247160412704(1);
        outputs_full_140247160412704(1) <= fifo_full_140247160412760(1);
        
        fifo_inputs_140247160412536(2) <= outputs_140247160412704(2);
        outputs_full_140247160412704(2) <= fifo_full_140247160412536(2);
        
        fifo_inputs_140247160412648(3) <= outputs_140247160412704(3);
        outputs_full_140247160412704(3) <= fifo_full_140247160412648(3);
        
        fifo_inputs_140247160412928(0) <= outputs_140247160412760(0);
        outputs_full_140247160412760(0) <= fifo_full_140247160412928(0);
        
        fifo_inputs_140247160412816(1) <= outputs_140247160412760(1);
        outputs_full_140247160412760(1) <= fifo_full_140247160412816(1);
        
        fifo_inputs_140247160412480(2) <= outputs_140247160412760(2);
        outputs_full_140247160412760(2) <= fifo_full_140247160412480(2);
        
        fifo_inputs_140247160412704(3) <= outputs_140247160412760(3);
        outputs_full_140247160412760(3) <= fifo_full_140247160412704(3);
        
        fifo_inputs_140247160412984(0) <= outputs_140247160412816(0);
        outputs_full_140247160412816(0) <= fifo_full_140247160412984(0);
        
        fifo_inputs_140247160412592(1) <= outputs_140247160412816(1);
        outputs_full_140247160412816(1) <= fifo_full_140247160412592(1);
        
        fifo_inputs_140247160412760(2) <= outputs_140247160412816(2);
        outputs_full_140247160412816(2) <= fifo_full_140247160412760(2);
        
        fifo_inputs_140247160413040(0) <= outputs_140247160412872(0);
        outputs_full_140247160412872(0) <= fifo_full_140247160413040(0);
        
        fifo_inputs_140247160412424(1) <= outputs_140247160412872(1);
        outputs_full_140247160412872(1) <= fifo_full_140247160412424(1);
        
        fifo_inputs_140247160412648(2) <= outputs_140247160412872(2);
        outputs_full_140247160412872(2) <= fifo_full_140247160412648(2);
        
        fifo_inputs_140247160413096(0) <= outputs_140247160412424(0);
        outputs_full_140247160412424(0) <= fifo_full_140247160413096(0);
        
        fifo_inputs_140247160412928(1) <= outputs_140247160412424(1);
        outputs_full_140247160412424(1) <= fifo_full_140247160412928(1);
        
        fifo_inputs_140247160412704(2) <= outputs_140247160412424(2);
        outputs_full_140247160412424(2) <= fifo_full_140247160412704(2);
        
        fifo_inputs_140247160412872(3) <= outputs_140247160412424(3);
        outputs_full_140247160412424(3) <= fifo_full_140247160412872(3);
        
        fifo_inputs_140247160413152(0) <= outputs_140247160412928(0);
        outputs_full_140247160412928(0) <= fifo_full_140247160413152(0);
        
        fifo_inputs_140247160412984(1) <= outputs_140247160412928(1);
        outputs_full_140247160412928(1) <= fifo_full_140247160412984(1);
        
        fifo_inputs_140247160412760(2) <= outputs_140247160412928(2);
        outputs_full_140247160412928(2) <= fifo_full_140247160412760(2);
        
        fifo_inputs_140247160412424(3) <= outputs_140247160412928(3);
        outputs_full_140247160412928(3) <= fifo_full_140247160412424(3);
        
        fifo_inputs_140247160413208(0) <= outputs_140247160412984(0);
        outputs_full_140247160412984(0) <= fifo_full_140247160413208(0);
        
        fifo_inputs_140247160412816(1) <= outputs_140247160412984(1);
        outputs_full_140247160412984(1) <= fifo_full_140247160412816(1);
        
        fifo_inputs_140247160412928(2) <= outputs_140247160412984(2);
        outputs_full_140247160412984(2) <= fifo_full_140247160412928(2);
        
        fifo_inputs_140247160413096(0) <= outputs_140247160413040(0);
        outputs_full_140247160413040(0) <= fifo_full_140247160413096(0);
        
        fifo_inputs_140247160412872(1) <= outputs_140247160413040(1);
        outputs_full_140247160413040(1) <= fifo_full_140247160412872(1);
        
        fifo_inputs_140247160413152(0) <= outputs_140247160413096(0);
        outputs_full_140247160413096(0) <= fifo_full_140247160413152(0);
        
        fifo_inputs_140247160412424(1) <= outputs_140247160413096(1);
        outputs_full_140247160413096(1) <= fifo_full_140247160412424(1);
        
        fifo_inputs_140247160413040(2) <= outputs_140247160413096(2);
        outputs_full_140247160413096(2) <= fifo_full_140247160413040(2);
        
        fifo_inputs_140247160413208(0) <= outputs_140247160413152(0);
        outputs_full_140247160413152(0) <= fifo_full_140247160413208(0);
        
        fifo_inputs_140247160412928(1) <= outputs_140247160413152(1);
        outputs_full_140247160413152(1) <= fifo_full_140247160412928(1);
        
        fifo_inputs_140247160413096(2) <= outputs_140247160413152(2);
        outputs_full_140247160413152(2) <= fifo_full_140247160413096(2);
        
        fifo_inputs_140247160412984(0) <= outputs_140247160413208(0);
        outputs_full_140247160413208(0) <= fifo_full_140247160412984(0);
        
        fifo_inputs_140247160413152(1) <= outputs_140247160413208(1);
        outputs_full_140247160413208(1) <= fifo_full_140247160413152(1);
        

    
        core_inst_140247160412312: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412312,
            fifo_full => fifo_full_140247160412312,
            outputs => outputs_140247160412312,
            outputs_full => outputs_full_140247160412312
        );
        
        core_inst_140247160412536: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412536,
            fifo_full => fifo_full_140247160412536,
            outputs => outputs_140247160412536,
            outputs_full => outputs_full_140247160412536
        );
        
        core_inst_140247160412480: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412480,
            fifo_full => fifo_full_140247160412480,
            outputs => outputs_140247160412480,
            outputs_full => outputs_full_140247160412480
        );
        
        core_inst_140247160412592: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412592,
            fifo_full => fifo_full_140247160412592,
            outputs => outputs_140247160412592,
            outputs_full => outputs_full_140247160412592
        );
        
        core_inst_140247160412648: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412648,
            fifo_full => fifo_full_140247160412648,
            outputs => outputs_140247160412648,
            outputs_full => outputs_full_140247160412648
        );
        
        core_inst_140247160412704: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412704,
            fifo_full => fifo_full_140247160412704,
            outputs => outputs_140247160412704,
            outputs_full => outputs_full_140247160412704
        );
        
        core_inst_140247160412760: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412760,
            fifo_full => fifo_full_140247160412760,
            outputs => outputs_140247160412760,
            outputs_full => outputs_full_140247160412760
        );
        
        core_inst_140247160412816: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412816,
            fifo_full => fifo_full_140247160412816,
            outputs => outputs_140247160412816,
            outputs_full => outputs_full_140247160412816
        );
        
        core_inst_140247160412872: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412872,
            fifo_full => fifo_full_140247160412872,
            outputs => outputs_140247160412872,
            outputs_full => outputs_full_140247160412872
        );
        
        core_inst_140247160412424: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412424,
            fifo_full => fifo_full_140247160412424,
            outputs => outputs_140247160412424,
            outputs_full => outputs_full_140247160412424
        );
        
        core_inst_140247160412928: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412928,
            fifo_full => fifo_full_140247160412928,
            outputs => outputs_140247160412928,
            outputs_full => outputs_full_140247160412928
        );
        
        core_inst_140247160412984: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160412984,
            fifo_full => fifo_full_140247160412984,
            outputs => outputs_140247160412984,
            outputs_full => outputs_full_140247160412984
        );
        
        core_inst_140247160413040: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160413040,
            fifo_full => fifo_full_140247160413040,
            outputs => outputs_140247160413040,
            outputs_full => outputs_full_140247160413040
        );
        
        core_inst_140247160413096: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160413096,
            fifo_full => fifo_full_140247160413096,
            outputs => outputs_140247160413096,
            outputs_full => outputs_full_140247160413096
        );
        
        core_inst_140247160413152: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160413152,
            fifo_full => fifo_full_140247160413152,
            outputs => outputs_140247160413152,
            outputs_full => outputs_full_140247160413152
        );
        
        core_inst_140247160413208: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140247160413208,
            fifo_full => fifo_full_140247160413208,
            outputs => outputs_140247160413208,
            outputs_full => outputs_full_140247160413208
        );
        

end behav;

