#!/usr/bin/env python
import argparse
import os
import re

class Port:
    def __init__(self, name='', direction='', port_type=''):
        self.direction = direction
        self.name = name
        self.port_type = port_type

    def __repr__(self):
        return 'Port({}, {}, {})'.format(self.direction, self.name, self.port_type)

class Entity:
    def __init__(self, name='', ports=[]):
        self.name = name
        self.ports = ports

def assert_string(port):
    return """            assert {} = test_data(i).{}
            report "Test " & integer'image(i) & ":" &
                " read_a is " & to_string({}) &
                " should be " & to_string(test_data(i).{})
            severity failure;\n""".format(port, port, port, port)

# Prints the machine code as an array in a vhdl package.
def output_vhdl(filename, entity):

    print('-- Template generated by mktest from {}'.format(filename))
    print('library ieee;')
    print('use ieee.std_logic_1164.all;')
    print('use work.{};'.format(entity.name))
    print('use work.core_config.all;')
    print('use work.test.all;')
    print()
    print('entity {}Test is'.format(entity.name))
    print('end entity {}Test;'.format(entity.name))
    print()
    print('architecture behav of {}Test is'.format(entity.name))
    for p in entity.ports:
        print('    signal {}: {};'.format(p.name, p.port_type))
    print()
    print('    type TestData is')
    print('        record')
    for p in entity.ports:
        if p.name != 'clk':
            print('            {}: {};'.format(p.name, p.port_type))
    print('            wait_cycles: integer;')
    print('        end record;')
    print()
    print('    type TestDataArray is array (0 to 0) of TestData;'.format(len(entity.ports)+1))
    print('    constant test_data: TestDataArray := (')
    print('        -- Insert test data here')
    print('    );')
    print()
    print('begin')
    print()
    print('    clk_gen: process')
    print('    begin')
    print("        clk <= '1';")
    print('        wait for 50 ns;')
    print("        clk <= '0';")
    print('        wait for 50 ns;')
    print('    end process clk_gen;')
    print()
    print('    {}_inst: entity {}'.format(entity.name, entity.name))
    print('    port map (')
    port_names = [ p.name for p in entity.ports ]
    port_maps = [ '{} => {}'.format(n, n) for n in port_names ]
    print('        {}'.format(',\n        '.join(port_maps)))
    print('    );')
    print()
    print('    {}_test: process'.format(entity.name))
    print('    begin')
    print("        wait until clk'event and clk = '1';")
    print()
    print("        for i in test_data'range loop")
    print()
    for p in entity.ports:
        if p.direction == 'in' and p.name != 'clk':
            print('            {} <= test_data(i).{};'.format(p.name, p.name))
    print()
    print('            wait_for(test_data(i).wait_cycles, clk);')
    print()
    for p in entity.ports:
        if p.direction == 'out':
            print(assert_string(p.name))
    print('        end loop;')
    print()
    print('        report "DONE" severity failure;')
    print('    end process {}_test;'.format(entity.name))
    print()
    print('end architecture behav;')

def parse_port(text):
    port_re = '\A\w+\s*:\s*(in|out)\s+\w+'
    regex = re.compile(port_re)
    match = regex.match(text)
    if match:
        words = match.group(0).replace(':', '').split()
        return Port(words[0], words[1], words[2])

def main():
    parser = argparse.ArgumentParser(prog = 'mktest')
    parser.add_argument('vhdl_file')
    args = parser.parse_args()

    entity = Entity()

    with open(args.vhdl_file) as text:
        in_entity = False
        for line in text:
            line = line.strip()
            if line.startswith('entity '):
                in_entity = True
                entity.name = line.split()[1]
            elif line.startswith('end entity '):
                break
            elif in_entity:
                port = parse_port(line)
                if port:
                    entity.ports.append(port)

    output_vhdl(args.vhdl_file, entity)

if __name__ == "__main__":
    main()