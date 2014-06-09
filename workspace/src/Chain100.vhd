
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Chain100 is
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
end Chain100;

architecture behav of Chain100 is

    
        signal fifo_inputs_139705765329160: core_fifo_inputs_t;
        signal fifo_full_139705765329160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329160: core_fifo_inputs_t;
        signal outputs_full_139705765329160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329104: core_fifo_inputs_t;
        signal fifo_full_139705765329104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329104: core_fifo_inputs_t;
        signal outputs_full_139705765329104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329328: core_fifo_inputs_t;
        signal fifo_full_139705765329328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329328: core_fifo_inputs_t;
        signal outputs_full_139705765329328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329272: core_fifo_inputs_t;
        signal fifo_full_139705765329272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329272: core_fifo_inputs_t;
        signal outputs_full_139705765329272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329384: core_fifo_inputs_t;
        signal fifo_full_139705765329384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329384: core_fifo_inputs_t;
        signal outputs_full_139705765329384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329440: core_fifo_inputs_t;
        signal fifo_full_139705765329440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329440: core_fifo_inputs_t;
        signal outputs_full_139705765329440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329496: core_fifo_inputs_t;
        signal fifo_full_139705765329496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329496: core_fifo_inputs_t;
        signal outputs_full_139705765329496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329552: core_fifo_inputs_t;
        signal fifo_full_139705765329552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329552: core_fifo_inputs_t;
        signal outputs_full_139705765329552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329608: core_fifo_inputs_t;
        signal fifo_full_139705765329608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329608: core_fifo_inputs_t;
        signal outputs_full_139705765329608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329664: core_fifo_inputs_t;
        signal fifo_full_139705765329664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329664: core_fifo_inputs_t;
        signal outputs_full_139705765329664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329216: core_fifo_inputs_t;
        signal fifo_full_139705765329216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329216: core_fifo_inputs_t;
        signal outputs_full_139705765329216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329720: core_fifo_inputs_t;
        signal fifo_full_139705765329720: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329720: core_fifo_inputs_t;
        signal outputs_full_139705765329720: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329776: core_fifo_inputs_t;
        signal fifo_full_139705765329776: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329776: core_fifo_inputs_t;
        signal outputs_full_139705765329776: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329832: core_fifo_inputs_t;
        signal fifo_full_139705765329832: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329832: core_fifo_inputs_t;
        signal outputs_full_139705765329832: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329888: core_fifo_inputs_t;
        signal fifo_full_139705765329888: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329888: core_fifo_inputs_t;
        signal outputs_full_139705765329888: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765329944: core_fifo_inputs_t;
        signal fifo_full_139705765329944: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765329944: core_fifo_inputs_t;
        signal outputs_full_139705765329944: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330000: core_fifo_inputs_t;
        signal fifo_full_139705765330000: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330000: core_fifo_inputs_t;
        signal outputs_full_139705765330000: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330056: core_fifo_inputs_t;
        signal fifo_full_139705765330056: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330056: core_fifo_inputs_t;
        signal outputs_full_139705765330056: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330112: core_fifo_inputs_t;
        signal fifo_full_139705765330112: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330112: core_fifo_inputs_t;
        signal outputs_full_139705765330112: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330168: core_fifo_inputs_t;
        signal fifo_full_139705765330168: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330168: core_fifo_inputs_t;
        signal outputs_full_139705765330168: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330224: core_fifo_inputs_t;
        signal fifo_full_139705765330224: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330224: core_fifo_inputs_t;
        signal outputs_full_139705765330224: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330280: core_fifo_inputs_t;
        signal fifo_full_139705765330280: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330280: core_fifo_inputs_t;
        signal outputs_full_139705765330280: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330336: core_fifo_inputs_t;
        signal fifo_full_139705765330336: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330336: core_fifo_inputs_t;
        signal outputs_full_139705765330336: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330392: core_fifo_inputs_t;
        signal fifo_full_139705765330392: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330392: core_fifo_inputs_t;
        signal outputs_full_139705765330392: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330448: core_fifo_inputs_t;
        signal fifo_full_139705765330448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330448: core_fifo_inputs_t;
        signal outputs_full_139705765330448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330504: core_fifo_inputs_t;
        signal fifo_full_139705765330504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330504: core_fifo_inputs_t;
        signal outputs_full_139705765330504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330560: core_fifo_inputs_t;
        signal fifo_full_139705765330560: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330560: core_fifo_inputs_t;
        signal outputs_full_139705765330560: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330616: core_fifo_inputs_t;
        signal fifo_full_139705765330616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330616: core_fifo_inputs_t;
        signal outputs_full_139705765330616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330672: core_fifo_inputs_t;
        signal fifo_full_139705765330672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330672: core_fifo_inputs_t;
        signal outputs_full_139705765330672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330728: core_fifo_inputs_t;
        signal fifo_full_139705765330728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330728: core_fifo_inputs_t;
        signal outputs_full_139705765330728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330784: core_fifo_inputs_t;
        signal fifo_full_139705765330784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330784: core_fifo_inputs_t;
        signal outputs_full_139705765330784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330840: core_fifo_inputs_t;
        signal fifo_full_139705765330840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330840: core_fifo_inputs_t;
        signal outputs_full_139705765330840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765330896: core_fifo_inputs_t;
        signal fifo_full_139705765330896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765330896: core_fifo_inputs_t;
        signal outputs_full_139705765330896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765367880: core_fifo_inputs_t;
        signal fifo_full_139705765367880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765367880: core_fifo_inputs_t;
        signal outputs_full_139705765367880: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765367936: core_fifo_inputs_t;
        signal fifo_full_139705765367936: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765367936: core_fifo_inputs_t;
        signal outputs_full_139705765367936: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765367992: core_fifo_inputs_t;
        signal fifo_full_139705765367992: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765367992: core_fifo_inputs_t;
        signal outputs_full_139705765367992: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368048: core_fifo_inputs_t;
        signal fifo_full_139705765368048: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368048: core_fifo_inputs_t;
        signal outputs_full_139705765368048: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368104: core_fifo_inputs_t;
        signal fifo_full_139705765368104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368104: core_fifo_inputs_t;
        signal outputs_full_139705765368104: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368160: core_fifo_inputs_t;
        signal fifo_full_139705765368160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368160: core_fifo_inputs_t;
        signal outputs_full_139705765368160: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368216: core_fifo_inputs_t;
        signal fifo_full_139705765368216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368216: core_fifo_inputs_t;
        signal outputs_full_139705765368216: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368272: core_fifo_inputs_t;
        signal fifo_full_139705765368272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368272: core_fifo_inputs_t;
        signal outputs_full_139705765368272: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368328: core_fifo_inputs_t;
        signal fifo_full_139705765368328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368328: core_fifo_inputs_t;
        signal outputs_full_139705765368328: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368384: core_fifo_inputs_t;
        signal fifo_full_139705765368384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368384: core_fifo_inputs_t;
        signal outputs_full_139705765368384: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368440: core_fifo_inputs_t;
        signal fifo_full_139705765368440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368440: core_fifo_inputs_t;
        signal outputs_full_139705765368440: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368496: core_fifo_inputs_t;
        signal fifo_full_139705765368496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368496: core_fifo_inputs_t;
        signal outputs_full_139705765368496: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368552: core_fifo_inputs_t;
        signal fifo_full_139705765368552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368552: core_fifo_inputs_t;
        signal outputs_full_139705765368552: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368608: core_fifo_inputs_t;
        signal fifo_full_139705765368608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368608: core_fifo_inputs_t;
        signal outputs_full_139705765368608: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368664: core_fifo_inputs_t;
        signal fifo_full_139705765368664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368664: core_fifo_inputs_t;
        signal outputs_full_139705765368664: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368720: core_fifo_inputs_t;
        signal fifo_full_139705765368720: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368720: core_fifo_inputs_t;
        signal outputs_full_139705765368720: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368776: core_fifo_inputs_t;
        signal fifo_full_139705765368776: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368776: core_fifo_inputs_t;
        signal outputs_full_139705765368776: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368832: core_fifo_inputs_t;
        signal fifo_full_139705765368832: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368832: core_fifo_inputs_t;
        signal outputs_full_139705765368832: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368888: core_fifo_inputs_t;
        signal fifo_full_139705765368888: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368888: core_fifo_inputs_t;
        signal outputs_full_139705765368888: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765368944: core_fifo_inputs_t;
        signal fifo_full_139705765368944: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765368944: core_fifo_inputs_t;
        signal outputs_full_139705765368944: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369000: core_fifo_inputs_t;
        signal fifo_full_139705765369000: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369000: core_fifo_inputs_t;
        signal outputs_full_139705765369000: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369056: core_fifo_inputs_t;
        signal fifo_full_139705765369056: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369056: core_fifo_inputs_t;
        signal outputs_full_139705765369056: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369112: core_fifo_inputs_t;
        signal fifo_full_139705765369112: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369112: core_fifo_inputs_t;
        signal outputs_full_139705765369112: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369168: core_fifo_inputs_t;
        signal fifo_full_139705765369168: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369168: core_fifo_inputs_t;
        signal outputs_full_139705765369168: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369224: core_fifo_inputs_t;
        signal fifo_full_139705765369224: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369224: core_fifo_inputs_t;
        signal outputs_full_139705765369224: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369280: core_fifo_inputs_t;
        signal fifo_full_139705765369280: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369280: core_fifo_inputs_t;
        signal outputs_full_139705765369280: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369336: core_fifo_inputs_t;
        signal fifo_full_139705765369336: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369336: core_fifo_inputs_t;
        signal outputs_full_139705765369336: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369392: core_fifo_inputs_t;
        signal fifo_full_139705765369392: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369392: core_fifo_inputs_t;
        signal outputs_full_139705765369392: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369448: core_fifo_inputs_t;
        signal fifo_full_139705765369448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369448: core_fifo_inputs_t;
        signal outputs_full_139705765369448: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369504: core_fifo_inputs_t;
        signal fifo_full_139705765369504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369504: core_fifo_inputs_t;
        signal outputs_full_139705765369504: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369560: core_fifo_inputs_t;
        signal fifo_full_139705765369560: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369560: core_fifo_inputs_t;
        signal outputs_full_139705765369560: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369616: core_fifo_inputs_t;
        signal fifo_full_139705765369616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369616: core_fifo_inputs_t;
        signal outputs_full_139705765369616: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369672: core_fifo_inputs_t;
        signal fifo_full_139705765369672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369672: core_fifo_inputs_t;
        signal outputs_full_139705765369672: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369728: core_fifo_inputs_t;
        signal fifo_full_139705765369728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369728: core_fifo_inputs_t;
        signal outputs_full_139705765369728: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369784: core_fifo_inputs_t;
        signal fifo_full_139705765369784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369784: core_fifo_inputs_t;
        signal outputs_full_139705765369784: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369840: core_fifo_inputs_t;
        signal fifo_full_139705765369840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369840: core_fifo_inputs_t;
        signal outputs_full_139705765369840: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369896: core_fifo_inputs_t;
        signal fifo_full_139705765369896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369896: core_fifo_inputs_t;
        signal outputs_full_139705765369896: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765369952: core_fifo_inputs_t;
        signal fifo_full_139705765369952: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765369952: core_fifo_inputs_t;
        signal outputs_full_139705765369952: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370008: core_fifo_inputs_t;
        signal fifo_full_139705765370008: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370008: core_fifo_inputs_t;
        signal outputs_full_139705765370008: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370064: core_fifo_inputs_t;
        signal fifo_full_139705765370064: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370064: core_fifo_inputs_t;
        signal outputs_full_139705765370064: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370120: core_fifo_inputs_t;
        signal fifo_full_139705765370120: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370120: core_fifo_inputs_t;
        signal outputs_full_139705765370120: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370176: core_fifo_inputs_t;
        signal fifo_full_139705765370176: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370176: core_fifo_inputs_t;
        signal outputs_full_139705765370176: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370232: core_fifo_inputs_t;
        signal fifo_full_139705765370232: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370232: core_fifo_inputs_t;
        signal outputs_full_139705765370232: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370288: core_fifo_inputs_t;
        signal fifo_full_139705765370288: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370288: core_fifo_inputs_t;
        signal outputs_full_139705765370288: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370344: core_fifo_inputs_t;
        signal fifo_full_139705765370344: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370344: core_fifo_inputs_t;
        signal outputs_full_139705765370344: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370400: core_fifo_inputs_t;
        signal fifo_full_139705765370400: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370400: core_fifo_inputs_t;
        signal outputs_full_139705765370400: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370456: core_fifo_inputs_t;
        signal fifo_full_139705765370456: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370456: core_fifo_inputs_t;
        signal outputs_full_139705765370456: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370512: core_fifo_inputs_t;
        signal fifo_full_139705765370512: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370512: core_fifo_inputs_t;
        signal outputs_full_139705765370512: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370568: core_fifo_inputs_t;
        signal fifo_full_139705765370568: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370568: core_fifo_inputs_t;
        signal outputs_full_139705765370568: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370624: core_fifo_inputs_t;
        signal fifo_full_139705765370624: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370624: core_fifo_inputs_t;
        signal outputs_full_139705765370624: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370680: core_fifo_inputs_t;
        signal fifo_full_139705765370680: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370680: core_fifo_inputs_t;
        signal outputs_full_139705765370680: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370736: core_fifo_inputs_t;
        signal fifo_full_139705765370736: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370736: core_fifo_inputs_t;
        signal outputs_full_139705765370736: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370792: core_fifo_inputs_t;
        signal fifo_full_139705765370792: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370792: core_fifo_inputs_t;
        signal outputs_full_139705765370792: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370848: core_fifo_inputs_t;
        signal fifo_full_139705765370848: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370848: core_fifo_inputs_t;
        signal outputs_full_139705765370848: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370904: core_fifo_inputs_t;
        signal fifo_full_139705765370904: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370904: core_fifo_inputs_t;
        signal outputs_full_139705765370904: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765370960: core_fifo_inputs_t;
        signal fifo_full_139705765370960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765370960: core_fifo_inputs_t;
        signal outputs_full_139705765370960: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371016: core_fifo_inputs_t;
        signal fifo_full_139705765371016: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371016: core_fifo_inputs_t;
        signal outputs_full_139705765371016: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371072: core_fifo_inputs_t;
        signal fifo_full_139705765371072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371072: core_fifo_inputs_t;
        signal outputs_full_139705765371072: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371128: core_fifo_inputs_t;
        signal fifo_full_139705765371128: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371128: core_fifo_inputs_t;
        signal outputs_full_139705765371128: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371184: core_fifo_inputs_t;
        signal fifo_full_139705765371184: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371184: core_fifo_inputs_t;
        signal outputs_full_139705765371184: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371240: core_fifo_inputs_t;
        signal fifo_full_139705765371240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371240: core_fifo_inputs_t;
        signal outputs_full_139705765371240: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371296: core_fifo_inputs_t;
        signal fifo_full_139705765371296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371296: core_fifo_inputs_t;
        signal outputs_full_139705765371296: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371352: core_fifo_inputs_t;
        signal fifo_full_139705765371352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371352: core_fifo_inputs_t;
        signal outputs_full_139705765371352: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371408: core_fifo_inputs_t;
        signal fifo_full_139705765371408: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371408: core_fifo_inputs_t;
        signal outputs_full_139705765371408: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371464: core_fifo_inputs_t;
        signal fifo_full_139705765371464: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371464: core_fifo_inputs_t;
        signal outputs_full_139705765371464: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371520: core_fifo_inputs_t;
        signal fifo_full_139705765371520: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371520: core_fifo_inputs_t;
        signal outputs_full_139705765371520: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        
        signal fifo_inputs_139705765371576: core_fifo_inputs_t;
        signal fifo_full_139705765371576: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_139705765371576: core_fifo_inputs_t;
        signal outputs_full_139705765371576: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        

