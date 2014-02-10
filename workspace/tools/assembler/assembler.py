#!/usr/bin/env python
import argparse
import os
import re

class OperandError(Exception):
    def __init__(self, message):
        super(OperandError, self).__init__(message)
        self.message = message

def fail(error, line, num, msg=''):
    print("{} error on line {}: '{}'".format(error, num, line))
    if msg:
        print(msg)
    exit()

def to_binary(num, length):
    return '{0:b}'.format(num).zfill(length)

def encode_argument(arg, length):
    if arg[0] == 'R':
        return to_binary(int(arg[1:]), length)
    else:
        return to_binary(int(arg), length)

def is_label(word):
    return re.search(r'^\w+:$', word)

def strip_comment(line):
    try:
        return line[:line.index(';')]
    except ValueError:
        return line

# Takes an assembly program as text and returns a list of assembly lines
# without comments or unnecessary whitespace.
def asm_lines(text):
    asm = []
    for line in text:
        ws_less = ' '.join(strip_comment(line).upper().split())
        if ws_less:
            asm.append(ws_less)
    return asm

# Returns a bit string encoded machine instruction.
def encode(instr, opcodes):
    op = opcodes[instr[0]]

    if len(instr) == 2:
        arg = instr[1]
        return op + encode_argument(arg, 12)
    elif len(instr) == 3:
        data1 = encode_argument(instr[1], 6)
        data2 = encode_argument(instr[2], 6)
        return op + data1 + data2
    else:
        raise OperandError('Too many operands.')

# Parse instruction set definition and produce a dictionary of opcodes.
def parse_opcodes(filename):
    opcodes = {}
    with open(filename) as text:
        i = 0
        for line in text:
            words = line.split()
            mnemonic = words[0].upper()
            opcodes[mnemonic] = to_binary(i, 6)
            i = i + 1
    return opcodes

# Prints the machine code as an array in a vhdl package.
def output_vhdl(filename, machine_code):
    package = os.path.basename(os.path.splitext(filename)[0])

    print('-- Generated by assembler from {}'.format(os.path.basename(filename)))
    print('library work;')
    print('use work.core_interface.all;')
    print()
    print('package {} is'.format(package))
    print()
    print('    type program is array (0 to {}) of word;'.format(len(machine_code) - 1))
    print('    constant {}_code: program := {{'.format(package))
    print('        {}'.format(',\n        '.join(machine_code)))
    print('    };')
    print()
    print('end package {};'.format(package))

def main():
    parser = argparse.ArgumentParser(prog = 'assembler')
    parser.add_argument('opcodes')
    parser.add_argument('assembly_code')
    args = parser.parse_args()

    opcodes = parse_opcodes(args.opcodes)

    machine_instructions = []
    labels = dict()

    # Parse assembly code and produce machine instructions.
    with open(args.assembly_code) as text:
        asm = asm_lines(text)
        i = 1
        for line in asm:
            tokens = line.split()
            if is_label(tokens[0]):
                # Record label
                labels[tokens[0][:-1]] = i-len(labels)
                tokens = tokens[1:]
            if tokens:
                # Line contains an instruction
                try:
                    instr = encode(tokens, opcodes)
                except KeyError:
                    fail('Instruction', line, i)
                except OperandError as msg:
                    fail('Operand', line, i, msg)

                machine_instructions.append('"{}"'.format(instr))

            i = i + 1

    output_vhdl(args.assembly_code, machine_instructions)

if __name__ == "__main__":
    main()
