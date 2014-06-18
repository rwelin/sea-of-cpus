
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain8 is
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
end Bichain8;

architecture behav of Bichain8 is

    
        signal fifo_inputs_139848281959504: core_fifo_inputs_t;
        signal fifo_full_139848281959504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959504: core_fifo_inputs_t;
        signal outputs_full_139848281959504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959448: core_fifo_inputs_t;
        signal fifo_full_139848281959448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959448: core_fifo_inputs_t;
        signal outputs_full_139848281959448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959672: core_fifo_inputs_t;
        signal fifo_full_139848281959672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959672: core_fifo_inputs_t;
        signal outputs_full_139848281959672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959616: core_fifo_inputs_t;
        signal fifo_full_139848281959616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959616: core_fifo_inputs_t;
        signal outputs_full_139848281959616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959728: core_fifo_inputs_t;
        signal fifo_full_139848281959728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959728: core_fifo_inputs_t;
        signal outputs_full_139848281959728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959784: core_fifo_inputs_t;
        signal fifo_full_139848281959784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959784: core_fifo_inputs_t;
        signal outputs_full_139848281959784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959840: core_fifo_inputs_t;
        signal fifo_full_139848281959840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959840: core_fifo_inputs_t;
        signal outputs_full_139848281959840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139848281959896: core_fifo_inputs_t;
        signal fifo_full_139848281959896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139848281959896: core_fifo_inputs_t;
        signal outputs_full_139848281959896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin
        outputs(0) <= outputs_139848281959504(1);
        outputs_full_139848281959504(1) <= fifo_full(0)

        outputs(1) <= outputs_139848281959896(0);
        outputs_full_139848281959896(0) <= fifo_full(1);
 
    
        fifo_inputs_139848281959448(1) <= outputs_139848281959504(0);
        outputs_full_139848281959504(0) <= fifo_full_139848281959448(1);
        
        fifo_inputs_139848281959672(1) <= outputs_139848281959448(0);
        outputs_full_139848281959448(0) <= fifo_full_139848281959672(1);
        
        fifo_inputs_139848281959504(0) <= outputs_139848281959448(1);
        outputs_full_139848281959448(1) <= fifo_full_139848281959504(0);
        
        fifo_inputs_139848281959616(1) <= outputs_139848281959672(0);
        outputs_full_139848281959672(0) <= fifo_full_139848281959616(1);
        
        fifo_inputs_139848281959448(0) <= outputs_139848281959672(1);
        outputs_full_139848281959672(1) <= fifo_full_139848281959448(0);
        
        fifo_inputs_139848281959728(1) <= outputs_139848281959616(0);
        outputs_full_139848281959616(0) <= fifo_full_139848281959728(1);
        
        fifo_inputs_139848281959672(0) <= outputs_139848281959616(1);
        outputs_full_139848281959616(1) <= fifo_full_139848281959672(0);
        
        fifo_inputs_139848281959784(1) <= outputs_139848281959728(0);
        outputs_full_139848281959728(0) <= fifo_full_139848281959784(1);
        
        fifo_inputs_139848281959616(0) <= outputs_139848281959728(1);
        outputs_full_139848281959728(1) <= fifo_full_139848281959616(0);
        
        fifo_inputs_139848281959840(1) <= outputs_139848281959784(0);
        outputs_full_139848281959784(0) <= fifo_full_139848281959840(1);
        
        fifo_inputs_139848281959728(0) <= outputs_139848281959784(1);
        outputs_full_139848281959784(1) <= fifo_full_139848281959728(0);
        
        fifo_inputs_139848281959896(1) <= outputs_139848281959840(0);
        outputs_full_139848281959840(0) <= fifo_full_139848281959896(1);
        
        fifo_inputs_139848281959784(0) <= outputs_139848281959840(1);
        outputs_full_139848281959840(1) <= fifo_full_139848281959784(0);
        
        fifo_inputs_139848281959840(0) <= outputs_139848281959896(1);
        outputs_full_139848281959896(1) <= fifo_full_139848281959840(0);
        

    
        core_inst_139848281959504: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959504,
            fifo_full => fifo_full_139848281959504,
            outputs => outputs_139848281959504,
            outputs_full => outputs_full_139848281959504
        );
        
        core_inst_139848281959448: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959448,
            fifo_full => fifo_full_139848281959448,
            outputs => outputs_139848281959448,
            outputs_full => outputs_full_139848281959448
        );
        
        core_inst_139848281959672: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959672,
            fifo_full => fifo_full_139848281959672,
            outputs => outputs_139848281959672,
            outputs_full => outputs_full_139848281959672
        );
        
        core_inst_139848281959616: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959616,
            fifo_full => fifo_full_139848281959616,
            outputs => outputs_139848281959616,
            outputs_full => outputs_full_139848281959616
        );
        
        core_inst_139848281959728: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959728,
            fifo_full => fifo_full_139848281959728,
            outputs => outputs_139848281959728,
            outputs_full => outputs_full_139848281959728
        );
        
        core_inst_139848281959784: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959784,
            fifo_full => fifo_full_139848281959784,
            outputs => outputs_139848281959784,
            outputs_full => outputs_full_139848281959784
        );
        
        core_inst_139848281959840: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959840,
            fifo_full => fifo_full_139848281959840,
            outputs => outputs_139848281959840,
            outputs_full => outputs_full_139848281959840
        );
        
        core_inst_139848281959896: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139848281959896,
            fifo_full => fifo_full_139848281959896,
            outputs => outputs_139848281959896,
            outputs_full => outputs_full_139848281959896
        );
        

end behav;

