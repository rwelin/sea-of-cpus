
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain32 is
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
end Bichain32;

architecture behav of Bichain32 is

    
        signal fifo_inputs_139962970446984: core_fifo_inputs_t;
        signal fifo_full_139962970446984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970446984: core_fifo_inputs_t;
        signal outputs_full_139962970446984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970446928: core_fifo_inputs_t;
        signal fifo_full_139962970446928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970446928: core_fifo_inputs_t;
        signal outputs_full_139962970446928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447152: core_fifo_inputs_t;
        signal fifo_full_139962970447152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447152: core_fifo_inputs_t;
        signal outputs_full_139962970447152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447208: core_fifo_inputs_t;
        signal fifo_full_139962970447208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447208: core_fifo_inputs_t;
        signal outputs_full_139962970447208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447264: core_fifo_inputs_t;
        signal fifo_full_139962970447264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447264: core_fifo_inputs_t;
        signal outputs_full_139962970447264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447096: core_fifo_inputs_t;
        signal fifo_full_139962970447096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447096: core_fifo_inputs_t;
        signal outputs_full_139962970447096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447320: core_fifo_inputs_t;
        signal fifo_full_139962970447320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447320: core_fifo_inputs_t;
        signal outputs_full_139962970447320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447376: core_fifo_inputs_t;
        signal fifo_full_139962970447376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447376: core_fifo_inputs_t;
        signal outputs_full_139962970447376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447432: core_fifo_inputs_t;
        signal fifo_full_139962970447432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447432: core_fifo_inputs_t;
        signal outputs_full_139962970447432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447488: core_fifo_inputs_t;
        signal fifo_full_139962970447488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447488: core_fifo_inputs_t;
        signal outputs_full_139962970447488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447040: core_fifo_inputs_t;
        signal fifo_full_139962970447040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447040: core_fifo_inputs_t;
        signal outputs_full_139962970447040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447544: core_fifo_inputs_t;
        signal fifo_full_139962970447544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447544: core_fifo_inputs_t;
        signal outputs_full_139962970447544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447600: core_fifo_inputs_t;
        signal fifo_full_139962970447600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447600: core_fifo_inputs_t;
        signal outputs_full_139962970447600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447656: core_fifo_inputs_t;
        signal fifo_full_139962970447656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447656: core_fifo_inputs_t;
        signal outputs_full_139962970447656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447712: core_fifo_inputs_t;
        signal fifo_full_139962970447712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447712: core_fifo_inputs_t;
        signal outputs_full_139962970447712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447768: core_fifo_inputs_t;
        signal fifo_full_139962970447768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447768: core_fifo_inputs_t;
        signal outputs_full_139962970447768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970447824: core_fifo_inputs_t;
        signal fifo_full_139962970447824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970447824: core_fifo_inputs_t;
        signal outputs_full_139962970447824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497096: core_fifo_inputs_t;
        signal fifo_full_139962970497096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497096: core_fifo_inputs_t;
        signal outputs_full_139962970497096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497152: core_fifo_inputs_t;
        signal fifo_full_139962970497152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497152: core_fifo_inputs_t;
        signal outputs_full_139962970497152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497208: core_fifo_inputs_t;
        signal fifo_full_139962970497208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497208: core_fifo_inputs_t;
        signal outputs_full_139962970497208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497264: core_fifo_inputs_t;
        signal fifo_full_139962970497264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497264: core_fifo_inputs_t;
        signal outputs_full_139962970497264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497320: core_fifo_inputs_t;
        signal fifo_full_139962970497320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497320: core_fifo_inputs_t;
        signal outputs_full_139962970497320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497376: core_fifo_inputs_t;
        signal fifo_full_139962970497376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497376: core_fifo_inputs_t;
        signal outputs_full_139962970497376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497432: core_fifo_inputs_t;
        signal fifo_full_139962970497432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497432: core_fifo_inputs_t;
        signal outputs_full_139962970497432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497488: core_fifo_inputs_t;
        signal fifo_full_139962970497488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497488: core_fifo_inputs_t;
        signal outputs_full_139962970497488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497544: core_fifo_inputs_t;
        signal fifo_full_139962970497544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497544: core_fifo_inputs_t;
        signal outputs_full_139962970497544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497600: core_fifo_inputs_t;
        signal fifo_full_139962970497600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497600: core_fifo_inputs_t;
        signal outputs_full_139962970497600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497656: core_fifo_inputs_t;
        signal fifo_full_139962970497656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497656: core_fifo_inputs_t;
        signal outputs_full_139962970497656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497712: core_fifo_inputs_t;
        signal fifo_full_139962970497712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497712: core_fifo_inputs_t;
        signal outputs_full_139962970497712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497768: core_fifo_inputs_t;
        signal fifo_full_139962970497768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497768: core_fifo_inputs_t;
        signal outputs_full_139962970497768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497824: core_fifo_inputs_t;
        signal fifo_full_139962970497824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497824: core_fifo_inputs_t;
        signal outputs_full_139962970497824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139962970497880: core_fifo_inputs_t;
        signal fifo_full_139962970497880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139962970497880: core_fifo_inputs_t;
        signal outputs_full_139962970497880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin
        outputs(0) <= outputs_139962970446984(1);
        outputs_full_139962970446984(1) <= fifo_full(0)

        outputs(1) <= outputs_139962970497880(0);
        outputs_full_139962970497880(0) <= fifo_full(1);
 
    
        fifo_inputs_139962970446928(1) <= outputs_139962970446984(0);
        outputs_full_139962970446984(0) <= fifo_full_139962970446928(1);
        
        fifo_inputs_139962970447152(1) <= outputs_139962970446928(0);
        outputs_full_139962970446928(0) <= fifo_full_139962970447152(1);
        
        fifo_inputs_139962970446984(0) <= outputs_139962970446928(1);
        outputs_full_139962970446928(1) <= fifo_full_139962970446984(0);
        
        fifo_inputs_139962970447208(1) <= outputs_139962970447152(0);
        outputs_full_139962970447152(0) <= fifo_full_139962970447208(1);
        
        fifo_inputs_139962970446928(0) <= outputs_139962970447152(1);
        outputs_full_139962970447152(1) <= fifo_full_139962970446928(0);
        
        fifo_inputs_139962970447264(1) <= outputs_139962970447208(0);
        outputs_full_139962970447208(0) <= fifo_full_139962970447264(1);
        
        fifo_inputs_139962970447152(0) <= outputs_139962970447208(1);
        outputs_full_139962970447208(1) <= fifo_full_139962970447152(0);
        
        fifo_inputs_139962970447096(1) <= outputs_139962970447264(0);
        outputs_full_139962970447264(0) <= fifo_full_139962970447096(1);
        
        fifo_inputs_139962970447208(0) <= outputs_139962970447264(1);
        outputs_full_139962970447264(1) <= fifo_full_139962970447208(0);
        
        fifo_inputs_139962970447320(1) <= outputs_139962970447096(0);
        outputs_full_139962970447096(0) <= fifo_full_139962970447320(1);
        
        fifo_inputs_139962970447264(0) <= outputs_139962970447096(1);
        outputs_full_139962970447096(1) <= fifo_full_139962970447264(0);
        
        fifo_inputs_139962970447376(1) <= outputs_139962970447320(0);
        outputs_full_139962970447320(0) <= fifo_full_139962970447376(1);
        
        fifo_inputs_139962970447096(0) <= outputs_139962970447320(1);
        outputs_full_139962970447320(1) <= fifo_full_139962970447096(0);
        
        fifo_inputs_139962970447432(1) <= outputs_139962970447376(0);
        outputs_full_139962970447376(0) <= fifo_full_139962970447432(1);
        
        fifo_inputs_139962970447320(0) <= outputs_139962970447376(1);
        outputs_full_139962970447376(1) <= fifo_full_139962970447320(0);
        
        fifo_inputs_139962970447488(1) <= outputs_139962970447432(0);
        outputs_full_139962970447432(0) <= fifo_full_139962970447488(1);
        
        fifo_inputs_139962970447376(0) <= outputs_139962970447432(1);
        outputs_full_139962970447432(1) <= fifo_full_139962970447376(0);
        
        fifo_inputs_139962970447040(1) <= outputs_139962970447488(0);
        outputs_full_139962970447488(0) <= fifo_full_139962970447040(1);
        
        fifo_inputs_139962970447432(0) <= outputs_139962970447488(1);
        outputs_full_139962970447488(1) <= fifo_full_139962970447432(0);
        
        fifo_inputs_139962970447544(1) <= outputs_139962970447040(0);
        outputs_full_139962970447040(0) <= fifo_full_139962970447544(1);
        
        fifo_inputs_139962970447488(0) <= outputs_139962970447040(1);
        outputs_full_139962970447040(1) <= fifo_full_139962970447488(0);
        
        fifo_inputs_139962970447600(1) <= outputs_139962970447544(0);
        outputs_full_139962970447544(0) <= fifo_full_139962970447600(1);
        
        fifo_inputs_139962970447040(0) <= outputs_139962970447544(1);
        outputs_full_139962970447544(1) <= fifo_full_139962970447040(0);
        
        fifo_inputs_139962970447656(1) <= outputs_139962970447600(0);
        outputs_full_139962970447600(0) <= fifo_full_139962970447656(1);
        
        fifo_inputs_139962970447544(0) <= outputs_139962970447600(1);
        outputs_full_139962970447600(1) <= fifo_full_139962970447544(0);
        
        fifo_inputs_139962970447712(1) <= outputs_139962970447656(0);
        outputs_full_139962970447656(0) <= fifo_full_139962970447712(1);
        
        fifo_inputs_139962970447600(0) <= outputs_139962970447656(1);
        outputs_full_139962970447656(1) <= fifo_full_139962970447600(0);
        
        fifo_inputs_139962970447768(1) <= outputs_139962970447712(0);
        outputs_full_139962970447712(0) <= fifo_full_139962970447768(1);
        
        fifo_inputs_139962970447656(0) <= outputs_139962970447712(1);
        outputs_full_139962970447712(1) <= fifo_full_139962970447656(0);
        
        fifo_inputs_139962970447824(1) <= outputs_139962970447768(0);
        outputs_full_139962970447768(0) <= fifo_full_139962970447824(1);
        
        fifo_inputs_139962970447712(0) <= outputs_139962970447768(1);
        outputs_full_139962970447768(1) <= fifo_full_139962970447712(0);
        
        fifo_inputs_139962970497096(1) <= outputs_139962970447824(0);
        outputs_full_139962970447824(0) <= fifo_full_139962970497096(1);
        
        fifo_inputs_139962970447768(0) <= outputs_139962970447824(1);
        outputs_full_139962970447824(1) <= fifo_full_139962970447768(0);
        
        fifo_inputs_139962970497152(1) <= outputs_139962970497096(0);
        outputs_full_139962970497096(0) <= fifo_full_139962970497152(1);
        
        fifo_inputs_139962970447824(0) <= outputs_139962970497096(1);
        outputs_full_139962970497096(1) <= fifo_full_139962970447824(0);
        
        fifo_inputs_139962970497208(1) <= outputs_139962970497152(0);
        outputs_full_139962970497152(0) <= fifo_full_139962970497208(1);
        
        fifo_inputs_139962970497096(0) <= outputs_139962970497152(1);
        outputs_full_139962970497152(1) <= fifo_full_139962970497096(0);
        
        fifo_inputs_139962970497264(1) <= outputs_139962970497208(0);
        outputs_full_139962970497208(0) <= fifo_full_139962970497264(1);
        
        fifo_inputs_139962970497152(0) <= outputs_139962970497208(1);
        outputs_full_139962970497208(1) <= fifo_full_139962970497152(0);
        
        fifo_inputs_139962970497320(1) <= outputs_139962970497264(0);
        outputs_full_139962970497264(0) <= fifo_full_139962970497320(1);
        
        fifo_inputs_139962970497208(0) <= outputs_139962970497264(1);
        outputs_full_139962970497264(1) <= fifo_full_139962970497208(0);
        
        fifo_inputs_139962970497376(1) <= outputs_139962970497320(0);
        outputs_full_139962970497320(0) <= fifo_full_139962970497376(1);
        
        fifo_inputs_139962970497264(0) <= outputs_139962970497320(1);
        outputs_full_139962970497320(1) <= fifo_full_139962970497264(0);
        
        fifo_inputs_139962970497432(1) <= outputs_139962970497376(0);
        outputs_full_139962970497376(0) <= fifo_full_139962970497432(1);
        
        fifo_inputs_139962970497320(0) <= outputs_139962970497376(1);
        outputs_full_139962970497376(1) <= fifo_full_139962970497320(0);
        
        fifo_inputs_139962970497488(1) <= outputs_139962970497432(0);
        outputs_full_139962970497432(0) <= fifo_full_139962970497488(1);
        
        fifo_inputs_139962970497376(0) <= outputs_139962970497432(1);
        outputs_full_139962970497432(1) <= fifo_full_139962970497376(0);
        
        fifo_inputs_139962970497544(1) <= outputs_139962970497488(0);
        outputs_full_139962970497488(0) <= fifo_full_139962970497544(1);
        
        fifo_inputs_139962970497432(0) <= outputs_139962970497488(1);
        outputs_full_139962970497488(1) <= fifo_full_139962970497432(0);
        
        fifo_inputs_139962970497600(1) <= outputs_139962970497544(0);
        outputs_full_139962970497544(0) <= fifo_full_139962970497600(1);
        
        fifo_inputs_139962970497488(0) <= outputs_139962970497544(1);
        outputs_full_139962970497544(1) <= fifo_full_139962970497488(0);
        
        fifo_inputs_139962970497656(1) <= outputs_139962970497600(0);
        outputs_full_139962970497600(0) <= fifo_full_139962970497656(1);
        
        fifo_inputs_139962970497544(0) <= outputs_139962970497600(1);
        outputs_full_139962970497600(1) <= fifo_full_139962970497544(0);
        
        fifo_inputs_139962970497712(1) <= outputs_139962970497656(0);
        outputs_full_139962970497656(0) <= fifo_full_139962970497712(1);
        
        fifo_inputs_139962970497600(0) <= outputs_139962970497656(1);
        outputs_full_139962970497656(1) <= fifo_full_139962970497600(0);
        
        fifo_inputs_139962970497768(1) <= outputs_139962970497712(0);
        outputs_full_139962970497712(0) <= fifo_full_139962970497768(1);
        
        fifo_inputs_139962970497656(0) <= outputs_139962970497712(1);
        outputs_full_139962970497712(1) <= fifo_full_139962970497656(0);
        
        fifo_inputs_139962970497824(1) <= outputs_139962970497768(0);
        outputs_full_139962970497768(0) <= fifo_full_139962970497824(1);
        
        fifo_inputs_139962970497712(0) <= outputs_139962970497768(1);
        outputs_full_139962970497768(1) <= fifo_full_139962970497712(0);
        
        fifo_inputs_139962970497880(1) <= outputs_139962970497824(0);
        outputs_full_139962970497824(0) <= fifo_full_139962970497880(1);
        
        fifo_inputs_139962970497768(0) <= outputs_139962970497824(1);
        outputs_full_139962970497824(1) <= fifo_full_139962970497768(0);
        
        fifo_inputs_139962970497824(0) <= outputs_139962970497880(1);
        outputs_full_139962970497880(1) <= fifo_full_139962970497824(0);
        

    
        core_inst_139962970446984: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970446984,
            fifo_full => fifo_full_139962970446984,
            outputs => outputs_139962970446984,
            outputs_full => outputs_full_139962970446984
        );
        
        core_inst_139962970446928: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970446928,
            fifo_full => fifo_full_139962970446928,
            outputs => outputs_139962970446928,
            outputs_full => outputs_full_139962970446928
        );
        
        core_inst_139962970447152: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447152,
            fifo_full => fifo_full_139962970447152,
            outputs => outputs_139962970447152,
            outputs_full => outputs_full_139962970447152
        );
        
        core_inst_139962970447208: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447208,
            fifo_full => fifo_full_139962970447208,
            outputs => outputs_139962970447208,
            outputs_full => outputs_full_139962970447208
        );
        
        core_inst_139962970447264: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447264,
            fifo_full => fifo_full_139962970447264,
            outputs => outputs_139962970447264,
            outputs_full => outputs_full_139962970447264
        );
        
        core_inst_139962970447096: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447096,
            fifo_full => fifo_full_139962970447096,
            outputs => outputs_139962970447096,
            outputs_full => outputs_full_139962970447096
        );
        
        core_inst_139962970447320: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447320,
            fifo_full => fifo_full_139962970447320,
            outputs => outputs_139962970447320,
            outputs_full => outputs_full_139962970447320
        );
        
        core_inst_139962970447376: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447376,
            fifo_full => fifo_full_139962970447376,
            outputs => outputs_139962970447376,
            outputs_full => outputs_full_139962970447376
        );
        
        core_inst_139962970447432: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447432,
            fifo_full => fifo_full_139962970447432,
            outputs => outputs_139962970447432,
            outputs_full => outputs_full_139962970447432
        );
        
        core_inst_139962970447488: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447488,
            fifo_full => fifo_full_139962970447488,
            outputs => outputs_139962970447488,
            outputs_full => outputs_full_139962970447488
        );
        
        core_inst_139962970447040: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447040,
            fifo_full => fifo_full_139962970447040,
            outputs => outputs_139962970447040,
            outputs_full => outputs_full_139962970447040
        );
        
        core_inst_139962970447544: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447544,
            fifo_full => fifo_full_139962970447544,
            outputs => outputs_139962970447544,
            outputs_full => outputs_full_139962970447544
        );
        
        core_inst_139962970447600: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447600,
            fifo_full => fifo_full_139962970447600,
            outputs => outputs_139962970447600,
            outputs_full => outputs_full_139962970447600
        );
        
        core_inst_139962970447656: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447656,
            fifo_full => fifo_full_139962970447656,
            outputs => outputs_139962970447656,
            outputs_full => outputs_full_139962970447656
        );
        
        core_inst_139962970447712: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447712,
            fifo_full => fifo_full_139962970447712,
            outputs => outputs_139962970447712,
            outputs_full => outputs_full_139962970447712
        );
        
        core_inst_139962970447768: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447768,
            fifo_full => fifo_full_139962970447768,
            outputs => outputs_139962970447768,
            outputs_full => outputs_full_139962970447768
        );
        
        core_inst_139962970447824: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970447824,
            fifo_full => fifo_full_139962970447824,
            outputs => outputs_139962970447824,
            outputs_full => outputs_full_139962970447824
        );
        
        core_inst_139962970497096: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497096,
            fifo_full => fifo_full_139962970497096,
            outputs => outputs_139962970497096,
            outputs_full => outputs_full_139962970497096
        );
        
        core_inst_139962970497152: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497152,
            fifo_full => fifo_full_139962970497152,
            outputs => outputs_139962970497152,
            outputs_full => outputs_full_139962970497152
        );
        
        core_inst_139962970497208: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497208,
            fifo_full => fifo_full_139962970497208,
            outputs => outputs_139962970497208,
            outputs_full => outputs_full_139962970497208
        );
        
        core_inst_139962970497264: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497264,
            fifo_full => fifo_full_139962970497264,
            outputs => outputs_139962970497264,
            outputs_full => outputs_full_139962970497264
        );
        
        core_inst_139962970497320: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497320,
            fifo_full => fifo_full_139962970497320,
            outputs => outputs_139962970497320,
            outputs_full => outputs_full_139962970497320
        );
        
        core_inst_139962970497376: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497376,
            fifo_full => fifo_full_139962970497376,
            outputs => outputs_139962970497376,
            outputs_full => outputs_full_139962970497376
        );
        
        core_inst_139962970497432: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497432,
            fifo_full => fifo_full_139962970497432,
            outputs => outputs_139962970497432,
            outputs_full => outputs_full_139962970497432
        );
        
        core_inst_139962970497488: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497488,
            fifo_full => fifo_full_139962970497488,
            outputs => outputs_139962970497488,
            outputs_full => outputs_full_139962970497488
        );
        
        core_inst_139962970497544: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497544,
            fifo_full => fifo_full_139962970497544,
            outputs => outputs_139962970497544,
            outputs_full => outputs_full_139962970497544
        );
        
        core_inst_139962970497600: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497600,
            fifo_full => fifo_full_139962970497600,
            outputs => outputs_139962970497600,
            outputs_full => outputs_full_139962970497600
        );
        
        core_inst_139962970497656: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497656,
            fifo_full => fifo_full_139962970497656,
            outputs => outputs_139962970497656,
            outputs_full => outputs_full_139962970497656
        );
        
        core_inst_139962970497712: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497712,
            fifo_full => fifo_full_139962970497712,
            outputs => outputs_139962970497712,
            outputs_full => outputs_full_139962970497712
        );
        
        core_inst_139962970497768: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497768,
            fifo_full => fifo_full_139962970497768,
            outputs => outputs_139962970497768,
            outputs_full => outputs_full_139962970497768
        );
        
        core_inst_139962970497824: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497824,
            fifo_full => fifo_full_139962970497824,
            outputs => outputs_139962970497824,
            outputs_full => outputs_full_139962970497824
        );
        
        core_inst_139962970497880: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139962970497880,
            fifo_full => fifo_full_139962970497880,
            outputs => outputs_139962970497880,
            outputs_full => outputs_full_139962970497880
        );
        

end behav;

