
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain2 is
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
end Bichain2;

architecture behav of Bichain2 is

    
        signal fifo_inputs_140608335653968: core_fifo_inputs_t;
        signal fifo_full_140608335653968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140608335653968: core_fifo_inputs_t;
        signal outputs_full_140608335653968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140608335653912: core_fifo_inputs_t;
        signal fifo_full_140608335653912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140608335653912: core_fifo_inputs_t;
        signal outputs_full_140608335653912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

        outputs(0) <= outputs_140608335653912(0);
        outputs_full_140608335653912(0) <= outputs_full(0);
        
        outputs(1) <= outputs_140608335653968(1);
        outputs_full_140608335653968(1) <= outputs_full(1);
        
        fifo_inputs_140608335653912(0) <= fifo_inputs(0);
        fifo_full(0) <= fifo_full_140608335653912(0);
                
        fifo_inputs_140608335653968(1) <= fifo_inputs(1);
        fifo_full(1) <= fifo_full_140608335653968(1);
    
        fifo_inputs_140608335653912(1) <= outputs_140608335653968(0);
        outputs_full_140608335653968(0) <= fifo_full_140608335653912(1);
        
        fifo_inputs_140608335653968(0) <= outputs_140608335653912(1);
        outputs_full_140608335653912(1) <= fifo_full_140608335653968(0);
        
    
        core_inst_140608335653968: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140608335653968,
            fifo_full => fifo_full_140608335653968,
            outputs => outputs_140608335653968,
            outputs_full => outputs_full_140608335653968
        );
        
        core_inst_140608335653912: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140608335653912,
            fifo_full => fifo_full_140608335653912,
            outputs => outputs_140608335653912,
            outputs_full => outputs_full_140608335653912
        );
        

end behav;

