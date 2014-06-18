
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain16 is
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
end Bichain16;

architecture behav of Bichain16 is

    
        signal fifo_inputs_140446931844232: core_fifo_inputs_t;
        signal fifo_full_140446931844232: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844232: core_fifo_inputs_t;
        signal outputs_full_140446931844232: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844176: core_fifo_inputs_t;
        signal fifo_full_140446931844176: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844176: core_fifo_inputs_t;
        signal outputs_full_140446931844176: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844400: core_fifo_inputs_t;
        signal fifo_full_140446931844400: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844400: core_fifo_inputs_t;
        signal outputs_full_140446931844400: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844456: core_fifo_inputs_t;
        signal fifo_full_140446931844456: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844456: core_fifo_inputs_t;
        signal outputs_full_140446931844456: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844512: core_fifo_inputs_t;
        signal fifo_full_140446931844512: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844512: core_fifo_inputs_t;
        signal outputs_full_140446931844512: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844344: core_fifo_inputs_t;
        signal fifo_full_140446931844344: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844344: core_fifo_inputs_t;
        signal outputs_full_140446931844344: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844568: core_fifo_inputs_t;
        signal fifo_full_140446931844568: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844568: core_fifo_inputs_t;
        signal outputs_full_140446931844568: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844624: core_fifo_inputs_t;
        signal fifo_full_140446931844624: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844624: core_fifo_inputs_t;
        signal outputs_full_140446931844624: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844680: core_fifo_inputs_t;
        signal fifo_full_140446931844680: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844680: core_fifo_inputs_t;
        signal outputs_full_140446931844680: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844736: core_fifo_inputs_t;
        signal fifo_full_140446931844736: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844736: core_fifo_inputs_t;
        signal outputs_full_140446931844736: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844288: core_fifo_inputs_t;
        signal fifo_full_140446931844288: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844288: core_fifo_inputs_t;
        signal outputs_full_140446931844288: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844792: core_fifo_inputs_t;
        signal fifo_full_140446931844792: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844792: core_fifo_inputs_t;
        signal outputs_full_140446931844792: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844848: core_fifo_inputs_t;
        signal fifo_full_140446931844848: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844848: core_fifo_inputs_t;
        signal outputs_full_140446931844848: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844904: core_fifo_inputs_t;
        signal fifo_full_140446931844904: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844904: core_fifo_inputs_t;
        signal outputs_full_140446931844904: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931844960: core_fifo_inputs_t;
        signal fifo_full_140446931844960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931844960: core_fifo_inputs_t;
        signal outputs_full_140446931844960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140446931845016: core_fifo_inputs_t;
        signal fifo_full_140446931845016: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140446931845016: core_fifo_inputs_t;
        signal outputs_full_140446931845016: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin
        outputs(0) <= outputs_140446931845016(0);
        outputs_full_140446931845016(0) <= outputs_full(0);
        
        outputs(1) <= outputs_140446931844232(1);
        outputs_full_140446931844232(1) <= outputs_full(1);
        
        fifo_inputs_140446931845016(0) <= fifo_inputs(0);
        fifo_full(0) <= fifo_full_140446931845016(0);
                
        fifo_inputs_140446931844232(1) <= fifo_inputs(1);
        fifo_full(1) <= fifo_full_140446931844232(1);
    
        fifo_inputs_140446931844176(1) <= outputs_140446931844232(0);
        outputs_full_140446931844232(0) <= fifo_full_140446931844176(1);
        
        fifo_inputs_140446931844400(1) <= outputs_140446931844176(0);
        outputs_full_140446931844176(0) <= fifo_full_140446931844400(1);
        
        fifo_inputs_140446931844232(0) <= outputs_140446931844176(1);
        outputs_full_140446931844176(1) <= fifo_full_140446931844232(0);
        
        fifo_inputs_140446931844456(1) <= outputs_140446931844400(0);
        outputs_full_140446931844400(0) <= fifo_full_140446931844456(1);
        
        fifo_inputs_140446931844176(0) <= outputs_140446931844400(1);
        outputs_full_140446931844400(1) <= fifo_full_140446931844176(0);
        
        fifo_inputs_140446931844512(1) <= outputs_140446931844456(0);
        outputs_full_140446931844456(0) <= fifo_full_140446931844512(1);
        
        fifo_inputs_140446931844400(0) <= outputs_140446931844456(1);
        outputs_full_140446931844456(1) <= fifo_full_140446931844400(0);
        
        fifo_inputs_140446931844344(1) <= outputs_140446931844512(0);
        outputs_full_140446931844512(0) <= fifo_full_140446931844344(1);
        
        fifo_inputs_140446931844456(0) <= outputs_140446931844512(1);
        outputs_full_140446931844512(1) <= fifo_full_140446931844456(0);
        
        fifo_inputs_140446931844568(1) <= outputs_140446931844344(0);
        outputs_full_140446931844344(0) <= fifo_full_140446931844568(1);
        
        fifo_inputs_140446931844512(0) <= outputs_140446931844344(1);
        outputs_full_140446931844344(1) <= fifo_full_140446931844512(0);
        
        fifo_inputs_140446931844624(1) <= outputs_140446931844568(0);
        outputs_full_140446931844568(0) <= fifo_full_140446931844624(1);
        
        fifo_inputs_140446931844344(0) <= outputs_140446931844568(1);
        outputs_full_140446931844568(1) <= fifo_full_140446931844344(0);
        
        fifo_inputs_140446931844680(1) <= outputs_140446931844624(0);
        outputs_full_140446931844624(0) <= fifo_full_140446931844680(1);
        
        fifo_inputs_140446931844568(0) <= outputs_140446931844624(1);
        outputs_full_140446931844624(1) <= fifo_full_140446931844568(0);
        
        fifo_inputs_140446931844736(1) <= outputs_140446931844680(0);
        outputs_full_140446931844680(0) <= fifo_full_140446931844736(1);
        
        fifo_inputs_140446931844624(0) <= outputs_140446931844680(1);
        outputs_full_140446931844680(1) <= fifo_full_140446931844624(0);
        
        fifo_inputs_140446931844288(1) <= outputs_140446931844736(0);
        outputs_full_140446931844736(0) <= fifo_full_140446931844288(1);
        
        fifo_inputs_140446931844680(0) <= outputs_140446931844736(1);
        outputs_full_140446931844736(1) <= fifo_full_140446931844680(0);
        
        fifo_inputs_140446931844792(1) <= outputs_140446931844288(0);
        outputs_full_140446931844288(0) <= fifo_full_140446931844792(1);
        
        fifo_inputs_140446931844736(0) <= outputs_140446931844288(1);
        outputs_full_140446931844288(1) <= fifo_full_140446931844736(0);
        
        fifo_inputs_140446931844848(1) <= outputs_140446931844792(0);
        outputs_full_140446931844792(0) <= fifo_full_140446931844848(1);
        
        fifo_inputs_140446931844288(0) <= outputs_140446931844792(1);
        outputs_full_140446931844792(1) <= fifo_full_140446931844288(0);
        
        fifo_inputs_140446931844904(1) <= outputs_140446931844848(0);
        outputs_full_140446931844848(0) <= fifo_full_140446931844904(1);
        
        fifo_inputs_140446931844792(0) <= outputs_140446931844848(1);
        outputs_full_140446931844848(1) <= fifo_full_140446931844792(0);
        
        fifo_inputs_140446931844960(1) <= outputs_140446931844904(0);
        outputs_full_140446931844904(0) <= fifo_full_140446931844960(1);
        
        fifo_inputs_140446931844848(0) <= outputs_140446931844904(1);
        outputs_full_140446931844904(1) <= fifo_full_140446931844848(0);
        
        fifo_inputs_140446931845016(1) <= outputs_140446931844960(0);
        outputs_full_140446931844960(0) <= fifo_full_140446931845016(1);
        
        fifo_inputs_140446931844904(0) <= outputs_140446931844960(1);
        outputs_full_140446931844960(1) <= fifo_full_140446931844904(0);
        
        fifo_inputs_140446931844960(0) <= outputs_140446931845016(1);
        outputs_full_140446931845016(1) <= fifo_full_140446931844960(0);
        

    
        core_inst_140446931844232: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844232,
            fifo_full => fifo_full_140446931844232,
            outputs => outputs_140446931844232,
            outputs_full => outputs_full_140446931844232
        );
        
        core_inst_140446931844176: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844176,
            fifo_full => fifo_full_140446931844176,
            outputs => outputs_140446931844176,
            outputs_full => outputs_full_140446931844176
        );
        
        core_inst_140446931844400: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844400,
            fifo_full => fifo_full_140446931844400,
            outputs => outputs_140446931844400,
            outputs_full => outputs_full_140446931844400
        );
        
        core_inst_140446931844456: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844456,
            fifo_full => fifo_full_140446931844456,
            outputs => outputs_140446931844456,
            outputs_full => outputs_full_140446931844456
        );
        
        core_inst_140446931844512: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844512,
            fifo_full => fifo_full_140446931844512,
            outputs => outputs_140446931844512,
            outputs_full => outputs_full_140446931844512
        );
        
        core_inst_140446931844344: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844344,
            fifo_full => fifo_full_140446931844344,
            outputs => outputs_140446931844344,
            outputs_full => outputs_full_140446931844344
        );
        
        core_inst_140446931844568: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844568,
            fifo_full => fifo_full_140446931844568,
            outputs => outputs_140446931844568,
            outputs_full => outputs_full_140446931844568
        );
        
        core_inst_140446931844624: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844624,
            fifo_full => fifo_full_140446931844624,
            outputs => outputs_140446931844624,
            outputs_full => outputs_full_140446931844624
        );
        
        core_inst_140446931844680: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844680,
            fifo_full => fifo_full_140446931844680,
            outputs => outputs_140446931844680,
            outputs_full => outputs_full_140446931844680
        );
        
        core_inst_140446931844736: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844736,
            fifo_full => fifo_full_140446931844736,
            outputs => outputs_140446931844736,
            outputs_full => outputs_full_140446931844736
        );
        
        core_inst_140446931844288: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844288,
            fifo_full => fifo_full_140446931844288,
            outputs => outputs_140446931844288,
            outputs_full => outputs_full_140446931844288
        );
        
        core_inst_140446931844792: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844792,
            fifo_full => fifo_full_140446931844792,
            outputs => outputs_140446931844792,
            outputs_full => outputs_full_140446931844792
        );
        
        core_inst_140446931844848: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844848,
            fifo_full => fifo_full_140446931844848,
            outputs => outputs_140446931844848,
            outputs_full => outputs_full_140446931844848
        );
        
        core_inst_140446931844904: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844904,
            fifo_full => fifo_full_140446931844904,
            outputs => outputs_140446931844904,
            outputs_full => outputs_full_140446931844904
        );
        
        core_inst_140446931844960: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931844960,
            fifo_full => fifo_full_140446931844960,
            outputs => outputs_140446931844960,
            outputs_full => outputs_full_140446931844960
        );
        
        core_inst_140446931845016: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140446931845016,
            fifo_full => fifo_full_140446931845016,
            outputs => outputs_140446931845016,
            outputs_full => outputs_full_140446931845016
        );
        

end behav;

