# Single Cycle RISC-V Processor (Verilog)

A basic 32-bit Single Cycle RISC-V Processor designed in Verilog HDL by integrating core processor components and simulating instruction execution in a single clock cycle architecture.

## Features

- 32-bit ALU for arithmetic and logic operations
- Register File with 32 registers
- Program Counter (PC) for instruction sequencing
- Instruction Memory for instruction fetch
- Data Memory for load or store operations
- Complete RISC-V Instruction Decoder
- Control Signal Generator
- ALU Control Unit
- Top Module Integration of all processor blocks
- Simulation and waveform verification

## Supported Instruction Types

- R-Type (ADD, SUB, AND, OR)
- I-Type (ADDI)
- S-Type (Store Word)
- B-Type (Branch decode support)

## Project Structure

SINGLE-CYCLE-RISCV-PROCESSOR/
│── design/
│── testbench/
│── waveform/
│── docs/
└── README.md

## Tools Used
Verilog HDL
VS Code
EDA Playground
GTKWave for waveform analysis

## Future Improvements
Branch execution logic
Zero flag generation
PC branch update logic
Full instruction set support