#!/usr/bin/env python
import argparse

class Output:

    def __init__(self, core, input_index):
        self.core = core
        self.input_index = input_index


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
        fifo_inputs_{out_core}({in_index}) <= outputs_{this}({out_index});
        outputs_full_{this}({out_index}) <= fifo_full_{out_core}({in_index});
        """

        str = ''
        for i, c in enumerate(self.out_cores):
            if c != None:
                str += out_template.format(in_index = c.input_index, out_index = i, this = id(self), out_core = id(c.core))

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


def to_vhdl(name, cores):
    template = """
library ieee;
use ieee.std_logic_1164.all;
use work.core_config.all;
use work.all;

entity {name} is
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
end {name};

architecture behav of {name} is

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

    return template.format(name = name, signal_decls = signal_decls, signal_cons = signal_cons, entities = entities)

def chain(length):
    cores = [ Core([]) for i in range(length) ]
    for i, c in enumerate(cores):
        if i != length-1:
            c.out_cores = [Output(cores[i+1], 0)]

    return cores

def bichain(length):
    cores = [ Core([None]*2) for i in range(length) ]
    for i, c in enumerate(cores):
        if i != length-1:
            c.out_cores[0] = Output(cores[i+1], 1)
        if i != 0:
            c.out_cores[1] = Output(cores[i-1], 0)

    return cores

def grid(dim):
    cores = [ [ Core([None]*4) for i in range(dim) ] for j in range(dim) ]

    for j in range(dim):
        for i in range(dim):
            c = cores[j][i]
            if i + 1 < dim:
                c.out_cores[0] = Output(cores[j][i+1], 1)
            if i - 1 >= 0:
                c.out_cores[1] = Output(cores[j][i-1], 0)
            if j + 1 < dim:
                c.out_cores[2] = Output(cores[j+1][i], 3)
            if j - 1 >= 0:
                c.out_cores[3] = Output(cores[j-1][i], 2)

    return [ c for row in cores for c in row]

def cube(dim):
    cores = [ [ [ Core([None]*6) for i in range(dim) ] for j in range(dim) ] for k in range(dim) ]

    for j in range(dim):
        for i in range(dim):
            for k in range(dim):
                c = cores[k][j][i]
                if i + 1 < dim:
                    c.out_cores[0] = Output(cores[k][j][i+1], 1)
                if i - 1 >= 0:
                    c.out_cores[1] = Output(cores[k][j][i-1], 0)
                if j + 1 < dim:
                    c.out_cores[2] = Output(cores[k][j+1][i], 3)
                if j - 1 >= 0:
                    c.out_cores[3] = Output(cores[k][j-1][i], 2)
                if k + 1 < dim:
                    c.out_cores[4] = Output(cores[k+1][j][i], 5)
                if k - 1 >= 0:
                    c.out_cores[5] = Output(cores[k-1][j][i], 4)

    return [ c for layer in cores for row in layer for c in row ]

def main():
    parser = argparse.ArgumentParser(prog = 'mkarray')
    parser.add_argument('type', choices=['chain', 'bichain', 'grid', 'cube'])
    parser.add_argument('size', type=int)
    args = parser.parse_args()

    if args.type == 'chain':
        print(to_vhdl('Chain{}'.format(args.size), chain(args.size)))
    elif args.type == 'bichain':
        print(to_vhdl('Bichain{}'.format(args.size), bichain(args.size)))
    elif args.type == 'grid':
        print(to_vhdl('Grid{}'.format(args.size), grid(args.size)))
    elif args.type == 'cube':
        print(to_vhdl('Cube{}'.format(args.size), cube(args.size)))


if __name__ == "__main__":
    main()

