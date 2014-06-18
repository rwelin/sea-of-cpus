
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Bichain64 is
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
end Bichain64;

architecture behav of Bichain64 is

    
        signal fifo_inputs_140452470807688: core_fifo_inputs_t;
        signal fifo_full_140452470807688: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807688: core_fifo_inputs_t;
        signal outputs_full_140452470807688: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807632: core_fifo_inputs_t;
        signal fifo_full_140452470807632: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807632: core_fifo_inputs_t;
        signal outputs_full_140452470807632: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807856: core_fifo_inputs_t;
        signal fifo_full_140452470807856: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807856: core_fifo_inputs_t;
        signal outputs_full_140452470807856: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807912: core_fifo_inputs_t;
        signal fifo_full_140452470807912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807912: core_fifo_inputs_t;
        signal outputs_full_140452470807912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807968: core_fifo_inputs_t;
        signal fifo_full_140452470807968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807968: core_fifo_inputs_t;
        signal outputs_full_140452470807968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807800: core_fifo_inputs_t;
        signal fifo_full_140452470807800: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807800: core_fifo_inputs_t;
        signal outputs_full_140452470807800: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808024: core_fifo_inputs_t;
        signal fifo_full_140452470808024: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808024: core_fifo_inputs_t;
        signal outputs_full_140452470808024: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808080: core_fifo_inputs_t;
        signal fifo_full_140452470808080: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808080: core_fifo_inputs_t;
        signal outputs_full_140452470808080: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808136: core_fifo_inputs_t;
        signal fifo_full_140452470808136: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808136: core_fifo_inputs_t;
        signal outputs_full_140452470808136: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808192: core_fifo_inputs_t;
        signal fifo_full_140452470808192: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808192: core_fifo_inputs_t;
        signal outputs_full_140452470808192: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470807744: core_fifo_inputs_t;
        signal fifo_full_140452470807744: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470807744: core_fifo_inputs_t;
        signal outputs_full_140452470807744: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808248: core_fifo_inputs_t;
        signal fifo_full_140452470808248: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808248: core_fifo_inputs_t;
        signal outputs_full_140452470808248: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808304: core_fifo_inputs_t;
        signal fifo_full_140452470808304: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808304: core_fifo_inputs_t;
        signal outputs_full_140452470808304: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808360: core_fifo_inputs_t;
        signal fifo_full_140452470808360: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808360: core_fifo_inputs_t;
        signal outputs_full_140452470808360: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808416: core_fifo_inputs_t;
        signal fifo_full_140452470808416: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808416: core_fifo_inputs_t;
        signal outputs_full_140452470808416: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808472: core_fifo_inputs_t;
        signal fifo_full_140452470808472: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808472: core_fifo_inputs_t;
        signal outputs_full_140452470808472: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470808528: core_fifo_inputs_t;
        signal fifo_full_140452470808528: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470808528: core_fifo_inputs_t;
        signal outputs_full_140452470808528: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470857800: core_fifo_inputs_t;
        signal fifo_full_140452470857800: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470857800: core_fifo_inputs_t;
        signal outputs_full_140452470857800: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470857856: core_fifo_inputs_t;
        signal fifo_full_140452470857856: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470857856: core_fifo_inputs_t;
        signal outputs_full_140452470857856: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470857912: core_fifo_inputs_t;
        signal fifo_full_140452470857912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470857912: core_fifo_inputs_t;
        signal outputs_full_140452470857912: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470857968: core_fifo_inputs_t;
        signal fifo_full_140452470857968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470857968: core_fifo_inputs_t;
        signal outputs_full_140452470857968: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858024: core_fifo_inputs_t;
        signal fifo_full_140452470858024: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858024: core_fifo_inputs_t;
        signal outputs_full_140452470858024: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858080: core_fifo_inputs_t;
        signal fifo_full_140452470858080: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858080: core_fifo_inputs_t;
        signal outputs_full_140452470858080: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858136: core_fifo_inputs_t;
        signal fifo_full_140452470858136: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858136: core_fifo_inputs_t;
        signal outputs_full_140452470858136: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858192: core_fifo_inputs_t;
        signal fifo_full_140452470858192: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858192: core_fifo_inputs_t;
        signal outputs_full_140452470858192: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858248: core_fifo_inputs_t;
        signal fifo_full_140452470858248: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858248: core_fifo_inputs_t;
        signal outputs_full_140452470858248: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858304: core_fifo_inputs_t;
        signal fifo_full_140452470858304: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858304: core_fifo_inputs_t;
        signal outputs_full_140452470858304: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858360: core_fifo_inputs_t;
        signal fifo_full_140452470858360: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858360: core_fifo_inputs_t;
        signal outputs_full_140452470858360: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858416: core_fifo_inputs_t;
        signal fifo_full_140452470858416: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858416: core_fifo_inputs_t;
        signal outputs_full_140452470858416: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858472: core_fifo_inputs_t;
        signal fifo_full_140452470858472: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858472: core_fifo_inputs_t;
        signal outputs_full_140452470858472: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858528: core_fifo_inputs_t;
        signal fifo_full_140452470858528: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858528: core_fifo_inputs_t;
        signal outputs_full_140452470858528: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858584: core_fifo_inputs_t;
        signal fifo_full_140452470858584: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858584: core_fifo_inputs_t;
        signal outputs_full_140452470858584: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858640: core_fifo_inputs_t;
        signal fifo_full_140452470858640: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858640: core_fifo_inputs_t;
        signal outputs_full_140452470858640: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858696: core_fifo_inputs_t;
        signal fifo_full_140452470858696: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858696: core_fifo_inputs_t;
        signal outputs_full_140452470858696: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858752: core_fifo_inputs_t;
        signal fifo_full_140452470858752: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858752: core_fifo_inputs_t;
        signal outputs_full_140452470858752: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858808: core_fifo_inputs_t;
        signal fifo_full_140452470858808: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858808: core_fifo_inputs_t;
        signal outputs_full_140452470858808: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858864: core_fifo_inputs_t;
        signal fifo_full_140452470858864: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858864: core_fifo_inputs_t;
        signal outputs_full_140452470858864: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858920: core_fifo_inputs_t;
        signal fifo_full_140452470858920: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858920: core_fifo_inputs_t;
        signal outputs_full_140452470858920: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470858976: core_fifo_inputs_t;
        signal fifo_full_140452470858976: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470858976: core_fifo_inputs_t;
        signal outputs_full_140452470858976: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859032: core_fifo_inputs_t;
        signal fifo_full_140452470859032: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859032: core_fifo_inputs_t;
        signal outputs_full_140452470859032: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859088: core_fifo_inputs_t;
        signal fifo_full_140452470859088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859088: core_fifo_inputs_t;
        signal outputs_full_140452470859088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859144: core_fifo_inputs_t;
        signal fifo_full_140452470859144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859144: core_fifo_inputs_t;
        signal outputs_full_140452470859144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859200: core_fifo_inputs_t;
        signal fifo_full_140452470859200: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859200: core_fifo_inputs_t;
        signal outputs_full_140452470859200: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859256: core_fifo_inputs_t;
        signal fifo_full_140452470859256: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859256: core_fifo_inputs_t;
        signal outputs_full_140452470859256: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859312: core_fifo_inputs_t;
        signal fifo_full_140452470859312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859312: core_fifo_inputs_t;
        signal outputs_full_140452470859312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859368: core_fifo_inputs_t;
        signal fifo_full_140452470859368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859368: core_fifo_inputs_t;
        signal outputs_full_140452470859368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859424: core_fifo_inputs_t;
        signal fifo_full_140452470859424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859424: core_fifo_inputs_t;
        signal outputs_full_140452470859424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859480: core_fifo_inputs_t;
        signal fifo_full_140452470859480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859480: core_fifo_inputs_t;
        signal outputs_full_140452470859480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859536: core_fifo_inputs_t;
        signal fifo_full_140452470859536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859536: core_fifo_inputs_t;
        signal outputs_full_140452470859536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859592: core_fifo_inputs_t;
        signal fifo_full_140452470859592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859592: core_fifo_inputs_t;
        signal outputs_full_140452470859592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859648: core_fifo_inputs_t;
        signal fifo_full_140452470859648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859648: core_fifo_inputs_t;
        signal outputs_full_140452470859648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859704: core_fifo_inputs_t;
        signal fifo_full_140452470859704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859704: core_fifo_inputs_t;
        signal outputs_full_140452470859704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859760: core_fifo_inputs_t;
        signal fifo_full_140452470859760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859760: core_fifo_inputs_t;
        signal outputs_full_140452470859760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859816: core_fifo_inputs_t;
        signal fifo_full_140452470859816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859816: core_fifo_inputs_t;
        signal outputs_full_140452470859816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859872: core_fifo_inputs_t;
        signal fifo_full_140452470859872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859872: core_fifo_inputs_t;
        signal outputs_full_140452470859872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859928: core_fifo_inputs_t;
        signal fifo_full_140452470859928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859928: core_fifo_inputs_t;
        signal outputs_full_140452470859928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470859984: core_fifo_inputs_t;
        signal fifo_full_140452470859984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470859984: core_fifo_inputs_t;
        signal outputs_full_140452470859984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860040: core_fifo_inputs_t;
        signal fifo_full_140452470860040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860040: core_fifo_inputs_t;
        signal outputs_full_140452470860040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860096: core_fifo_inputs_t;
        signal fifo_full_140452470860096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860096: core_fifo_inputs_t;
        signal outputs_full_140452470860096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860152: core_fifo_inputs_t;
        signal fifo_full_140452470860152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860152: core_fifo_inputs_t;
        signal outputs_full_140452470860152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860208: core_fifo_inputs_t;
        signal fifo_full_140452470860208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860208: core_fifo_inputs_t;
        signal outputs_full_140452470860208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860264: core_fifo_inputs_t;
        signal fifo_full_140452470860264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860264: core_fifo_inputs_t;
        signal outputs_full_140452470860264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860320: core_fifo_inputs_t;
        signal fifo_full_140452470860320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860320: core_fifo_inputs_t;
        signal outputs_full_140452470860320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140452470860376: core_fifo_inputs_t;
        signal fifo_full_140452470860376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140452470860376: core_fifo_inputs_t;
        signal outputs_full_140452470860376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

        outputs(0) <= outputs_140452470860376(0);
        outputs_full_140452470860376(0) <= outputs_full(0);
        
        outputs(1) <= outputs_140452470807688(1);
        outputs_full_140452470807688(1) <= outputs_full(1);
        
        fifo_inputs_140452470860376(0) <= fifo_inputs(0);
        fifo_full(0) <= fifo_full_140452470860376(0);
                
        fifo_inputs_140452470807688(1) <= fifo_inputs(1);
        fifo_full(1) <= fifo_full_140452470807688(1);
    
        fifo_inputs_140452470807632(1) <= outputs_140452470807688(0);
        outputs_full_140452470807688(0) <= fifo_full_140452470807632(1);
        
        fifo_inputs_140452470807856(1) <= outputs_140452470807632(0);
        outputs_full_140452470807632(0) <= fifo_full_140452470807856(1);
        
        fifo_inputs_140452470807688(0) <= outputs_140452470807632(1);
        outputs_full_140452470807632(1) <= fifo_full_140452470807688(0);
        
        fifo_inputs_140452470807912(1) <= outputs_140452470807856(0);
        outputs_full_140452470807856(0) <= fifo_full_140452470807912(1);
        
        fifo_inputs_140452470807632(0) <= outputs_140452470807856(1);
        outputs_full_140452470807856(1) <= fifo_full_140452470807632(0);
        
        fifo_inputs_140452470807968(1) <= outputs_140452470807912(0);
        outputs_full_140452470807912(0) <= fifo_full_140452470807968(1);
        
        fifo_inputs_140452470807856(0) <= outputs_140452470807912(1);
        outputs_full_140452470807912(1) <= fifo_full_140452470807856(0);
        
        fifo_inputs_140452470807800(1) <= outputs_140452470807968(0);
        outputs_full_140452470807968(0) <= fifo_full_140452470807800(1);
        
        fifo_inputs_140452470807912(0) <= outputs_140452470807968(1);
        outputs_full_140452470807968(1) <= fifo_full_140452470807912(0);
        
        fifo_inputs_140452470808024(1) <= outputs_140452470807800(0);
        outputs_full_140452470807800(0) <= fifo_full_140452470808024(1);
        
        fifo_inputs_140452470807968(0) <= outputs_140452470807800(1);
        outputs_full_140452470807800(1) <= fifo_full_140452470807968(0);
        
        fifo_inputs_140452470808080(1) <= outputs_140452470808024(0);
        outputs_full_140452470808024(0) <= fifo_full_140452470808080(1);
        
        fifo_inputs_140452470807800(0) <= outputs_140452470808024(1);
        outputs_full_140452470808024(1) <= fifo_full_140452470807800(0);
        
        fifo_inputs_140452470808136(1) <= outputs_140452470808080(0);
        outputs_full_140452470808080(0) <= fifo_full_140452470808136(1);
        
        fifo_inputs_140452470808024(0) <= outputs_140452470808080(1);
        outputs_full_140452470808080(1) <= fifo_full_140452470808024(0);
        
        fifo_inputs_140452470808192(1) <= outputs_140452470808136(0);
        outputs_full_140452470808136(0) <= fifo_full_140452470808192(1);
        
        fifo_inputs_140452470808080(0) <= outputs_140452470808136(1);
        outputs_full_140452470808136(1) <= fifo_full_140452470808080(0);
        
        fifo_inputs_140452470807744(1) <= outputs_140452470808192(0);
        outputs_full_140452470808192(0) <= fifo_full_140452470807744(1);
        
        fifo_inputs_140452470808136(0) <= outputs_140452470808192(1);
        outputs_full_140452470808192(1) <= fifo_full_140452470808136(0);
        
        fifo_inputs_140452470808248(1) <= outputs_140452470807744(0);
        outputs_full_140452470807744(0) <= fifo_full_140452470808248(1);
        
        fifo_inputs_140452470808192(0) <= outputs_140452470807744(1);
        outputs_full_140452470807744(1) <= fifo_full_140452470808192(0);
        
        fifo_inputs_140452470808304(1) <= outputs_140452470808248(0);
        outputs_full_140452470808248(0) <= fifo_full_140452470808304(1);
        
        fifo_inputs_140452470807744(0) <= outputs_140452470808248(1);
        outputs_full_140452470808248(1) <= fifo_full_140452470807744(0);
        
        fifo_inputs_140452470808360(1) <= outputs_140452470808304(0);
        outputs_full_140452470808304(0) <= fifo_full_140452470808360(1);
        
        fifo_inputs_140452470808248(0) <= outputs_140452470808304(1);
        outputs_full_140452470808304(1) <= fifo_full_140452470808248(0);
        
        fifo_inputs_140452470808416(1) <= outputs_140452470808360(0);
        outputs_full_140452470808360(0) <= fifo_full_140452470808416(1);
        
        fifo_inputs_140452470808304(0) <= outputs_140452470808360(1);
        outputs_full_140452470808360(1) <= fifo_full_140452470808304(0);
        
        fifo_inputs_140452470808472(1) <= outputs_140452470808416(0);
        outputs_full_140452470808416(0) <= fifo_full_140452470808472(1);
        
        fifo_inputs_140452470808360(0) <= outputs_140452470808416(1);
        outputs_full_140452470808416(1) <= fifo_full_140452470808360(0);
        
        fifo_inputs_140452470808528(1) <= outputs_140452470808472(0);
        outputs_full_140452470808472(0) <= fifo_full_140452470808528(1);
        
        fifo_inputs_140452470808416(0) <= outputs_140452470808472(1);
        outputs_full_140452470808472(1) <= fifo_full_140452470808416(0);
        
        fifo_inputs_140452470857800(1) <= outputs_140452470808528(0);
        outputs_full_140452470808528(0) <= fifo_full_140452470857800(1);
        
        fifo_inputs_140452470808472(0) <= outputs_140452470808528(1);
        outputs_full_140452470808528(1) <= fifo_full_140452470808472(0);
        
        fifo_inputs_140452470857856(1) <= outputs_140452470857800(0);
        outputs_full_140452470857800(0) <= fifo_full_140452470857856(1);
        
        fifo_inputs_140452470808528(0) <= outputs_140452470857800(1);
        outputs_full_140452470857800(1) <= fifo_full_140452470808528(0);
        
        fifo_inputs_140452470857912(1) <= outputs_140452470857856(0);
        outputs_full_140452470857856(0) <= fifo_full_140452470857912(1);
        
        fifo_inputs_140452470857800(0) <= outputs_140452470857856(1);
        outputs_full_140452470857856(1) <= fifo_full_140452470857800(0);
        
        fifo_inputs_140452470857968(1) <= outputs_140452470857912(0);
        outputs_full_140452470857912(0) <= fifo_full_140452470857968(1);
        
        fifo_inputs_140452470857856(0) <= outputs_140452470857912(1);
        outputs_full_140452470857912(1) <= fifo_full_140452470857856(0);
        
        fifo_inputs_140452470858024(1) <= outputs_140452470857968(0);
        outputs_full_140452470857968(0) <= fifo_full_140452470858024(1);
        
        fifo_inputs_140452470857912(0) <= outputs_140452470857968(1);
        outputs_full_140452470857968(1) <= fifo_full_140452470857912(0);
        
        fifo_inputs_140452470858080(1) <= outputs_140452470858024(0);
        outputs_full_140452470858024(0) <= fifo_full_140452470858080(1);
        
        fifo_inputs_140452470857968(0) <= outputs_140452470858024(1);
        outputs_full_140452470858024(1) <= fifo_full_140452470857968(0);
        
        fifo_inputs_140452470858136(1) <= outputs_140452470858080(0);
        outputs_full_140452470858080(0) <= fifo_full_140452470858136(1);
        
        fifo_inputs_140452470858024(0) <= outputs_140452470858080(1);
        outputs_full_140452470858080(1) <= fifo_full_140452470858024(0);
        
        fifo_inputs_140452470858192(1) <= outputs_140452470858136(0);
        outputs_full_140452470858136(0) <= fifo_full_140452470858192(1);
        
        fifo_inputs_140452470858080(0) <= outputs_140452470858136(1);
        outputs_full_140452470858136(1) <= fifo_full_140452470858080(0);
        
        fifo_inputs_140452470858248(1) <= outputs_140452470858192(0);
        outputs_full_140452470858192(0) <= fifo_full_140452470858248(1);
        
        fifo_inputs_140452470858136(0) <= outputs_140452470858192(1);
        outputs_full_140452470858192(1) <= fifo_full_140452470858136(0);
        
        fifo_inputs_140452470858304(1) <= outputs_140452470858248(0);
        outputs_full_140452470858248(0) <= fifo_full_140452470858304(1);
        
        fifo_inputs_140452470858192(0) <= outputs_140452470858248(1);
        outputs_full_140452470858248(1) <= fifo_full_140452470858192(0);
        
        fifo_inputs_140452470858360(1) <= outputs_140452470858304(0);
        outputs_full_140452470858304(0) <= fifo_full_140452470858360(1);
        
        fifo_inputs_140452470858248(0) <= outputs_140452470858304(1);
        outputs_full_140452470858304(1) <= fifo_full_140452470858248(0);
        
        fifo_inputs_140452470858416(1) <= outputs_140452470858360(0);
        outputs_full_140452470858360(0) <= fifo_full_140452470858416(1);
        
        fifo_inputs_140452470858304(0) <= outputs_140452470858360(1);
        outputs_full_140452470858360(1) <= fifo_full_140452470858304(0);
        
        fifo_inputs_140452470858472(1) <= outputs_140452470858416(0);
        outputs_full_140452470858416(0) <= fifo_full_140452470858472(1);
        
        fifo_inputs_140452470858360(0) <= outputs_140452470858416(1);
        outputs_full_140452470858416(1) <= fifo_full_140452470858360(0);
        
        fifo_inputs_140452470858528(1) <= outputs_140452470858472(0);
        outputs_full_140452470858472(0) <= fifo_full_140452470858528(1);
        
        fifo_inputs_140452470858416(0) <= outputs_140452470858472(1);
        outputs_full_140452470858472(1) <= fifo_full_140452470858416(0);
        
        fifo_inputs_140452470858584(1) <= outputs_140452470858528(0);
        outputs_full_140452470858528(0) <= fifo_full_140452470858584(1);
        
        fifo_inputs_140452470858472(0) <= outputs_140452470858528(1);
        outputs_full_140452470858528(1) <= fifo_full_140452470858472(0);
        
        fifo_inputs_140452470858640(1) <= outputs_140452470858584(0);
        outputs_full_140452470858584(0) <= fifo_full_140452470858640(1);
        
        fifo_inputs_140452470858528(0) <= outputs_140452470858584(1);
        outputs_full_140452470858584(1) <= fifo_full_140452470858528(0);
        
        fifo_inputs_140452470858696(1) <= outputs_140452470858640(0);
        outputs_full_140452470858640(0) <= fifo_full_140452470858696(1);
        
        fifo_inputs_140452470858584(0) <= outputs_140452470858640(1);
        outputs_full_140452470858640(1) <= fifo_full_140452470858584(0);
        
        fifo_inputs_140452470858752(1) <= outputs_140452470858696(0);
        outputs_full_140452470858696(0) <= fifo_full_140452470858752(1);
        
        fifo_inputs_140452470858640(0) <= outputs_140452470858696(1);
        outputs_full_140452470858696(1) <= fifo_full_140452470858640(0);
        
        fifo_inputs_140452470858808(1) <= outputs_140452470858752(0);
        outputs_full_140452470858752(0) <= fifo_full_140452470858808(1);
        
        fifo_inputs_140452470858696(0) <= outputs_140452470858752(1);
        outputs_full_140452470858752(1) <= fifo_full_140452470858696(0);
        
        fifo_inputs_140452470858864(1) <= outputs_140452470858808(0);
        outputs_full_140452470858808(0) <= fifo_full_140452470858864(1);
        
        fifo_inputs_140452470858752(0) <= outputs_140452470858808(1);
        outputs_full_140452470858808(1) <= fifo_full_140452470858752(0);
        
        fifo_inputs_140452470858920(1) <= outputs_140452470858864(0);
        outputs_full_140452470858864(0) <= fifo_full_140452470858920(1);
        
        fifo_inputs_140452470858808(0) <= outputs_140452470858864(1);
        outputs_full_140452470858864(1) <= fifo_full_140452470858808(0);
        
        fifo_inputs_140452470858976(1) <= outputs_140452470858920(0);
        outputs_full_140452470858920(0) <= fifo_full_140452470858976(1);
        
        fifo_inputs_140452470858864(0) <= outputs_140452470858920(1);
        outputs_full_140452470858920(1) <= fifo_full_140452470858864(0);
        
        fifo_inputs_140452470859032(1) <= outputs_140452470858976(0);
        outputs_full_140452470858976(0) <= fifo_full_140452470859032(1);
        
        fifo_inputs_140452470858920(0) <= outputs_140452470858976(1);
        outputs_full_140452470858976(1) <= fifo_full_140452470858920(0);
        
        fifo_inputs_140452470859088(1) <= outputs_140452470859032(0);
        outputs_full_140452470859032(0) <= fifo_full_140452470859088(1);
        
        fifo_inputs_140452470858976(0) <= outputs_140452470859032(1);
        outputs_full_140452470859032(1) <= fifo_full_140452470858976(0);
        
        fifo_inputs_140452470859144(1) <= outputs_140452470859088(0);
        outputs_full_140452470859088(0) <= fifo_full_140452470859144(1);
        
        fifo_inputs_140452470859032(0) <= outputs_140452470859088(1);
        outputs_full_140452470859088(1) <= fifo_full_140452470859032(0);
        
        fifo_inputs_140452470859200(1) <= outputs_140452470859144(0);
        outputs_full_140452470859144(0) <= fifo_full_140452470859200(1);
        
        fifo_inputs_140452470859088(0) <= outputs_140452470859144(1);
        outputs_full_140452470859144(1) <= fifo_full_140452470859088(0);
        
        fifo_inputs_140452470859256(1) <= outputs_140452470859200(0);
        outputs_full_140452470859200(0) <= fifo_full_140452470859256(1);
        
        fifo_inputs_140452470859144(0) <= outputs_140452470859200(1);
        outputs_full_140452470859200(1) <= fifo_full_140452470859144(0);
        
        fifo_inputs_140452470859312(1) <= outputs_140452470859256(0);
        outputs_full_140452470859256(0) <= fifo_full_140452470859312(1);
        
        fifo_inputs_140452470859200(0) <= outputs_140452470859256(1);
        outputs_full_140452470859256(1) <= fifo_full_140452470859200(0);
        
        fifo_inputs_140452470859368(1) <= outputs_140452470859312(0);
        outputs_full_140452470859312(0) <= fifo_full_140452470859368(1);
        
        fifo_inputs_140452470859256(0) <= outputs_140452470859312(1);
        outputs_full_140452470859312(1) <= fifo_full_140452470859256(0);
        
        fifo_inputs_140452470859424(1) <= outputs_140452470859368(0);
        outputs_full_140452470859368(0) <= fifo_full_140452470859424(1);
        
        fifo_inputs_140452470859312(0) <= outputs_140452470859368(1);
        outputs_full_140452470859368(1) <= fifo_full_140452470859312(0);
        
        fifo_inputs_140452470859480(1) <= outputs_140452470859424(0);
        outputs_full_140452470859424(0) <= fifo_full_140452470859480(1);
        
        fifo_inputs_140452470859368(0) <= outputs_140452470859424(1);
        outputs_full_140452470859424(1) <= fifo_full_140452470859368(0);
        
        fifo_inputs_140452470859536(1) <= outputs_140452470859480(0);
        outputs_full_140452470859480(0) <= fifo_full_140452470859536(1);
        
        fifo_inputs_140452470859424(0) <= outputs_140452470859480(1);
        outputs_full_140452470859480(1) <= fifo_full_140452470859424(0);
        
        fifo_inputs_140452470859592(1) <= outputs_140452470859536(0);
        outputs_full_140452470859536(0) <= fifo_full_140452470859592(1);
        
        fifo_inputs_140452470859480(0) <= outputs_140452470859536(1);
        outputs_full_140452470859536(1) <= fifo_full_140452470859480(0);
        
        fifo_inputs_140452470859648(1) <= outputs_140452470859592(0);
        outputs_full_140452470859592(0) <= fifo_full_140452470859648(1);
        
        fifo_inputs_140452470859536(0) <= outputs_140452470859592(1);
        outputs_full_140452470859592(1) <= fifo_full_140452470859536(0);
        
        fifo_inputs_140452470859704(1) <= outputs_140452470859648(0);
        outputs_full_140452470859648(0) <= fifo_full_140452470859704(1);
        
        fifo_inputs_140452470859592(0) <= outputs_140452470859648(1);
        outputs_full_140452470859648(1) <= fifo_full_140452470859592(0);
        
        fifo_inputs_140452470859760(1) <= outputs_140452470859704(0);
        outputs_full_140452470859704(0) <= fifo_full_140452470859760(1);
        
        fifo_inputs_140452470859648(0) <= outputs_140452470859704(1);
        outputs_full_140452470859704(1) <= fifo_full_140452470859648(0);
        
        fifo_inputs_140452470859816(1) <= outputs_140452470859760(0);
        outputs_full_140452470859760(0) <= fifo_full_140452470859816(1);
        
        fifo_inputs_140452470859704(0) <= outputs_140452470859760(1);
        outputs_full_140452470859760(1) <= fifo_full_140452470859704(0);
        
        fifo_inputs_140452470859872(1) <= outputs_140452470859816(0);
        outputs_full_140452470859816(0) <= fifo_full_140452470859872(1);
        
        fifo_inputs_140452470859760(0) <= outputs_140452470859816(1);
        outputs_full_140452470859816(1) <= fifo_full_140452470859760(0);
        
        fifo_inputs_140452470859928(1) <= outputs_140452470859872(0);
        outputs_full_140452470859872(0) <= fifo_full_140452470859928(1);
        
        fifo_inputs_140452470859816(0) <= outputs_140452470859872(1);
        outputs_full_140452470859872(1) <= fifo_full_140452470859816(0);
        
        fifo_inputs_140452470859984(1) <= outputs_140452470859928(0);
        outputs_full_140452470859928(0) <= fifo_full_140452470859984(1);
        
        fifo_inputs_140452470859872(0) <= outputs_140452470859928(1);
        outputs_full_140452470859928(1) <= fifo_full_140452470859872(0);
        
        fifo_inputs_140452470860040(1) <= outputs_140452470859984(0);
        outputs_full_140452470859984(0) <= fifo_full_140452470860040(1);
        
        fifo_inputs_140452470859928(0) <= outputs_140452470859984(1);
        outputs_full_140452470859984(1) <= fifo_full_140452470859928(0);
        
        fifo_inputs_140452470860096(1) <= outputs_140452470860040(0);
        outputs_full_140452470860040(0) <= fifo_full_140452470860096(1);
        
        fifo_inputs_140452470859984(0) <= outputs_140452470860040(1);
        outputs_full_140452470860040(1) <= fifo_full_140452470859984(0);
        
        fifo_inputs_140452470860152(1) <= outputs_140452470860096(0);
        outputs_full_140452470860096(0) <= fifo_full_140452470860152(1);
        
        fifo_inputs_140452470860040(0) <= outputs_140452470860096(1);
        outputs_full_140452470860096(1) <= fifo_full_140452470860040(0);
        
        fifo_inputs_140452470860208(1) <= outputs_140452470860152(0);
        outputs_full_140452470860152(0) <= fifo_full_140452470860208(1);
        
        fifo_inputs_140452470860096(0) <= outputs_140452470860152(1);
        outputs_full_140452470860152(1) <= fifo_full_140452470860096(0);
        
        fifo_inputs_140452470860264(1) <= outputs_140452470860208(0);
        outputs_full_140452470860208(0) <= fifo_full_140452470860264(1);
        
        fifo_inputs_140452470860152(0) <= outputs_140452470860208(1);
        outputs_full_140452470860208(1) <= fifo_full_140452470860152(0);
        
        fifo_inputs_140452470860320(1) <= outputs_140452470860264(0);
        outputs_full_140452470860264(0) <= fifo_full_140452470860320(1);
        
        fifo_inputs_140452470860208(0) <= outputs_140452470860264(1);
        outputs_full_140452470860264(1) <= fifo_full_140452470860208(0);
        
        fifo_inputs_140452470860376(1) <= outputs_140452470860320(0);
        outputs_full_140452470860320(0) <= fifo_full_140452470860376(1);
        
        fifo_inputs_140452470860264(0) <= outputs_140452470860320(1);
        outputs_full_140452470860320(1) <= fifo_full_140452470860264(0);
        
        fifo_inputs_140452470860320(0) <= outputs_140452470860376(1);
        outputs_full_140452470860376(1) <= fifo_full_140452470860320(0);
        

    
        core_inst_140452470807688: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807688,
            fifo_full => fifo_full_140452470807688,
            outputs => outputs_140452470807688,
            outputs_full => outputs_full_140452470807688
        );
        
        core_inst_140452470807632: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807632,
            fifo_full => fifo_full_140452470807632,
            outputs => outputs_140452470807632,
            outputs_full => outputs_full_140452470807632
        );
        
        core_inst_140452470807856: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807856,
            fifo_full => fifo_full_140452470807856,
            outputs => outputs_140452470807856,
            outputs_full => outputs_full_140452470807856
        );
        
        core_inst_140452470807912: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807912,
            fifo_full => fifo_full_140452470807912,
            outputs => outputs_140452470807912,
            outputs_full => outputs_full_140452470807912
        );
        
        core_inst_140452470807968: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807968,
            fifo_full => fifo_full_140452470807968,
            outputs => outputs_140452470807968,
            outputs_full => outputs_full_140452470807968
        );
        
        core_inst_140452470807800: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807800,
            fifo_full => fifo_full_140452470807800,
            outputs => outputs_140452470807800,
            outputs_full => outputs_full_140452470807800
        );
        
        core_inst_140452470808024: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808024,
            fifo_full => fifo_full_140452470808024,
            outputs => outputs_140452470808024,
            outputs_full => outputs_full_140452470808024
        );
        
        core_inst_140452470808080: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808080,
            fifo_full => fifo_full_140452470808080,
            outputs => outputs_140452470808080,
            outputs_full => outputs_full_140452470808080
        );
        
        core_inst_140452470808136: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808136,
            fifo_full => fifo_full_140452470808136,
            outputs => outputs_140452470808136,
            outputs_full => outputs_full_140452470808136
        );
        
        core_inst_140452470808192: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808192,
            fifo_full => fifo_full_140452470808192,
            outputs => outputs_140452470808192,
            outputs_full => outputs_full_140452470808192
        );
        
        core_inst_140452470807744: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470807744,
            fifo_full => fifo_full_140452470807744,
            outputs => outputs_140452470807744,
            outputs_full => outputs_full_140452470807744
        );
        
        core_inst_140452470808248: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808248,
            fifo_full => fifo_full_140452470808248,
            outputs => outputs_140452470808248,
            outputs_full => outputs_full_140452470808248
        );
        
        core_inst_140452470808304: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808304,
            fifo_full => fifo_full_140452470808304,
            outputs => outputs_140452470808304,
            outputs_full => outputs_full_140452470808304
        );
        
        core_inst_140452470808360: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808360,
            fifo_full => fifo_full_140452470808360,
            outputs => outputs_140452470808360,
            outputs_full => outputs_full_140452470808360
        );
        
        core_inst_140452470808416: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808416,
            fifo_full => fifo_full_140452470808416,
            outputs => outputs_140452470808416,
            outputs_full => outputs_full_140452470808416
        );
        
        core_inst_140452470808472: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808472,
            fifo_full => fifo_full_140452470808472,
            outputs => outputs_140452470808472,
            outputs_full => outputs_full_140452470808472
        );
        
        core_inst_140452470808528: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470808528,
            fifo_full => fifo_full_140452470808528,
            outputs => outputs_140452470808528,
            outputs_full => outputs_full_140452470808528
        );
        
        core_inst_140452470857800: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470857800,
            fifo_full => fifo_full_140452470857800,
            outputs => outputs_140452470857800,
            outputs_full => outputs_full_140452470857800
        );
        
        core_inst_140452470857856: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470857856,
            fifo_full => fifo_full_140452470857856,
            outputs => outputs_140452470857856,
            outputs_full => outputs_full_140452470857856
        );
        
        core_inst_140452470857912: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470857912,
            fifo_full => fifo_full_140452470857912,
            outputs => outputs_140452470857912,
            outputs_full => outputs_full_140452470857912
        );
        
        core_inst_140452470857968: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470857968,
            fifo_full => fifo_full_140452470857968,
            outputs => outputs_140452470857968,
            outputs_full => outputs_full_140452470857968
        );
        
        core_inst_140452470858024: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858024,
            fifo_full => fifo_full_140452470858024,
            outputs => outputs_140452470858024,
            outputs_full => outputs_full_140452470858024
        );
        
        core_inst_140452470858080: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858080,
            fifo_full => fifo_full_140452470858080,
            outputs => outputs_140452470858080,
            outputs_full => outputs_full_140452470858080
        );
        
        core_inst_140452470858136: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858136,
            fifo_full => fifo_full_140452470858136,
            outputs => outputs_140452470858136,
            outputs_full => outputs_full_140452470858136
        );
        
        core_inst_140452470858192: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858192,
            fifo_full => fifo_full_140452470858192,
            outputs => outputs_140452470858192,
            outputs_full => outputs_full_140452470858192
        );
        
        core_inst_140452470858248: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858248,
            fifo_full => fifo_full_140452470858248,
            outputs => outputs_140452470858248,
            outputs_full => outputs_full_140452470858248
        );
        
        core_inst_140452470858304: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858304,
            fifo_full => fifo_full_140452470858304,
            outputs => outputs_140452470858304,
            outputs_full => outputs_full_140452470858304
        );
        
        core_inst_140452470858360: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858360,
            fifo_full => fifo_full_140452470858360,
            outputs => outputs_140452470858360,
            outputs_full => outputs_full_140452470858360
        );
        
        core_inst_140452470858416: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858416,
            fifo_full => fifo_full_140452470858416,
            outputs => outputs_140452470858416,
            outputs_full => outputs_full_140452470858416
        );
        
        core_inst_140452470858472: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858472,
            fifo_full => fifo_full_140452470858472,
            outputs => outputs_140452470858472,
            outputs_full => outputs_full_140452470858472
        );
        
        core_inst_140452470858528: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858528,
            fifo_full => fifo_full_140452470858528,
            outputs => outputs_140452470858528,
            outputs_full => outputs_full_140452470858528
        );
        
        core_inst_140452470858584: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858584,
            fifo_full => fifo_full_140452470858584,
            outputs => outputs_140452470858584,
            outputs_full => outputs_full_140452470858584
        );
        
        core_inst_140452470858640: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858640,
            fifo_full => fifo_full_140452470858640,
            outputs => outputs_140452470858640,
            outputs_full => outputs_full_140452470858640
        );
        
        core_inst_140452470858696: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858696,
            fifo_full => fifo_full_140452470858696,
            outputs => outputs_140452470858696,
            outputs_full => outputs_full_140452470858696
        );
        
        core_inst_140452470858752: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858752,
            fifo_full => fifo_full_140452470858752,
            outputs => outputs_140452470858752,
            outputs_full => outputs_full_140452470858752
        );
        
        core_inst_140452470858808: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858808,
            fifo_full => fifo_full_140452470858808,
            outputs => outputs_140452470858808,
            outputs_full => outputs_full_140452470858808
        );
        
        core_inst_140452470858864: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858864,
            fifo_full => fifo_full_140452470858864,
            outputs => outputs_140452470858864,
            outputs_full => outputs_full_140452470858864
        );
        
        core_inst_140452470858920: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858920,
            fifo_full => fifo_full_140452470858920,
            outputs => outputs_140452470858920,
            outputs_full => outputs_full_140452470858920
        );
        
        core_inst_140452470858976: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470858976,
            fifo_full => fifo_full_140452470858976,
            outputs => outputs_140452470858976,
            outputs_full => outputs_full_140452470858976
        );
        
        core_inst_140452470859032: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859032,
            fifo_full => fifo_full_140452470859032,
            outputs => outputs_140452470859032,
            outputs_full => outputs_full_140452470859032
        );
        
        core_inst_140452470859088: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859088,
            fifo_full => fifo_full_140452470859088,
            outputs => outputs_140452470859088,
            outputs_full => outputs_full_140452470859088
        );
        
        core_inst_140452470859144: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859144,
            fifo_full => fifo_full_140452470859144,
            outputs => outputs_140452470859144,
            outputs_full => outputs_full_140452470859144
        );
        
        core_inst_140452470859200: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859200,
            fifo_full => fifo_full_140452470859200,
            outputs => outputs_140452470859200,
            outputs_full => outputs_full_140452470859200
        );
        
        core_inst_140452470859256: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859256,
            fifo_full => fifo_full_140452470859256,
            outputs => outputs_140452470859256,
            outputs_full => outputs_full_140452470859256
        );
        
        core_inst_140452470859312: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859312,
            fifo_full => fifo_full_140452470859312,
            outputs => outputs_140452470859312,
            outputs_full => outputs_full_140452470859312
        );
        
        core_inst_140452470859368: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859368,
            fifo_full => fifo_full_140452470859368,
            outputs => outputs_140452470859368,
            outputs_full => outputs_full_140452470859368
        );
        
        core_inst_140452470859424: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859424,
            fifo_full => fifo_full_140452470859424,
            outputs => outputs_140452470859424,
            outputs_full => outputs_full_140452470859424
        );
        
        core_inst_140452470859480: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859480,
            fifo_full => fifo_full_140452470859480,
            outputs => outputs_140452470859480,
            outputs_full => outputs_full_140452470859480
        );
        
        core_inst_140452470859536: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859536,
            fifo_full => fifo_full_140452470859536,
            outputs => outputs_140452470859536,
            outputs_full => outputs_full_140452470859536
        );
        
        core_inst_140452470859592: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859592,
            fifo_full => fifo_full_140452470859592,
            outputs => outputs_140452470859592,
            outputs_full => outputs_full_140452470859592
        );
        
        core_inst_140452470859648: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859648,
            fifo_full => fifo_full_140452470859648,
            outputs => outputs_140452470859648,
            outputs_full => outputs_full_140452470859648
        );
        
        core_inst_140452470859704: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859704,
            fifo_full => fifo_full_140452470859704,
            outputs => outputs_140452470859704,
            outputs_full => outputs_full_140452470859704
        );
        
        core_inst_140452470859760: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859760,
            fifo_full => fifo_full_140452470859760,
            outputs => outputs_140452470859760,
            outputs_full => outputs_full_140452470859760
        );
        
        core_inst_140452470859816: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859816,
            fifo_full => fifo_full_140452470859816,
            outputs => outputs_140452470859816,
            outputs_full => outputs_full_140452470859816
        );
        
        core_inst_140452470859872: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859872,
            fifo_full => fifo_full_140452470859872,
            outputs => outputs_140452470859872,
            outputs_full => outputs_full_140452470859872
        );
        
        core_inst_140452470859928: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859928,
            fifo_full => fifo_full_140452470859928,
            outputs => outputs_140452470859928,
            outputs_full => outputs_full_140452470859928
        );
        
        core_inst_140452470859984: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470859984,
            fifo_full => fifo_full_140452470859984,
            outputs => outputs_140452470859984,
            outputs_full => outputs_full_140452470859984
        );
        
        core_inst_140452470860040: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860040,
            fifo_full => fifo_full_140452470860040,
            outputs => outputs_140452470860040,
            outputs_full => outputs_full_140452470860040
        );
        
        core_inst_140452470860096: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860096,
            fifo_full => fifo_full_140452470860096,
            outputs => outputs_140452470860096,
            outputs_full => outputs_full_140452470860096
        );
        
        core_inst_140452470860152: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860152,
            fifo_full => fifo_full_140452470860152,
            outputs => outputs_140452470860152,
            outputs_full => outputs_full_140452470860152
        );
        
        core_inst_140452470860208: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860208,
            fifo_full => fifo_full_140452470860208,
            outputs => outputs_140452470860208,
            outputs_full => outputs_full_140452470860208
        );
        
        core_inst_140452470860264: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860264,
            fifo_full => fifo_full_140452470860264,
            outputs => outputs_140452470860264,
            outputs_full => outputs_full_140452470860264
        );
        
        core_inst_140452470860320: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860320,
            fifo_full => fifo_full_140452470860320,
            outputs => outputs_140452470860320,
            outputs_full => outputs_full_140452470860320
        );
        
        core_inst_140452470860376: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140452470860376,
            fifo_full => fifo_full_140452470860376,
            outputs => outputs_140452470860376,
            outputs_full => outputs_full_140452470860376
        );
        

end behav;

