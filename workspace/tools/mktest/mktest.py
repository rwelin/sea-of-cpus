#!/usr/bin/env python
import argparse
import os
import re
import string

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
    """Return a vhdl equality assertion with a helpful message from a entity port name."""
    return string.Template("""assert ${port} = test_data(i).${port}
            report "Test " & integer'image(i) & ":" &
                " `${port}' is " & to_string(${port}) &
                " should be " & to_string(test_data(i).${port})
            severity failure;""").substitute(dict(port = port))

def signals(ports):
    """Return signal declarations from a list of ports."""
    return '\n    '.join([ 'signal {}: {};'.format(p.name, p.port_type) for p in ports ])

def record_fields(ports):
    """Return a record field list from a list of ports. `clk' port is excluded."""
    non_clk_ports = filter(lambda p: p.name != 'clk', ports)
    fields = [ '{}: {};'.format(p.name, p.port_type) for p in non_clk_ports]
    return '\n            '.join(fields)

def port_map(ports):
    """Return port map list from a list of ports."""
    port_names = [ p.name for p in ports ]
    port_maps = [ '{} => {}'.format(n, n) for n in port_names ]
    return ',\n        '.join(port_maps)

def test_input_assignments(ports):
    """Return input assignment statements from a list of ports."""
    inputs = filter(lambda p: p.direction == 'in' and p.name != 'clk', ports)
    assignments = [ '{} <= test_data(i).{};'.format(p.name, p.name) for p in inputs ]
    return '\n            '.join(assignments)

def output_asserts(ports):
    """Return output assert statements from a list of ports."""
    outputs = filter(lambda p: p.direction == 'out', ports)
    asserts = [ assert_string(p.name) for p in outputs ]
    return '\n\n            '.join(asserts)

def vhdl_entity_test_stub(template, filename, entity):
    """Return test stub from a testbench template and a vhdl entity."""
    d = dict()
    d['filename'] = filename
    d['entity_name'] = entity.name
    d['signals'] = signals(entity.ports)
    d['record_fields'] = record_fields(entity.ports)
    d['port_map'] = port_map(entity.ports)
    d['input_assignments'] = test_input_assignments(entity.ports)
    d['output_asserts'] = output_asserts(entity.ports)
    return string.Template(template).substitute(d)

def parse_port(text):
    """Return a Port from a line of vhdl."""
    port_re = '\A\w+\s*:\s*(in|out)\s+\w+[^;]*'
    regex = re.compile(port_re)
    match = regex.match(text)
    if match:
        words = match.group(0).replace(':', '').split()
        return Port(words[0], words[1], ' '.join(words[2:]))

def main():
    parser = argparse.ArgumentParser(prog = 'mktest')
    parser.add_argument('vhdl_entity_file')
    parser.add_argument('testbench_template')
    args = parser.parse_args()

    entity = Entity()

    with open(args.vhdl_entity_file) as text:
        in_entity = False
        for line in text:
            line = line.strip()
            if line.startswith('entity '):
                in_entity = True
                entity.name = line.split()[1]
            elif line.startswith('end '):
                break
            elif in_entity:
                port = parse_port(line)
                if port:
                    entity.ports.append(port)

    with open(args.testbench_template) as template:
        print(vhdl_entity_test_stub(template.read(), args.vhdl_entity_file, entity))

if __name__ == "__main__":
    main()
