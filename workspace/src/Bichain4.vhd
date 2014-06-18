
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain4 is
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
end Bichain4;

architecture behav of Bichain4 is

    
        signal fifo_inputs_139870630104144: core_fifo_inputs_t;
        signal fifo_full_139870630104144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139870630104144: core_fifo_inputs_t;
        signal outputs_full_139870630104144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139870630104088: core_fifo_inputs_t;
        signal fifo_full_139870630104088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139870630104088: core_fifo_inputs_t;
        signal outputs_full_139870630104088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139870630104312: core_fifo_inputs_t;
        signal fifo_full_139870630104312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139870630104312: core_fifo_inputs_t;
        signal outputs_full_139870630104312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139870630104368: core_fifo_inputs_t;
        signal fifo_full_139870630104368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139870630104368: core_fifo_inputs_t;
        signal outputs_full_139870630104368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin
        outputs(0) <= outputs_139870630104144(1);
        outputs_full_139870630104144(1) <= fifo_full(0)

        outputs(1) <= outputs_139870630104368(0);
        outputs_full_139870630104368(0) <= fifo_full(1);
 
    
        fifo_inputs_139870630104088(1) <= outputs_139870630104144(0);
        outputs_full_139870630104144(0) <= fifo_full_139870630104088(1);
        
        fifo_inputs_139870630104312(1) <= outputs_139870630104088(0);
        outputs_full_139870630104088(0) <= fifo_full_139870630104312(1);
        
        fifo_inputs_139870630104144(0) <= outputs_139870630104088(1);
        outputs_full_139870630104088(1) <= fifo_full_139870630104144(0);
        
        fifo_inputs_139870630104368(1) <= outputs_139870630104312(0);
        outputs_full_139870630104312(0) <= fifo_full_139870630104368(1);
        
        fifo_inputs_139870630104088(0) <= outputs_139870630104312(1);
        outputs_full_139870630104312(1) <= fifo_full_139870630104088(0);
        
        fifo_inputs_139870630104312(0) <= outputs_139870630104368(1);
        outputs_full_139870630104368(1) <= fifo_full_139870630104312(0);
        

    
        core_inst_139870630104144: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139870630104144,
            fifo_full => fifo_full_139870630104144,
            outputs => outputs_139870630104144,
            outputs_full => outputs_full_139870630104144
        );
        
        core_inst_139870630104088: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139870630104088,
            fifo_full => fifo_full_139870630104088,
            outputs => outputs_139870630104088,
            outputs_full => outputs_full_139870630104088
        );
        
        core_inst_139870630104312: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139870630104312,
            fifo_full => fifo_full_139870630104312,
            outputs => outputs_139870630104312,
            outputs_full => outputs_full_139870630104312
        );
        
        core_inst_139870630104368: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139870630104368,
            fifo_full => fifo_full_139870630104368,
            outputs => outputs_139870630104368,
            outputs_full => outputs_full_139870630104368
        );
        

end behav;

