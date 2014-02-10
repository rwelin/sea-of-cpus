# Sea-of-CPUs

## Test design pattern

The design pattern used for writing testbenches for an entity is the following:

1. Define a record containing:
    - all the inputs to the entity
    - all the outputs generated from these inputs
    - a delay in cycles from the point when the inputs are set until the output
      is tested

2. Define an array type of this record.

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
