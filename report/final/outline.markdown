
# Sea-of-CPUs

## Introduction

### Goals

### Metrics


## Background

### Instruction set architecture

- Register-register
- Register-memory
- Accumulator-register
    - Very inefficient for some simple things like `MOVAR R0, SUBA 1, MOVRA R0` instead of `SUBR 1 R0`
- Variable length execution

### FPGA based soft processors

### Digital signal processors

### Massively parallel processor arrays


## Design

### Process

### Core

#### Instruction set

#### Schematic


### Inter-core communication

#### Protocol

#### Arrangement/Topologies


## Implementation

### Tools

#### Build system

#### Assembler

#### Convenience scripts


### Core

### System


## Evaluation

- Branching data structure (binary trees)
- Routing
- FIR
- Compare with other soft-processors
- Drystone

### Correctness

### Performance

- Observed performance implications of optimizations (Hypothesis-experiment-result)


## Results

- Qualitative

### Core

#### Area

#### Performance


### System

#### Area

#### Performance


## Discussion

### Future work

- Direction
- Useful?

## Conclusion


## Biblography
