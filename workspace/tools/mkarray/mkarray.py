#!/usr/bin/env python

class Core:

    def __init__(self, out_cores):
        self.out_cores = out_cores


    def entity(self):
        template = """
        core_inst_{this}: entity Core
        port map (
            clk => clk,
            clk_en => clk_en,
            reset => reset,
            addr => addr,
            data => data,
            we => we,
            fifo_inputs => fifo_inputs_{this},
            fifo_full => fifo_full_{this},
            outputs => outputs_{this},
            outputs_full => outputs_full_{this}
        );
        """
        return template.format(this = id(self))


    def signal_decl(self):
        template = """
        signal fifo_inputs_{this}: core_fifo_inputs_t;
        signal fifo_full_{this}: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        signal outputs_{this}: core_fifo_inputs_t;
        signal outputs_full_{this}: std_logic_vector(0 to NUM_CORE_FIFOS-1);
        """
        return template.format(this = id(self))


    def signal_cons(self):

        out_template = """
        fifo_inputs_{out_core}({index}) <= outputs_{this}({index});
        outputs_full_{this}({index}) <= fifo_full_{out_core}({index});
        """

        str = ''
        for i, c in enumerate(self.out_cores):
            str += out_template.format(index = i, this = id(self), out_core = id(c))

        return str


    def as_input(self):
        template = """
        fifo_inputs_{this}({index}) <= fifo_inputs;
        fifo_full <= fifo_full_{this};
        """
        return template.format(this = id(self))


    def as_output(self):
        template = """
        outputs <= outputs_{this};
        outputs_full_{this} <= outputs_full;
        """
        return template.format(this = id(self))


def to_vhdl(cores):
    template = """
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity Chain is
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
end Chain;

architecture behav of Chain is

    constant num_cores: integer := 1;

    {signal_decls}

begin

    {signal_cons}

    {entities}

end behav;
"""

    signal_decls = ''
    signal_cons = ''
    entities = ''
    for c in cores:
        signal_decls += c.signal_decl()
        signal_cons += c.signal_cons()
        entities += c.entity()

    return template.format(signal_decls = signal_decls, signal_cons = signal_cons, entities = entities)

def chain(length):
    cores = [ Core([]) for i in range(length) ]
    for i, c in enumerate(cores):
        if i != 0:
            c.in_cores = [cores[i-1]]
        if i != length-1:
            c.out_cores = [cores[i+1]]

    return cores

def grid(dim):
    cores = [ [ Core([]) for i in range(dim) ] for j in range(dim) ]

    for j in range(dim):
        for i in range(dim):
            c = cores[j][i]
            if j + 1 < dim:
                c.out_cores += [cores[j+1][i]]
            if i + 1 < dim:
                c.out_cores += [cores[j][i+1]]
            if j - 1 >= 0:
                c.out_cores += [cores[j-1][i]]
            if i - 1 >= 0:
                c.out_cores += [cores[j][i-1]]

    return [ c for row in cores for c in row]


def main():

    print(to_vhdl(chain(100)))
    #print(to_vhdl(grid(2)))

if __name__ == "__main__":
    main()

