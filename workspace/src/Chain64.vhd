
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Chain64 is
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
end Chain64;

architecture behav of Chain64 is

    
        signal fifo_inputs_140054392691960: core_fifo_inputs_t;
        signal fifo_full_140054392691960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392691960: core_fifo_inputs_t;
        signal outputs_full_140054392691960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692184: core_fifo_inputs_t;
        signal fifo_full_140054392692184: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692184: core_fifo_inputs_t;
        signal outputs_full_140054392692184: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692128: core_fifo_inputs_t;
        signal fifo_full_140054392692128: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692128: core_fifo_inputs_t;
        signal outputs_full_140054392692128: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692240: core_fifo_inputs_t;
        signal fifo_full_140054392692240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692240: core_fifo_inputs_t;
        signal outputs_full_140054392692240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692296: core_fifo_inputs_t;
        signal fifo_full_140054392692296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692296: core_fifo_inputs_t;
        signal outputs_full_140054392692296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692352: core_fifo_inputs_t;
        signal fifo_full_140054392692352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692352: core_fifo_inputs_t;
        signal outputs_full_140054392692352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692408: core_fifo_inputs_t;
        signal fifo_full_140054392692408: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692408: core_fifo_inputs_t;
        signal outputs_full_140054392692408: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692464: core_fifo_inputs_t;
        signal fifo_full_140054392692464: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692464: core_fifo_inputs_t;
        signal outputs_full_140054392692464: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692520: core_fifo_inputs_t;
        signal fifo_full_140054392692520: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692520: core_fifo_inputs_t;
        signal outputs_full_140054392692520: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692072: core_fifo_inputs_t;
        signal fifo_full_140054392692072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692072: core_fifo_inputs_t;
        signal outputs_full_140054392692072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692576: core_fifo_inputs_t;
        signal fifo_full_140054392692576: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692576: core_fifo_inputs_t;
        signal outputs_full_140054392692576: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692632: core_fifo_inputs_t;
        signal fifo_full_140054392692632: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692632: core_fifo_inputs_t;
        signal outputs_full_140054392692632: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392692688: core_fifo_inputs_t;
        signal fifo_full_140054392692688: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392692688: core_fifo_inputs_t;
        signal outputs_full_140054392692688: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392737864: core_fifo_inputs_t;
        signal fifo_full_140054392737864: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392737864: core_fifo_inputs_t;
        signal outputs_full_140054392737864: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392737920: core_fifo_inputs_t;
        signal fifo_full_140054392737920: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392737920: core_fifo_inputs_t;
        signal outputs_full_140054392737920: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392737976: core_fifo_inputs_t;
        signal fifo_full_140054392737976: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392737976: core_fifo_inputs_t;
        signal outputs_full_140054392737976: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738032: core_fifo_inputs_t;
        signal fifo_full_140054392738032: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738032: core_fifo_inputs_t;
        signal outputs_full_140054392738032: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738088: core_fifo_inputs_t;
        signal fifo_full_140054392738088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738088: core_fifo_inputs_t;
        signal outputs_full_140054392738088: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738144: core_fifo_inputs_t;
        signal fifo_full_140054392738144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738144: core_fifo_inputs_t;
        signal outputs_full_140054392738144: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738200: core_fifo_inputs_t;
        signal fifo_full_140054392738200: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738200: core_fifo_inputs_t;
        signal outputs_full_140054392738200: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738256: core_fifo_inputs_t;
        signal fifo_full_140054392738256: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738256: core_fifo_inputs_t;
        signal outputs_full_140054392738256: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738312: core_fifo_inputs_t;
        signal fifo_full_140054392738312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738312: core_fifo_inputs_t;
        signal outputs_full_140054392738312: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738368: core_fifo_inputs_t;
        signal fifo_full_140054392738368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738368: core_fifo_inputs_t;
        signal outputs_full_140054392738368: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738424: core_fifo_inputs_t;
        signal fifo_full_140054392738424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738424: core_fifo_inputs_t;
        signal outputs_full_140054392738424: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738480: core_fifo_inputs_t;
        signal fifo_full_140054392738480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738480: core_fifo_inputs_t;
        signal outputs_full_140054392738480: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738536: core_fifo_inputs_t;
        signal fifo_full_140054392738536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738536: core_fifo_inputs_t;
        signal outputs_full_140054392738536: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738592: core_fifo_inputs_t;
        signal fifo_full_140054392738592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738592: core_fifo_inputs_t;
        signal outputs_full_140054392738592: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738648: core_fifo_inputs_t;
        signal fifo_full_140054392738648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738648: core_fifo_inputs_t;
        signal outputs_full_140054392738648: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738704: core_fifo_inputs_t;
        signal fifo_full_140054392738704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738704: core_fifo_inputs_t;
        signal outputs_full_140054392738704: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738760: core_fifo_inputs_t;
        signal fifo_full_140054392738760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738760: core_fifo_inputs_t;
        signal outputs_full_140054392738760: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738816: core_fifo_inputs_t;
        signal fifo_full_140054392738816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738816: core_fifo_inputs_t;
        signal outputs_full_140054392738816: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738872: core_fifo_inputs_t;
        signal fifo_full_140054392738872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738872: core_fifo_inputs_t;
        signal outputs_full_140054392738872: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738928: core_fifo_inputs_t;
        signal fifo_full_140054392738928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738928: core_fifo_inputs_t;
        signal outputs_full_140054392738928: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392738984: core_fifo_inputs_t;
        signal fifo_full_140054392738984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392738984: core_fifo_inputs_t;
        signal outputs_full_140054392738984: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739040: core_fifo_inputs_t;
        signal fifo_full_140054392739040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739040: core_fifo_inputs_t;
        signal outputs_full_140054392739040: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739096: core_fifo_inputs_t;
        signal fifo_full_140054392739096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739096: core_fifo_inputs_t;
        signal outputs_full_140054392739096: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739152: core_fifo_inputs_t;
        signal fifo_full_140054392739152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739152: core_fifo_inputs_t;
        signal outputs_full_140054392739152: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739208: core_fifo_inputs_t;
        signal fifo_full_140054392739208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739208: core_fifo_inputs_t;
        signal outputs_full_140054392739208: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739264: core_fifo_inputs_t;
        signal fifo_full_140054392739264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739264: core_fifo_inputs_t;
        signal outputs_full_140054392739264: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739320: core_fifo_inputs_t;
        signal fifo_full_140054392739320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739320: core_fifo_inputs_t;
        signal outputs_full_140054392739320: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739376: core_fifo_inputs_t;
        signal fifo_full_140054392739376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739376: core_fifo_inputs_t;
        signal outputs_full_140054392739376: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739432: core_fifo_inputs_t;
        signal fifo_full_140054392739432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739432: core_fifo_inputs_t;
        signal outputs_full_140054392739432: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739488: core_fifo_inputs_t;
        signal fifo_full_140054392739488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739488: core_fifo_inputs_t;
        signal outputs_full_140054392739488: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739544: core_fifo_inputs_t;
        signal fifo_full_140054392739544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739544: core_fifo_inputs_t;
        signal outputs_full_140054392739544: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739600: core_fifo_inputs_t;
        signal fifo_full_140054392739600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739600: core_fifo_inputs_t;
        signal outputs_full_140054392739600: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739656: core_fifo_inputs_t;
        signal fifo_full_140054392739656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739656: core_fifo_inputs_t;
        signal outputs_full_140054392739656: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739712: core_fifo_inputs_t;
        signal fifo_full_140054392739712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739712: core_fifo_inputs_t;
        signal outputs_full_140054392739712: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739768: core_fifo_inputs_t;
        signal fifo_full_140054392739768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739768: core_fifo_inputs_t;
        signal outputs_full_140054392739768: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739824: core_fifo_inputs_t;
        signal fifo_full_140054392739824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739824: core_fifo_inputs_t;
        signal outputs_full_140054392739824: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739880: core_fifo_inputs_t;
        signal fifo_full_140054392739880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739880: core_fifo_inputs_t;
        signal outputs_full_140054392739880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739936: core_fifo_inputs_t;
        signal fifo_full_140054392739936: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739936: core_fifo_inputs_t;
        signal outputs_full_140054392739936: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392739992: core_fifo_inputs_t;
        signal fifo_full_140054392739992: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392739992: core_fifo_inputs_t;
        signal outputs_full_140054392739992: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740048: core_fifo_inputs_t;
        signal fifo_full_140054392740048: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740048: core_fifo_inputs_t;
        signal outputs_full_140054392740048: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740104: core_fifo_inputs_t;
        signal fifo_full_140054392740104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740104: core_fifo_inputs_t;
        signal outputs_full_140054392740104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740160: core_fifo_inputs_t;
        signal fifo_full_140054392740160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740160: core_fifo_inputs_t;
        signal outputs_full_140054392740160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740216: core_fifo_inputs_t;
        signal fifo_full_140054392740216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740216: core_fifo_inputs_t;
        signal outputs_full_140054392740216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740272: core_fifo_inputs_t;
        signal fifo_full_140054392740272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740272: core_fifo_inputs_t;
        signal outputs_full_140054392740272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740328: core_fifo_inputs_t;
        signal fifo_full_140054392740328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740328: core_fifo_inputs_t;
        signal outputs_full_140054392740328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740384: core_fifo_inputs_t;
        signal fifo_full_140054392740384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740384: core_fifo_inputs_t;
        signal outputs_full_140054392740384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740440: core_fifo_inputs_t;
        signal fifo_full_140054392740440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740440: core_fifo_inputs_t;
        signal outputs_full_140054392740440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740496: core_fifo_inputs_t;
        signal fifo_full_140054392740496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740496: core_fifo_inputs_t;
        signal outputs_full_140054392740496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740552: core_fifo_inputs_t;
        signal fifo_full_140054392740552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740552: core_fifo_inputs_t;
        signal outputs_full_140054392740552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740608: core_fifo_inputs_t;
        signal fifo_full_140054392740608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740608: core_fifo_inputs_t;
        signal outputs_full_140054392740608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_140054392740664: core_fifo_inputs_t;
        signal fifo_full_140054392740664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_140054392740664: core_fifo_inputs_t;
        signal outputs_full_140054392740664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

        outputs(0) <= outputs_140054392740664(0);
        outputs_full_140054392740664(0) <= outputs_full(0);

        fifo_inputs_140054392691960(0) <= fifo_inputs(0);
        fifo_full(0) <= fifo_full_140054392691960(0);
    
        fifo_inputs_140054392692184(0) <= outputs_140054392691960(0);
        outputs_full_140054392691960(0) <= fifo_full_140054392692184(0);
        
        fifo_inputs_140054392692128(0) <= outputs_140054392692184(0);
        outputs_full_140054392692184(0) <= fifo_full_140054392692128(0);
        
        fifo_inputs_140054392692240(0) <= outputs_140054392692128(0);
        outputs_full_140054392692128(0) <= fifo_full_140054392692240(0);
        
        fifo_inputs_140054392692296(0) <= outputs_140054392692240(0);
        outputs_full_140054392692240(0) <= fifo_full_140054392692296(0);
        
        fifo_inputs_140054392692352(0) <= outputs_140054392692296(0);
        outputs_full_140054392692296(0) <= fifo_full_140054392692352(0);
        
        fifo_inputs_140054392692408(0) <= outputs_140054392692352(0);
        outputs_full_140054392692352(0) <= fifo_full_140054392692408(0);
        
        fifo_inputs_140054392692464(0) <= outputs_140054392692408(0);
        outputs_full_140054392692408(0) <= fifo_full_140054392692464(0);
        
        fifo_inputs_140054392692520(0) <= outputs_140054392692464(0);
        outputs_full_140054392692464(0) <= fifo_full_140054392692520(0);
        
        fifo_inputs_140054392692072(0) <= outputs_140054392692520(0);
        outputs_full_140054392692520(0) <= fifo_full_140054392692072(0);
        
        fifo_inputs_140054392692576(0) <= outputs_140054392692072(0);
        outputs_full_140054392692072(0) <= fifo_full_140054392692576(0);
        
        fifo_inputs_140054392692632(0) <= outputs_140054392692576(0);
        outputs_full_140054392692576(0) <= fifo_full_140054392692632(0);
        
        fifo_inputs_140054392692688(0) <= outputs_140054392692632(0);
        outputs_full_140054392692632(0) <= fifo_full_140054392692688(0);
        
        fifo_inputs_140054392737864(0) <= outputs_140054392692688(0);
        outputs_full_140054392692688(0) <= fifo_full_140054392737864(0);
        
        fifo_inputs_140054392737920(0) <= outputs_140054392737864(0);
        outputs_full_140054392737864(0) <= fifo_full_140054392737920(0);
        
        fifo_inputs_140054392737976(0) <= outputs_140054392737920(0);
        outputs_full_140054392737920(0) <= fifo_full_140054392737976(0);
        
        fifo_inputs_140054392738032(0) <= outputs_140054392737976(0);
        outputs_full_140054392737976(0) <= fifo_full_140054392738032(0);
        
        fifo_inputs_140054392738088(0) <= outputs_140054392738032(0);
        outputs_full_140054392738032(0) <= fifo_full_140054392738088(0);
        
        fifo_inputs_140054392738144(0) <= outputs_140054392738088(0);
        outputs_full_140054392738088(0) <= fifo_full_140054392738144(0);
        
        fifo_inputs_140054392738200(0) <= outputs_140054392738144(0);
        outputs_full_140054392738144(0) <= fifo_full_140054392738200(0);
        
        fifo_inputs_140054392738256(0) <= outputs_140054392738200(0);
        outputs_full_140054392738200(0) <= fifo_full_140054392738256(0);
        
        fifo_inputs_140054392738312(0) <= outputs_140054392738256(0);
        outputs_full_140054392738256(0) <= fifo_full_140054392738312(0);
        
        fifo_inputs_140054392738368(0) <= outputs_140054392738312(0);
        outputs_full_140054392738312(0) <= fifo_full_140054392738368(0);
        
        fifo_inputs_140054392738424(0) <= outputs_140054392738368(0);
        outputs_full_140054392738368(0) <= fifo_full_140054392738424(0);
        
        fifo_inputs_140054392738480(0) <= outputs_140054392738424(0);
        outputs_full_140054392738424(0) <= fifo_full_140054392738480(0);
        
        fifo_inputs_140054392738536(0) <= outputs_140054392738480(0);
        outputs_full_140054392738480(0) <= fifo_full_140054392738536(0);
        
        fifo_inputs_140054392738592(0) <= outputs_140054392738536(0);
        outputs_full_140054392738536(0) <= fifo_full_140054392738592(0);
        
        fifo_inputs_140054392738648(0) <= outputs_140054392738592(0);
        outputs_full_140054392738592(0) <= fifo_full_140054392738648(0);
        
        fifo_inputs_140054392738704(0) <= outputs_140054392738648(0);
        outputs_full_140054392738648(0) <= fifo_full_140054392738704(0);
        
        fifo_inputs_140054392738760(0) <= outputs_140054392738704(0);
        outputs_full_140054392738704(0) <= fifo_full_140054392738760(0);
        
        fifo_inputs_140054392738816(0) <= outputs_140054392738760(0);
        outputs_full_140054392738760(0) <= fifo_full_140054392738816(0);
        
        fifo_inputs_140054392738872(0) <= outputs_140054392738816(0);
        outputs_full_140054392738816(0) <= fifo_full_140054392738872(0);
        
        fifo_inputs_140054392738928(0) <= outputs_140054392738872(0);
        outputs_full_140054392738872(0) <= fifo_full_140054392738928(0);
        
        fifo_inputs_140054392738984(0) <= outputs_140054392738928(0);
        outputs_full_140054392738928(0) <= fifo_full_140054392738984(0);
        
        fifo_inputs_140054392739040(0) <= outputs_140054392738984(0);
        outputs_full_140054392738984(0) <= fifo_full_140054392739040(0);
        
        fifo_inputs_140054392739096(0) <= outputs_140054392739040(0);
        outputs_full_140054392739040(0) <= fifo_full_140054392739096(0);
        
        fifo_inputs_140054392739152(0) <= outputs_140054392739096(0);
        outputs_full_140054392739096(0) <= fifo_full_140054392739152(0);
        
        fifo_inputs_140054392739208(0) <= outputs_140054392739152(0);
        outputs_full_140054392739152(0) <= fifo_full_140054392739208(0);
        
        fifo_inputs_140054392739264(0) <= outputs_140054392739208(0);
        outputs_full_140054392739208(0) <= fifo_full_140054392739264(0);
        
        fifo_inputs_140054392739320(0) <= outputs_140054392739264(0);
        outputs_full_140054392739264(0) <= fifo_full_140054392739320(0);
        
        fifo_inputs_140054392739376(0) <= outputs_140054392739320(0);
        outputs_full_140054392739320(0) <= fifo_full_140054392739376(0);
        
        fifo_inputs_140054392739432(0) <= outputs_140054392739376(0);
        outputs_full_140054392739376(0) <= fifo_full_140054392739432(0);
        
        fifo_inputs_140054392739488(0) <= outputs_140054392739432(0);
        outputs_full_140054392739432(0) <= fifo_full_140054392739488(0);
        
        fifo_inputs_140054392739544(0) <= outputs_140054392739488(0);
        outputs_full_140054392739488(0) <= fifo_full_140054392739544(0);
        
        fifo_inputs_140054392739600(0) <= outputs_140054392739544(0);
        outputs_full_140054392739544(0) <= fifo_full_140054392739600(0);
        
        fifo_inputs_140054392739656(0) <= outputs_140054392739600(0);
        outputs_full_140054392739600(0) <= fifo_full_140054392739656(0);
        
        fifo_inputs_140054392739712(0) <= outputs_140054392739656(0);
        outputs_full_140054392739656(0) <= fifo_full_140054392739712(0);
        
        fifo_inputs_140054392739768(0) <= outputs_140054392739712(0);
        outputs_full_140054392739712(0) <= fifo_full_140054392739768(0);
        
        fifo_inputs_140054392739824(0) <= outputs_140054392739768(0);
        outputs_full_140054392739768(0) <= fifo_full_140054392739824(0);
        
        fifo_inputs_140054392739880(0) <= outputs_140054392739824(0);
        outputs_full_140054392739824(0) <= fifo_full_140054392739880(0);
        
        fifo_inputs_140054392739936(0) <= outputs_140054392739880(0);
        outputs_full_140054392739880(0) <= fifo_full_140054392739936(0);
        
        fifo_inputs_140054392739992(0) <= outputs_140054392739936(0);
        outputs_full_140054392739936(0) <= fifo_full_140054392739992(0);
        
        fifo_inputs_140054392740048(0) <= outputs_140054392739992(0);
        outputs_full_140054392739992(0) <= fifo_full_140054392740048(0);
        
        fifo_inputs_140054392740104(0) <= outputs_140054392740048(0);
        outputs_full_140054392740048(0) <= fifo_full_140054392740104(0);
        
        fifo_inputs_140054392740160(0) <= outputs_140054392740104(0);
        outputs_full_140054392740104(0) <= fifo_full_140054392740160(0);
        
        fifo_inputs_140054392740216(0) <= outputs_140054392740160(0);
        outputs_full_140054392740160(0) <= fifo_full_140054392740216(0);
        
        fifo_inputs_140054392740272(0) <= outputs_140054392740216(0);
        outputs_full_140054392740216(0) <= fifo_full_140054392740272(0);
        
        fifo_inputs_140054392740328(0) <= outputs_140054392740272(0);
        outputs_full_140054392740272(0) <= fifo_full_140054392740328(0);
        
        fifo_inputs_140054392740384(0) <= outputs_140054392740328(0);
        outputs_full_140054392740328(0) <= fifo_full_140054392740384(0);
        
        fifo_inputs_140054392740440(0) <= outputs_140054392740384(0);
        outputs_full_140054392740384(0) <= fifo_full_140054392740440(0);
        
        fifo_inputs_140054392740496(0) <= outputs_140054392740440(0);
        outputs_full_140054392740440(0) <= fifo_full_140054392740496(0);
        
        fifo_inputs_140054392740552(0) <= outputs_140054392740496(0);
        outputs_full_140054392740496(0) <= fifo_full_140054392740552(0);
        
        fifo_inputs_140054392740608(0) <= outputs_140054392740552(0);
        outputs_full_140054392740552(0) <= fifo_full_140054392740608(0);
        
        fifo_inputs_140054392740664(0) <= outputs_140054392740608(0);
        outputs_full_140054392740608(0) <= fifo_full_140054392740664(0);
        

    
        core_inst_140054392691960: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392691960,
            fifo_full => fifo_full_140054392691960,
            outputs => outputs_140054392691960,
            outputs_full => outputs_full_140054392691960
        );
        
        core_inst_140054392692184: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692184,
            fifo_full => fifo_full_140054392692184,
            outputs => outputs_140054392692184,
            outputs_full => outputs_full_140054392692184
        );
        
        core_inst_140054392692128: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692128,
            fifo_full => fifo_full_140054392692128,
            outputs => outputs_140054392692128,
            outputs_full => outputs_full_140054392692128
        );
        
        core_inst_140054392692240: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692240,
            fifo_full => fifo_full_140054392692240,
            outputs => outputs_140054392692240,
            outputs_full => outputs_full_140054392692240
        );
        
        core_inst_140054392692296: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692296,
            fifo_full => fifo_full_140054392692296,
            outputs => outputs_140054392692296,
            outputs_full => outputs_full_140054392692296
        );
        
        core_inst_140054392692352: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692352,
            fifo_full => fifo_full_140054392692352,
            outputs => outputs_140054392692352,
            outputs_full => outputs_full_140054392692352
        );
        
        core_inst_140054392692408: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692408,
            fifo_full => fifo_full_140054392692408,
            outputs => outputs_140054392692408,
            outputs_full => outputs_full_140054392692408
        );
        
        core_inst_140054392692464: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692464,
            fifo_full => fifo_full_140054392692464,
            outputs => outputs_140054392692464,
            outputs_full => outputs_full_140054392692464
        );
        
        core_inst_140054392692520: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692520,
            fifo_full => fifo_full_140054392692520,
            outputs => outputs_140054392692520,
            outputs_full => outputs_full_140054392692520
        );
        
        core_inst_140054392692072: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692072,
            fifo_full => fifo_full_140054392692072,
            outputs => outputs_140054392692072,
            outputs_full => outputs_full_140054392692072
        );
        
        core_inst_140054392692576: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692576,
            fifo_full => fifo_full_140054392692576,
            outputs => outputs_140054392692576,
            outputs_full => outputs_full_140054392692576
        );
        
        core_inst_140054392692632: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692632,
            fifo_full => fifo_full_140054392692632,
            outputs => outputs_140054392692632,
            outputs_full => outputs_full_140054392692632
        );
        
        core_inst_140054392692688: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392692688,
            fifo_full => fifo_full_140054392692688,
            outputs => outputs_140054392692688,
            outputs_full => outputs_full_140054392692688
        );
        
        core_inst_140054392737864: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392737864,
            fifo_full => fifo_full_140054392737864,
            outputs => outputs_140054392737864,
            outputs_full => outputs_full_140054392737864
        );
        
        core_inst_140054392737920: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392737920,
            fifo_full => fifo_full_140054392737920,
            outputs => outputs_140054392737920,
            outputs_full => outputs_full_140054392737920
        );
        
        core_inst_140054392737976: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392737976,
            fifo_full => fifo_full_140054392737976,
            outputs => outputs_140054392737976,
            outputs_full => outputs_full_140054392737976
        );
        
        core_inst_140054392738032: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738032,
            fifo_full => fifo_full_140054392738032,
            outputs => outputs_140054392738032,
            outputs_full => outputs_full_140054392738032
        );
        
        core_inst_140054392738088: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738088,
            fifo_full => fifo_full_140054392738088,
            outputs => outputs_140054392738088,
            outputs_full => outputs_full_140054392738088
        );
        
        core_inst_140054392738144: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738144,
            fifo_full => fifo_full_140054392738144,
            outputs => outputs_140054392738144,
            outputs_full => outputs_full_140054392738144
        );
        
        core_inst_140054392738200: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738200,
            fifo_full => fifo_full_140054392738200,
            outputs => outputs_140054392738200,
            outputs_full => outputs_full_140054392738200
        );
        
        core_inst_140054392738256: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738256,
            fifo_full => fifo_full_140054392738256,
            outputs => outputs_140054392738256,
            outputs_full => outputs_full_140054392738256
        );
        
        core_inst_140054392738312: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738312,
            fifo_full => fifo_full_140054392738312,
            outputs => outputs_140054392738312,
            outputs_full => outputs_full_140054392738312
        );
        
        core_inst_140054392738368: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738368,
            fifo_full => fifo_full_140054392738368,
            outputs => outputs_140054392738368,
            outputs_full => outputs_full_140054392738368
        );
        
        core_inst_140054392738424: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738424,
            fifo_full => fifo_full_140054392738424,
            outputs => outputs_140054392738424,
            outputs_full => outputs_full_140054392738424
        );
        
        core_inst_140054392738480: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738480,
            fifo_full => fifo_full_140054392738480,
            outputs => outputs_140054392738480,
            outputs_full => outputs_full_140054392738480
        );
        
        core_inst_140054392738536: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738536,
            fifo_full => fifo_full_140054392738536,
            outputs => outputs_140054392738536,
            outputs_full => outputs_full_140054392738536
        );
        
        core_inst_140054392738592: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738592,
            fifo_full => fifo_full_140054392738592,
            outputs => outputs_140054392738592,
            outputs_full => outputs_full_140054392738592
        );
        
        core_inst_140054392738648: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738648,
            fifo_full => fifo_full_140054392738648,
            outputs => outputs_140054392738648,
            outputs_full => outputs_full_140054392738648
        );
        
        core_inst_140054392738704: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738704,
            fifo_full => fifo_full_140054392738704,
            outputs => outputs_140054392738704,
            outputs_full => outputs_full_140054392738704
        );
        
        core_inst_140054392738760: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738760,
            fifo_full => fifo_full_140054392738760,
            outputs => outputs_140054392738760,
            outputs_full => outputs_full_140054392738760
        );
        
        core_inst_140054392738816: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738816,
            fifo_full => fifo_full_140054392738816,
            outputs => outputs_140054392738816,
            outputs_full => outputs_full_140054392738816
        );
        
        core_inst_140054392738872: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738872,
            fifo_full => fifo_full_140054392738872,
            outputs => outputs_140054392738872,
            outputs_full => outputs_full_140054392738872
        );
        
        core_inst_140054392738928: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738928,
            fifo_full => fifo_full_140054392738928,
            outputs => outputs_140054392738928,
            outputs_full => outputs_full_140054392738928
        );
        
        core_inst_140054392738984: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392738984,
            fifo_full => fifo_full_140054392738984,
            outputs => outputs_140054392738984,
            outputs_full => outputs_full_140054392738984
        );
        
        core_inst_140054392739040: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739040,
            fifo_full => fifo_full_140054392739040,
            outputs => outputs_140054392739040,
            outputs_full => outputs_full_140054392739040
        );
        
        core_inst_140054392739096: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739096,
            fifo_full => fifo_full_140054392739096,
            outputs => outputs_140054392739096,
            outputs_full => outputs_full_140054392739096
        );
        
        core_inst_140054392739152: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739152,
            fifo_full => fifo_full_140054392739152,
            outputs => outputs_140054392739152,
            outputs_full => outputs_full_140054392739152
        );
        
        core_inst_140054392739208: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739208,
            fifo_full => fifo_full_140054392739208,
            outputs => outputs_140054392739208,
            outputs_full => outputs_full_140054392739208
        );
        
        core_inst_140054392739264: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739264,
            fifo_full => fifo_full_140054392739264,
            outputs => outputs_140054392739264,
            outputs_full => outputs_full_140054392739264
        );
        
        core_inst_140054392739320: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739320,
            fifo_full => fifo_full_140054392739320,
            outputs => outputs_140054392739320,
            outputs_full => outputs_full_140054392739320
        );
        
        core_inst_140054392739376: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739376,
            fifo_full => fifo_full_140054392739376,
            outputs => outputs_140054392739376,
            outputs_full => outputs_full_140054392739376
        );
        
        core_inst_140054392739432: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739432,
            fifo_full => fifo_full_140054392739432,
            outputs => outputs_140054392739432,
            outputs_full => outputs_full_140054392739432
        );
        
        core_inst_140054392739488: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739488,
            fifo_full => fifo_full_140054392739488,
            outputs => outputs_140054392739488,
            outputs_full => outputs_full_140054392739488
        );
        
        core_inst_140054392739544: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739544,
            fifo_full => fifo_full_140054392739544,
            outputs => outputs_140054392739544,
            outputs_full => outputs_full_140054392739544
        );
        
        core_inst_140054392739600: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739600,
            fifo_full => fifo_full_140054392739600,
            outputs => outputs_140054392739600,
            outputs_full => outputs_full_140054392739600
        );
        
        core_inst_140054392739656: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739656,
            fifo_full => fifo_full_140054392739656,
            outputs => outputs_140054392739656,
            outputs_full => outputs_full_140054392739656
        );
        
        core_inst_140054392739712: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739712,
            fifo_full => fifo_full_140054392739712,
            outputs => outputs_140054392739712,
            outputs_full => outputs_full_140054392739712
        );
        
        core_inst_140054392739768: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739768,
            fifo_full => fifo_full_140054392739768,
            outputs => outputs_140054392739768,
            outputs_full => outputs_full_140054392739768
        );
        
        core_inst_140054392739824: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739824,
            fifo_full => fifo_full_140054392739824,
            outputs => outputs_140054392739824,
            outputs_full => outputs_full_140054392739824
        );
        
        core_inst_140054392739880: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739880,
            fifo_full => fifo_full_140054392739880,
            outputs => outputs_140054392739880,
            outputs_full => outputs_full_140054392739880
        );
        
        core_inst_140054392739936: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739936,
            fifo_full => fifo_full_140054392739936,
            outputs => outputs_140054392739936,
            outputs_full => outputs_full_140054392739936
        );
        
        core_inst_140054392739992: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392739992,
            fifo_full => fifo_full_140054392739992,
            outputs => outputs_140054392739992,
            outputs_full => outputs_full_140054392739992
        );
        
        core_inst_140054392740048: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740048,
            fifo_full => fifo_full_140054392740048,
            outputs => outputs_140054392740048,
            outputs_full => outputs_full_140054392740048
        );
        
        core_inst_140054392740104: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740104,
            fifo_full => fifo_full_140054392740104,
            outputs => outputs_140054392740104,
            outputs_full => outputs_full_140054392740104
        );
        
        core_inst_140054392740160: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740160,
            fifo_full => fifo_full_140054392740160,
            outputs => outputs_140054392740160,
            outputs_full => outputs_full_140054392740160
        );
        
        core_inst_140054392740216: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740216,
            fifo_full => fifo_full_140054392740216,
            outputs => outputs_140054392740216,
            outputs_full => outputs_full_140054392740216
        );
        
        core_inst_140054392740272: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740272,
            fifo_full => fifo_full_140054392740272,
            outputs => outputs_140054392740272,
            outputs_full => outputs_full_140054392740272
        );
        
        core_inst_140054392740328: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740328,
            fifo_full => fifo_full_140054392740328,
            outputs => outputs_140054392740328,
            outputs_full => outputs_full_140054392740328
        );
        
        core_inst_140054392740384: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740384,
            fifo_full => fifo_full_140054392740384,
            outputs => outputs_140054392740384,
            outputs_full => outputs_full_140054392740384
        );
        
        core_inst_140054392740440: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740440,
            fifo_full => fifo_full_140054392740440,
            outputs => outputs_140054392740440,
            outputs_full => outputs_full_140054392740440
        );
        
        core_inst_140054392740496: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740496,
            fifo_full => fifo_full_140054392740496,
            outputs => outputs_140054392740496,
            outputs_full => outputs_full_140054392740496
        );
        
        core_inst_140054392740552: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740552,
            fifo_full => fifo_full_140054392740552,
            outputs => outputs_140054392740552,
            outputs_full => outputs_full_140054392740552
        );
        
        core_inst_140054392740608: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740608,
            fifo_full => fifo_full_140054392740608,
            outputs => outputs_140054392740608,
            outputs_full => outputs_full_140054392740608
        );
        
        core_inst_140054392740664: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_140054392740664,
            fifo_full => fifo_full_140054392740664,
            outputs => outputs_140054392740664,
            outputs_full => outputs_full_140054392740664
        );
        

end behav;

