# Sea-of-CPUs

## Automated testing

All vhdl files in the test directory can be automatically built and executed
using make.

1. Setup the necessary environmental variables:

    $ source ./tools/setup.sh

2. Build and execute all tests:

    $ make sim/failures

## Source directories

### doc

Contains documentation such as diagrams of the hardware, definitions of the
instruction set and example assembly.

### sim

Contains automatically created simulation sources and reports.

### src

Contains all hardware sources.

### test

Contains all testbench sources.

### tools

Contains various tools relating to the hardware such as the assembler and helper
scripts for creating the simulations.
