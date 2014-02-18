# Sea-of-CPUs

## Testing

In order to efficiently test components the Sea-of-CPUs uses a testing framework
that allows for automatic testbench stub generation and automatic compilation
and simulation of the tests.

### Writing tests

Writing well structured simulations in VHDL requires a lot of boilerplate code
which instantiates the entity to be tested and performs asserts over some test
data. Below is a description of the design pattern used for writing tests and a
tool that can generate testbench stubs automatically.

#### Test design pattern

The design pattern used for writing testbenches for an entity is the following:

1. Define a record containing:
    - a clock signal
    - all the inputs to the entity (except for clock)
    - all the outputs generated from these inputs
    - a delay in cycles from the point when the inputs are set until the output
      is tested

2. Define an array type of this record. For example:

    type TestRecordArray is array (0 to N) of TestRecord;

3. Define an array constant containing all the test data in the form:

    constant test_data: TestRecordArray := (
        0 => -- comment explaining the desired result
            (inputs...,
             outputs..., delay),
        1 => ...
    );

4. Define a process containing a for loop that iterates over the range of the
   test data and
    - sets the inputs of the entity to be tested
    - delays for the number of cycles specified in the test data
    - asserts some conditions and reports the iteration number on failure
      in order to indicate which test that failed.

#### Automatic testbench stub generation

The `tools/mktest/mktest.py` script generates a testbench stub from a vhdl
entity. By using this tool the boilerplate for the test design pattern is
automatically generated.

### Automated simulation

All vhdl files in the test directory can be automatically built and executed
using make. This allows for making changes to vhdl sources and re-executing the
relevant testbenches with a single shell command.

#### Run all tests

1. Setup the necessary environmental variables (this only has to be done once in
   the current shell):

    $ source ./tools/setup.sh

2. Build and execute all tests:

    $ make sim/failures

#### Run specific tests

1. Create the simulation directory for and the makefile for a testbench
   `test/EntetyTest.vhd`:

    $ make sim/EntityTest/makefile

2. Move into the simulation directory:

    $ cd sim/EntityTest

3. Run the simulation. The following command generates the simulation executable
   and runs the simulation until completion or failure and outputs the log to
   `isim.log`:

    $ make isim.log

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
