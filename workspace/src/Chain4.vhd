
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Chain4 is
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
end Chain4;

architecture behav of Chain4 is

    
        signal fifo_inputs_139876207954072: core_fifo_inputs_t;
        signal fifo_full_139876207954072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139876207954072: core_fifo_inputs_t;
        signal outputs_full_139876207954072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139876207954296: core_fifo_inputs_t;
        signal fifo_full_139876207954296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139876207954296: core_fifo_inputs_t;
        signal outputs_full_139876207954296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139876207954240: core_fifo_inputs_t;
        signal fifo_full_139876207954240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139876207954240: core_fifo_inputs_t;
        signal outputs_full_139876207954240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139876207954352: core_fifo_inputs_t;
        signal fifo_full_139876207954352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139876207954352: core_fifo_inputs_t;
        signal outputs_full_139876207954352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

    
        fifo_inputs_139876207954296(0) <= outputs_139876207954072(0);
        outputs_full_139876207954072(0) <= fifo_full_139876207954296(0);
        
        fifo_inputs_139876207954240(0) <= outputs_139876207954296(0);
        outputs_full_139876207954296(0) <= fifo_full_139876207954240(0);
        
        fifo_inputs_139876207954352(0) <= outputs_139876207954240(0);
        outputs_full_139876207954240(0) <= fifo_full_139876207954352(0);
        

    
        core_inst_139876207954072: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139876207954072,
            fifo_full => fifo_full_139876207954072,
            outputs => outputs_139876207954072,
            outputs_full => outputs_full_139876207954072
        );
        
        core_inst_139876207954296: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139876207954296,
            fifo_full => fifo_full_139876207954296,
            outputs => outputs_139876207954296,
            outputs_full => outputs_full_139876207954296
        );
        
        core_inst_139876207954240: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139876207954240,
            fifo_full => fifo_full_139876207954240,
            outputs => outputs_139876207954240,
            outputs_full => outputs_full_139876207954240
        );
        
        core_inst_139876207954352: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139876207954352,
            fifo_full => fifo_full_139876207954352,
            outputs => outputs_139876207954352,
            outputs_full => outputs_full_139876207954352
        );
        

end behav;