begin

        fifo_full <= fifo_full_139705765329160;
        fifo_inputs_139705765329160 <= fifo_inputs;
    
        fifo_inputs_139705765329104(0) <= outputs_139705765329160(0);
        outputs_full_139705765329160(0) <= fifo_full_139705765329104(0);
        
        fifo_inputs_139705765329328(0) <= outputs_139705765329104(0);
        outputs_full_139705765329104(0) <= fifo_full_139705765329328(0);
        
        fifo_inputs_139705765329272(0) <= outputs_139705765329328(0);
        outputs_full_139705765329328(0) <= fifo_full_139705765329272(0);
        
        fifo_inputs_139705765329384(0) <= outputs_139705765329272(0);
        outputs_full_139705765329272(0) <= fifo_full_139705765329384(0);
        
        fifo_inputs_139705765329440(0) <= outputs_139705765329384(0);
        outputs_full_139705765329384(0) <= fifo_full_139705765329440(0);
        
        fifo_inputs_139705765329496(0) <= outputs_139705765329440(0);
        outputs_full_139705765329440(0) <= fifo_full_139705765329496(0);
        
        fifo_inputs_139705765329552(0) <= outputs_139705765329496(0);
        outputs_full_139705765329496(0) <= fifo_full_139705765329552(0);
        
        fifo_inputs_139705765329608(0) <= outputs_139705765329552(0);
        outputs_full_139705765329552(0) <= fifo_full_139705765329608(0);
        
        fifo_inputs_139705765329664(0) <= outputs_139705765329608(0);
        outputs_full_139705765329608(0) <= fifo_full_139705765329664(0);
        
        fifo_inputs_139705765329216(0) <= outputs_139705765329664(0);
        outputs_full_139705765329664(0) <= fifo_full_139705765329216(0);
        
        fifo_inputs_139705765329720(0) <= outputs_139705765329216(0);
        outputs_full_139705765329216(0) <= fifo_full_139705765329720(0);
        
        fifo_inputs_139705765329776(0) <= outputs_139705765329720(0);
        outputs_full_139705765329720(0) <= fifo_full_139705765329776(0);
        
        fifo_inputs_139705765329832(0) <= outputs_139705765329776(0);
        outputs_full_139705765329776(0) <= fifo_full_139705765329832(0);
        
        fifo_inputs_139705765329888(0) <= outputs_139705765329832(0);
        outputs_full_139705765329832(0) <= fifo_full_139705765329888(0);
        
        fifo_inputs_139705765329944(0) <= outputs_139705765329888(0);
        outputs_full_139705765329888(0) <= fifo_full_139705765329944(0);
        
        fifo_inputs_139705765330000(0) <= outputs_139705765329944(0);
        outputs_full_139705765329944(0) <= fifo_full_139705765330000(0);
        
        fifo_inputs_139705765330056(0) <= outputs_139705765330000(0);
        outputs_full_139705765330000(0) <= fifo_full_139705765330056(0);
        
        fifo_inputs_139705765330112(0) <= outputs_139705765330056(0);
        outputs_full_139705765330056(0) <= fifo_full_139705765330112(0);
        
        fifo_inputs_139705765330168(0) <= outputs_139705765330112(0);
        outputs_full_139705765330112(0) <= fifo_full_139705765330168(0);
        
        fifo_inputs_139705765330224(0) <= outputs_139705765330168(0);
        outputs_full_139705765330168(0) <= fifo_full_139705765330224(0);
        
        fifo_inputs_139705765330280(0) <= outputs_139705765330224(0);
        outputs_full_139705765330224(0) <= fifo_full_139705765330280(0);
        
        fifo_inputs_139705765330336(0) <= outputs_139705765330280(0);
        outputs_full_139705765330280(0) <= fifo_full_139705765330336(0);
        
        fifo_inputs_139705765330392(0) <= outputs_139705765330336(0);
        outputs_full_139705765330336(0) <= fifo_full_139705765330392(0);
        
        fifo_inputs_139705765330448(0) <= outputs_139705765330392(0);
        outputs_full_139705765330392(0) <= fifo_full_139705765330448(0);
        
        fifo_inputs_139705765330504(0) <= outputs_139705765330448(0);
        outputs_full_139705765330448(0) <= fifo_full_139705765330504(0);
        
        fifo_inputs_139705765330560(0) <= outputs_139705765330504(0);
        outputs_full_139705765330504(0) <= fifo_full_139705765330560(0);
        
        fifo_inputs_139705765330616(0) <= outputs_139705765330560(0);
        outputs_full_139705765330560(0) <= fifo_full_139705765330616(0);
        
        fifo_inputs_139705765330672(0) <= outputs_139705765330616(0);
        outputs_full_139705765330616(0) <= fifo_full_139705765330672(0);
        
        fifo_inputs_139705765330728(0) <= outputs_139705765330672(0);
        outputs_full_139705765330672(0) <= fifo_full_139705765330728(0);
        
        fifo_inputs_139705765330784(0) <= outputs_139705765330728(0);
        outputs_full_139705765330728(0) <= fifo_full_139705765330784(0);
        
        fifo_inputs_139705765330840(0) <= outputs_139705765330784(0);
        outputs_full_139705765330784(0) <= fifo_full_139705765330840(0);
        
        fifo_inputs_139705765330896(0) <= outputs_139705765330840(0);
        outputs_full_139705765330840(0) <= fifo_full_139705765330896(0);
        
        fifo_inputs_139705765367880(0) <= outputs_139705765330896(0);
        outputs_full_139705765330896(0) <= fifo_full_139705765367880(0);
        
        fifo_inputs_139705765367936(0) <= outputs_139705765367880(0);
        outputs_full_139705765367880(0) <= fifo_full_139705765367936(0);
        
        fifo_inputs_139705765367992(0) <= outputs_139705765367936(0);
        outputs_full_139705765367936(0) <= fifo_full_139705765367992(0);
        
        fifo_inputs_139705765368048(0) <= outputs_139705765367992(0);
        outputs_full_139705765367992(0) <= fifo_full_139705765368048(0);
        
        fifo_inputs_139705765368104(0) <= outputs_139705765368048(0);
        outputs_full_139705765368048(0) <= fifo_full_139705765368104(0);
        
        fifo_inputs_139705765368160(0) <= outputs_139705765368104(0);
        outputs_full_139705765368104(0) <= fifo_full_139705765368160(0);
        
        fifo_inputs_139705765368216(0) <= outputs_139705765368160(0);
        outputs_full_139705765368160(0) <= fifo_full_139705765368216(0);
        
        fifo_inputs_139705765368272(0) <= outputs_139705765368216(0);
        outputs_full_139705765368216(0) <= fifo_full_139705765368272(0);
        
        fifo_inputs_139705765368328(0) <= outputs_139705765368272(0);
        outputs_full_139705765368272(0) <= fifo_full_139705765368328(0);
        
        fifo_inputs_139705765368384(0) <= outputs_139705765368328(0);
        outputs_full_139705765368328(0) <= fifo_full_139705765368384(0);
        
        fifo_inputs_139705765368440(0) <= outputs_139705765368384(0);
        outputs_full_139705765368384(0) <= fifo_full_139705765368440(0);
        
        fifo_inputs_139705765368496(0) <= outputs_139705765368440(0);
        outputs_full_139705765368440(0) <= fifo_full_139705765368496(0);
        
        fifo_inputs_139705765368552(0) <= outputs_139705765368496(0);
        outputs_full_139705765368496(0) <= fifo_full_139705765368552(0);
        
        fifo_inputs_139705765368608(0) <= outputs_139705765368552(0);
        outputs_full_139705765368552(0) <= fifo_full_139705765368608(0);
        
        fifo_inputs_139705765368664(0) <= outputs_139705765368608(0);
        outputs_full_139705765368608(0) <= fifo_full_139705765368664(0);
        
        fifo_inputs_139705765368720(0) <= outputs_139705765368664(0);
        outputs_full_139705765368664(0) <= fifo_full_139705765368720(0);
        
        fifo_inputs_139705765368776(0) <= outputs_139705765368720(0);
        outputs_full_139705765368720(0) <= fifo_full_139705765368776(0);
        
        fifo_inputs_139705765368832(0) <= outputs_139705765368776(0);
        outputs_full_139705765368776(0) <= fifo_full_139705765368832(0);
        
        fifo_inputs_139705765368888(0) <= outputs_139705765368832(0);
        outputs_full_139705765368832(0) <= fifo_full_139705765368888(0);
        
        fifo_inputs_139705765368944(0) <= outputs_139705765368888(0);
        outputs_full_139705765368888(0) <= fifo_full_139705765368944(0);
        
        fifo_inputs_139705765369000(0) <= outputs_139705765368944(0);
        outputs_full_139705765368944(0) <= fifo_full_139705765369000(0);
        
        fifo_inputs_139705765369056(0) <= outputs_139705765369000(0);
        outputs_full_139705765369000(0) <= fifo_full_139705765369056(0);
        
        fifo_inputs_139705765369112(0) <= outputs_139705765369056(0);
        outputs_full_139705765369056(0) <= fifo_full_139705765369112(0);
        
        fifo_inputs_139705765369168(0) <= outputs_139705765369112(0);
        outputs_full_139705765369112(0) <= fifo_full_139705765369168(0);
        
        fifo_inputs_139705765369224(0) <= outputs_139705765369168(0);
        outputs_full_139705765369168(0) <= fifo_full_139705765369224(0);
        
        fifo_inputs_139705765369280(0) <= outputs_139705765369224(0);
        outputs_full_139705765369224(0) <= fifo_full_139705765369280(0);
        
        fifo_inputs_139705765369336(0) <= outputs_139705765369280(0);
        outputs_full_139705765369280(0) <= fifo_full_139705765369336(0);
        
        fifo_inputs_139705765369392(0) <= outputs_139705765369336(0);
        outputs_full_139705765369336(0) <= fifo_full_139705765369392(0);
        
        fifo_inputs_139705765369448(0) <= outputs_139705765369392(0);
        outputs_full_139705765369392(0) <= fifo_full_139705765369448(0);
        
        fifo_inputs_139705765369504(0) <= outputs_139705765369448(0);
        outputs_full_139705765369448(0) <= fifo_full_139705765369504(0);
        
        fifo_inputs_139705765369560(0) <= outputs_139705765369504(0);
        outputs_full_139705765369504(0) <= fifo_full_139705765369560(0);
        
        fifo_inputs_139705765369616(0) <= outputs_139705765369560(0);
        outputs_full_139705765369560(0) <= fifo_full_139705765369616(0);
        
        fifo_inputs_139705765369672(0) <= outputs_139705765369616(0);
        outputs_full_139705765369616(0) <= fifo_full_139705765369672(0);
        
        fifo_inputs_139705765369728(0) <= outputs_139705765369672(0);
        outputs_full_139705765369672(0) <= fifo_full_139705765369728(0);
        
        fifo_inputs_139705765369784(0) <= outputs_139705765369728(0);
        outputs_full_139705765369728(0) <= fifo_full_139705765369784(0);
        
        fifo_inputs_139705765369840(0) <= outputs_139705765369784(0);
        outputs_full_139705765369784(0) <= fifo_full_139705765369840(0);
        
        fifo_inputs_139705765369896(0) <= outputs_139705765369840(0);
        outputs_full_139705765369840(0) <= fifo_full_139705765369896(0);
        
        fifo_inputs_139705765369952(0) <= outputs_139705765369896(0);
        outputs_full_139705765369896(0) <= fifo_full_139705765369952(0);
        
        fifo_inputs_139705765370008(0) <= outputs_139705765369952(0);
        outputs_full_139705765369952(0) <= fifo_full_139705765370008(0);
        
        fifo_inputs_139705765370064(0) <= outputs_139705765370008(0);
        outputs_full_139705765370008(0) <= fifo_full_139705765370064(0);
        
        fifo_inputs_139705765370120(0) <= outputs_139705765370064(0);
        outputs_full_139705765370064(0) <= fifo_full_139705765370120(0);
        
        fifo_inputs_139705765370176(0) <= outputs_139705765370120(0);
        outputs_full_139705765370120(0) <= fifo_full_139705765370176(0);
        
        fifo_inputs_139705765370232(0) <= outputs_139705765370176(0);
        outputs_full_139705765370176(0) <= fifo_full_139705765370232(0);
        
        fifo_inputs_139705765370288(0) <= outputs_139705765370232(0);
        outputs_full_139705765370232(0) <= fifo_full_139705765370288(0);
        
        fifo_inputs_139705765370344(0) <= outputs_139705765370288(0);
        outputs_full_139705765370288(0) <= fifo_full_139705765370344(0);
        
        fifo_inputs_139705765370400(0) <= outputs_139705765370344(0);
        outputs_full_139705765370344(0) <= fifo_full_139705765370400(0);
        
        fifo_inputs_139705765370456(0) <= outputs_139705765370400(0);
        outputs_full_139705765370400(0) <= fifo_full_139705765370456(0);
        
        fifo_inputs_139705765370512(0) <= outputs_139705765370456(0);
        outputs_full_139705765370456(0) <= fifo_full_139705765370512(0);
        
        fifo_inputs_139705765370568(0) <= outputs_139705765370512(0);
        outputs_full_139705765370512(0) <= fifo_full_139705765370568(0);
        
        fifo_inputs_139705765370624(0) <= outputs_139705765370568(0);
        outputs_full_139705765370568(0) <= fifo_full_139705765370624(0);
        
        fifo_inputs_139705765370680(0) <= outputs_139705765370624(0);
        outputs_full_139705765370624(0) <= fifo_full_139705765370680(0);
        
        fifo_inputs_139705765370736(0) <= outputs_139705765370680(0);
        outputs_full_139705765370680(0) <= fifo_full_139705765370736(0);
        
        fifo_inputs_139705765370792(0) <= outputs_139705765370736(0);
        outputs_full_139705765370736(0) <= fifo_full_139705765370792(0);
        
        fifo_inputs_139705765370848(0) <= outputs_139705765370792(0);
        outputs_full_139705765370792(0) <= fifo_full_139705765370848(0);
        
        fifo_inputs_139705765370904(0) <= outputs_139705765370848(0);
        outputs_full_139705765370848(0) <= fifo_full_139705765370904(0);
        
        fifo_inputs_139705765370960(0) <= outputs_139705765370904(0);
        outputs_full_139705765370904(0) <= fifo_full_139705765370960(0);
        
        fifo_inputs_139705765371016(0) <= outputs_139705765370960(0);
        outputs_full_139705765370960(0) <= fifo_full_139705765371016(0);
        
        fifo_inputs_139705765371072(0) <= outputs_139705765371016(0);
        outputs_full_139705765371016(0) <= fifo_full_139705765371072(0);
        
        fifo_inputs_139705765371128(0) <= outputs_139705765371072(0);
        outputs_full_139705765371072(0) <= fifo_full_139705765371128(0);
        
        fifo_inputs_139705765371184(0) <= outputs_139705765371128(0);
        outputs_full_139705765371128(0) <= fifo_full_139705765371184(0);
        
        fifo_inputs_139705765371240(0) <= outputs_139705765371184(0);
        outputs_full_139705765371184(0) <= fifo_full_139705765371240(0);
        
        fifo_inputs_139705765371296(0) <= outputs_139705765371240(0);
        outputs_full_139705765371240(0) <= fifo_full_139705765371296(0);
        
        fifo_inputs_139705765371352(0) <= outputs_139705765371296(0);
        outputs_full_139705765371296(0) <= fifo_full_139705765371352(0);
        
        fifo_inputs_139705765371408(0) <= outputs_139705765371352(0);
        outputs_full_139705765371352(0) <= fifo_full_139705765371408(0);
        
        fifo_inputs_139705765371464(0) <= outputs_139705765371408(0);
        outputs_full_139705765371408(0) <= fifo_full_139705765371464(0);
        
        fifo_inputs_139705765371520(0) <= outputs_139705765371464(0);
        outputs_full_139705765371464(0) <= fifo_full_139705765371520(0);
        
        fifo_inputs_139705765371576(0) <= outputs_139705765371520(0);
        outputs_full_139705765371520(0) <= fifo_full_139705765371576(0);
        
        outputs <= outputs_139705765371576;
        outputs_full_139705765371576 <= outputs_full;
    
        core_inst_139705765329160: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329160,
            fifo_full => fifo_full_139705765329160,
            outputs => outputs_139705765329160,
            outputs_full => outputs_full_139705765329160
        );
        
        core_inst_139705765329104: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329104,
            fifo_full => fifo_full_139705765329104,
            outputs => outputs_139705765329104,
            outputs_full => outputs_full_139705765329104
        );
        
        core_inst_139705765329328: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329328,
            fifo_full => fifo_full_139705765329328,
            outputs => outputs_139705765329328,
            outputs_full => outputs_full_139705765329328
        );
        
        core_inst_139705765329272: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329272,
            fifo_full => fifo_full_139705765329272,
            outputs => outputs_139705765329272,
            outputs_full => outputs_full_139705765329272
        );
        
        core_inst_139705765329384: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329384,
            fifo_full => fifo_full_139705765329384,
            outputs => outputs_139705765329384,
            outputs_full => outputs_full_139705765329384
        );
        
        core_inst_139705765329440: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329440,
            fifo_full => fifo_full_139705765329440,
            outputs => outputs_139705765329440,
            outputs_full => outputs_full_139705765329440
        );
        
        core_inst_139705765329496: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329496,
            fifo_full => fifo_full_139705765329496,
            outputs => outputs_139705765329496,
            outputs_full => outputs_full_139705765329496
        );
        
        core_inst_139705765329552: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329552,
            fifo_full => fifo_full_139705765329552,
            outputs => outputs_139705765329552,
            outputs_full => outputs_full_139705765329552
        );
        
        core_inst_139705765329608: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329608,
            fifo_full => fifo_full_139705765329608,
            outputs => outputs_139705765329608,
            outputs_full => outputs_full_139705765329608
        );
        
        core_inst_139705765329664: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329664,
            fifo_full => fifo_full_139705765329664,
            outputs => outputs_139705765329664,
            outputs_full => outputs_full_139705765329664
        );
        
        core_inst_139705765329216: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329216,
            fifo_full => fifo_full_139705765329216,
            outputs => outputs_139705765329216,
            outputs_full => outputs_full_139705765329216
        );
        
        core_inst_139705765329720: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329720,
            fifo_full => fifo_full_139705765329720,
            outputs => outputs_139705765329720,
            outputs_full => outputs_full_139705765329720
        );
        
        core_inst_139705765329776: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329776,
            fifo_full => fifo_full_139705765329776,
            outputs => outputs_139705765329776,
            outputs_full => outputs_full_139705765329776
        );
        
        core_inst_139705765329832: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329832,
            fifo_full => fifo_full_139705765329832,
            outputs => outputs_139705765329832,
            outputs_full => outputs_full_139705765329832
        );
        
        core_inst_139705765329888: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329888,
            fifo_full => fifo_full_139705765329888,
            outputs => outputs_139705765329888,
            outputs_full => outputs_full_139705765329888
        );
        
        core_inst_139705765329944: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765329944,
            fifo_full => fifo_full_139705765329944,
            outputs => outputs_139705765329944,
            outputs_full => outputs_full_139705765329944
        );
        
        core_inst_139705765330000: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330000,
            fifo_full => fifo_full_139705765330000,
            outputs => outputs_139705765330000,
            outputs_full => outputs_full_139705765330000
        );
        
        core_inst_139705765330056: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330056,
            fifo_full => fifo_full_139705765330056,
            outputs => outputs_139705765330056,
            outputs_full => outputs_full_139705765330056
        );
        
        core_inst_139705765330112: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330112,
            fifo_full => fifo_full_139705765330112,
            outputs => outputs_139705765330112,
            outputs_full => outputs_full_139705765330112
        );
        
        core_inst_139705765330168: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330168,
            fifo_full => fifo_full_139705765330168,
            outputs => outputs_139705765330168,
            outputs_full => outputs_full_139705765330168
        );
        
        core_inst_139705765330224: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330224,
            fifo_full => fifo_full_139705765330224,
            outputs => outputs_139705765330224,
            outputs_full => outputs_full_139705765330224
        );
        
        core_inst_139705765330280: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330280,
            fifo_full => fifo_full_139705765330280,
            outputs => outputs_139705765330280,
            outputs_full => outputs_full_139705765330280
        );
        
        core_inst_139705765330336: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330336,
            fifo_full => fifo_full_139705765330336,
            outputs => outputs_139705765330336,
            outputs_full => outputs_full_139705765330336
        );
        
        core_inst_139705765330392: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330392,
            fifo_full => fifo_full_139705765330392,
            outputs => outputs_139705765330392,
            outputs_full => outputs_full_139705765330392
        );
        
        core_inst_139705765330448: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330448,
            fifo_full => fifo_full_139705765330448,
            outputs => outputs_139705765330448,
            outputs_full => outputs_full_139705765330448
        );
        
        core_inst_139705765330504: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330504,
            fifo_full => fifo_full_139705765330504,
            outputs => outputs_139705765330504,
            outputs_full => outputs_full_139705765330504
        );
        
        core_inst_139705765330560: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330560,
            fifo_full => fifo_full_139705765330560,
            outputs => outputs_139705765330560,
            outputs_full => outputs_full_139705765330560
        );
        
        core_inst_139705765330616: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330616,
            fifo_full => fifo_full_139705765330616,
            outputs => outputs_139705765330616,
            outputs_full => outputs_full_139705765330616
        );
        
        core_inst_139705765330672: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330672,
            fifo_full => fifo_full_139705765330672,
            outputs => outputs_139705765330672,
            outputs_full => outputs_full_139705765330672
        );
        
        core_inst_139705765330728: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330728,
            fifo_full => fifo_full_139705765330728,
            outputs => outputs_139705765330728,
            outputs_full => outputs_full_139705765330728
        );
        
        core_inst_139705765330784: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330784,
            fifo_full => fifo_full_139705765330784,
            outputs => outputs_139705765330784,
            outputs_full => outputs_full_139705765330784
        );
        
        core_inst_139705765330840: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330840,
            fifo_full => fifo_full_139705765330840,
            outputs => outputs_139705765330840,
            outputs_full => outputs_full_139705765330840
        );
        
        core_inst_139705765330896: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765330896,
            fifo_full => fifo_full_139705765330896,
            outputs => outputs_139705765330896,
            outputs_full => outputs_full_139705765330896
        );
        
        core_inst_139705765367880: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765367880,
            fifo_full => fifo_full_139705765367880,
            outputs => outputs_139705765367880,
            outputs_full => outputs_full_139705765367880
        );
        
        core_inst_139705765367936: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765367936,
            fifo_full => fifo_full_139705765367936,
            outputs => outputs_139705765367936,
            outputs_full => outputs_full_139705765367936
        );
        
        core_inst_139705765367992: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765367992,
            fifo_full => fifo_full_139705765367992,
            outputs => outputs_139705765367992,
            outputs_full => outputs_full_139705765367992
        );
        
        core_inst_139705765368048: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368048,
            fifo_full => fifo_full_139705765368048,
            outputs => outputs_139705765368048,
            outputs_full => outputs_full_139705765368048
        );
        
        core_inst_139705765368104: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368104,
            fifo_full => fifo_full_139705765368104,
            outputs => outputs_139705765368104,
            outputs_full => outputs_full_139705765368104
        );
        
        core_inst_139705765368160: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368160,
            fifo_full => fifo_full_139705765368160,
            outputs => outputs_139705765368160,
            outputs_full => outputs_full_139705765368160
        );
        
        core_inst_139705765368216: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368216,
            fifo_full => fifo_full_139705765368216,
            outputs => outputs_139705765368216,
            outputs_full => outputs_full_139705765368216
        );
        
        core_inst_139705765368272: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368272,
            fifo_full => fifo_full_139705765368272,
            outputs => outputs_139705765368272,
            outputs_full => outputs_full_139705765368272
        );
        
        core_inst_139705765368328: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368328,
            fifo_full => fifo_full_139705765368328,
            outputs => outputs_139705765368328,
            outputs_full => outputs_full_139705765368328
        );
        
        core_inst_139705765368384: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368384,
            fifo_full => fifo_full_139705765368384,
            outputs => outputs_139705765368384,
            outputs_full => outputs_full_139705765368384
        );
        
        core_inst_139705765368440: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368440,
            fifo_full => fifo_full_139705765368440,
            outputs => outputs_139705765368440,
            outputs_full => outputs_full_139705765368440
        );
        
        core_inst_139705765368496: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368496,
            fifo_full => fifo_full_139705765368496,
            outputs => outputs_139705765368496,
            outputs_full => outputs_full_139705765368496
        );
        
        core_inst_139705765368552: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368552,
            fifo_full => fifo_full_139705765368552,
            outputs => outputs_139705765368552,
            outputs_full => outputs_full_139705765368552
        );
        
        core_inst_139705765368608: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368608,
            fifo_full => fifo_full_139705765368608,
            outputs => outputs_139705765368608,
            outputs_full => outputs_full_139705765368608
        );
        
        core_inst_139705765368664: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368664,
            fifo_full => fifo_full_139705765368664,
            outputs => outputs_139705765368664,
            outputs_full => outputs_full_139705765368664
        );
        
        core_inst_139705765368720: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368720,
            fifo_full => fifo_full_139705765368720,
            outputs => outputs_139705765368720,
            outputs_full => outputs_full_139705765368720
        );
        
        core_inst_139705765368776: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368776,
            fifo_full => fifo_full_139705765368776,
            outputs => outputs_139705765368776,
            outputs_full => outputs_full_139705765368776
        );
        
        core_inst_139705765368832: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368832,
            fifo_full => fifo_full_139705765368832,
            outputs => outputs_139705765368832,
            outputs_full => outputs_full_139705765368832
        );
        
        core_inst_139705765368888: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368888,
            fifo_full => fifo_full_139705765368888,
            outputs => outputs_139705765368888,
            outputs_full => outputs_full_139705765368888
        );
        
        core_inst_139705765368944: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765368944,
            fifo_full => fifo_full_139705765368944,
            outputs => outputs_139705765368944,
            outputs_full => outputs_full_139705765368944
        );
        
        core_inst_139705765369000: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369000,
            fifo_full => fifo_full_139705765369000,
            outputs => outputs_139705765369000,
            outputs_full => outputs_full_139705765369000
        );
        
        core_inst_139705765369056: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369056,
            fifo_full => fifo_full_139705765369056,
            outputs => outputs_139705765369056,
            outputs_full => outputs_full_139705765369056
        );
        
        core_inst_139705765369112: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369112,
            fifo_full => fifo_full_139705765369112,
            outputs => outputs_139705765369112,
            outputs_full => outputs_full_139705765369112
        );
        
        core_inst_139705765369168: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369168,
            fifo_full => fifo_full_139705765369168,
            outputs => outputs_139705765369168,
            outputs_full => outputs_full_139705765369168
        );
        
        core_inst_139705765369224: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369224,
            fifo_full => fifo_full_139705765369224,
            outputs => outputs_139705765369224,
            outputs_full => outputs_full_139705765369224
        );
        
        core_inst_139705765369280: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369280,
            fifo_full => fifo_full_139705765369280,
            outputs => outputs_139705765369280,
            outputs_full => outputs_full_139705765369280
        );
        
        core_inst_139705765369336: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369336,
            fifo_full => fifo_full_139705765369336,
            outputs => outputs_139705765369336,
            outputs_full => outputs_full_139705765369336
        );
        
        core_inst_139705765369392: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369392,
            fifo_full => fifo_full_139705765369392,
            outputs => outputs_139705765369392,
            outputs_full => outputs_full_139705765369392
        );
        
        core_inst_139705765369448: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369448,
            fifo_full => fifo_full_139705765369448,
            outputs => outputs_139705765369448,
            outputs_full => outputs_full_139705765369448
        );
        
        core_inst_139705765369504: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369504,
            fifo_full => fifo_full_139705765369504,
            outputs => outputs_139705765369504,
            outputs_full => outputs_full_139705765369504
        );
        
        core_inst_139705765369560: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369560,
            fifo_full => fifo_full_139705765369560,
            outputs => outputs_139705765369560,
            outputs_full => outputs_full_139705765369560
        );
        
        core_inst_139705765369616: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369616,
            fifo_full => fifo_full_139705765369616,
            outputs => outputs_139705765369616,
            outputs_full => outputs_full_139705765369616
        );
        
        core_inst_139705765369672: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369672,
            fifo_full => fifo_full_139705765369672,
            outputs => outputs_139705765369672,
            outputs_full => outputs_full_139705765369672
        );
        
        core_inst_139705765369728: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369728,
            fifo_full => fifo_full_139705765369728,
            outputs => outputs_139705765369728,
            outputs_full => outputs_full_139705765369728
        );
        
        core_inst_139705765369784: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369784,
            fifo_full => fifo_full_139705765369784,
            outputs => outputs_139705765369784,
            outputs_full => outputs_full_139705765369784
        );
        
        core_inst_139705765369840: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369840,
            fifo_full => fifo_full_139705765369840,
            outputs => outputs_139705765369840,
            outputs_full => outputs_full_139705765369840
        );
        
        core_inst_139705765369896: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369896,
            fifo_full => fifo_full_139705765369896,
            outputs => outputs_139705765369896,
            outputs_full => outputs_full_139705765369896
        );
        
        core_inst_139705765369952: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765369952,
            fifo_full => fifo_full_139705765369952,
            outputs => outputs_139705765369952,
            outputs_full => outputs_full_139705765369952
        );
        
        core_inst_139705765370008: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370008,
            fifo_full => fifo_full_139705765370008,
            outputs => outputs_139705765370008,
            outputs_full => outputs_full_139705765370008
        );
        
        core_inst_139705765370064: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370064,
            fifo_full => fifo_full_139705765370064,
            outputs => outputs_139705765370064,
            outputs_full => outputs_full_139705765370064
        );
        
        core_inst_139705765370120: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370120,
            fifo_full => fifo_full_139705765370120,
            outputs => outputs_139705765370120,
            outputs_full => outputs_full_139705765370120
        );
        
        core_inst_139705765370176: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370176,
            fifo_full => fifo_full_139705765370176,
            outputs => outputs_139705765370176,
            outputs_full => outputs_full_139705765370176
        );
        
        core_inst_139705765370232: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370232,
            fifo_full => fifo_full_139705765370232,
            outputs => outputs_139705765370232,
            outputs_full => outputs_full_139705765370232
        );
        
        core_inst_139705765370288: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370288,
            fifo_full => fifo_full_139705765370288,
            outputs => outputs_139705765370288,
            outputs_full => outputs_full_139705765370288
        );
        
        core_inst_139705765370344: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370344,
            fifo_full => fifo_full_139705765370344,
            outputs => outputs_139705765370344,
            outputs_full => outputs_full_139705765370344
        );
        
        core_inst_139705765370400: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370400,
            fifo_full => fifo_full_139705765370400,
            outputs => outputs_139705765370400,
            outputs_full => outputs_full_139705765370400
        );
        
        core_inst_139705765370456: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370456,
            fifo_full => fifo_full_139705765370456,
            outputs => outputs_139705765370456,
            outputs_full => outputs_full_139705765370456
        );
        
        core_inst_139705765370512: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370512,
            fifo_full => fifo_full_139705765370512,
            outputs => outputs_139705765370512,
            outputs_full => outputs_full_139705765370512
        );
        
        core_inst_139705765370568: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370568,
            fifo_full => fifo_full_139705765370568,
            outputs => outputs_139705765370568,
            outputs_full => outputs_full_139705765370568
        );
        
        core_inst_139705765370624: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370624,
            fifo_full => fifo_full_139705765370624,
            outputs => outputs_139705765370624,
            outputs_full => outputs_full_139705765370624
        );
        
        core_inst_139705765370680: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370680,
            fifo_full => fifo_full_139705765370680,
            outputs => outputs_139705765370680,
            outputs_full => outputs_full_139705765370680
        );
        
        core_inst_139705765370736: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370736,
            fifo_full => fifo_full_139705765370736,
            outputs => outputs_139705765370736,
            outputs_full => outputs_full_139705765370736
        );
        
        core_inst_139705765370792: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370792,
            fifo_full => fifo_full_139705765370792,
            outputs => outputs_139705765370792,
            outputs_full => outputs_full_139705765370792
        );
        
        core_inst_139705765370848: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370848,
            fifo_full => fifo_full_139705765370848,
            outputs => outputs_139705765370848,
            outputs_full => outputs_full_139705765370848
        );
        
        core_inst_139705765370904: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370904,
            fifo_full => fifo_full_139705765370904,
            outputs => outputs_139705765370904,
            outputs_full => outputs_full_139705765370904
        );
        
        core_inst_139705765370960: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765370960,
            fifo_full => fifo_full_139705765370960,
            outputs => outputs_139705765370960,
            outputs_full => outputs_full_139705765370960
        );
        
        core_inst_139705765371016: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371016,
            fifo_full => fifo_full_139705765371016,
            outputs => outputs_139705765371016,
            outputs_full => outputs_full_139705765371016
        );
        
        core_inst_139705765371072: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371072,
            fifo_full => fifo_full_139705765371072,
            outputs => outputs_139705765371072,
            outputs_full => outputs_full_139705765371072
        );
        
        core_inst_139705765371128: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371128,
            fifo_full => fifo_full_139705765371128,
            outputs => outputs_139705765371128,
            outputs_full => outputs_full_139705765371128
        );
        
        core_inst_139705765371184: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371184,
            fifo_full => fifo_full_139705765371184,
            outputs => outputs_139705765371184,
            outputs_full => outputs_full_139705765371184
        );
        
        core_inst_139705765371240: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371240,
            fifo_full => fifo_full_139705765371240,
            outputs => outputs_139705765371240,
            outputs_full => outputs_full_139705765371240
        );
        
        core_inst_139705765371296: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371296,
            fifo_full => fifo_full_139705765371296,
            outputs => outputs_139705765371296,
            outputs_full => outputs_full_139705765371296
        );
        
        core_inst_139705765371352: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371352,
            fifo_full => fifo_full_139705765371352,
            outputs => outputs_139705765371352,
            outputs_full => outputs_full_139705765371352
        );
        
        core_inst_139705765371408: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371408,
            fifo_full => fifo_full_139705765371408,
            outputs => outputs_139705765371408,
            outputs_full => outputs_full_139705765371408
        );
        
        core_inst_139705765371464: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371464,
            fifo_full => fifo_full_139705765371464,
            outputs => outputs_139705765371464,
            outputs_full => outputs_full_139705765371464
        );
        
        core_inst_139705765371520: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371520,
            fifo_full => fifo_full_139705765371520,
            outputs => outputs_139705765371520,
            outputs_full => outputs_full_139705765371520
        );
        
        core_inst_139705765371576: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_139705765371576,
            fifo_full => fifo_full_139705765371576,
            outputs => outputs_139705765371576,
            outputs_full => outputs_full_139705765371576
        );
        

end behav;

