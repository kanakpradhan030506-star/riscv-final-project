# RV32I Single-Cycle RISC-V Processor

A 32-bit Single-Cycle RISC-V (RV32I) Processor designed in Verilog HDL. This processor executes one instruction per clock cycle and implements the core RV32I instruction set using a modular RTL architecture.

## Features

- 32-bit RV32I Processor
- Single-Cycle Datapath
- Modular Verilog Design
- Synthesizable RTL
- Functional Simulation using EDA Playground

## Supported Instructions
### Arithmetic
- ADD, SUB, ADDI
### Logical
- AND, OR, XOR
### Shift
- SLL, SRL, SRA
### Comparison
- SLT, SLTU
### Memory
- LW, SW
### Control Flow
- BEQ, BNE, BLT, BGE, BLTU, BGEU
- JAL, JALR
### Upper Immediate
- LUI, AUIPC
## Project Modules

- Program Counter
- Instruction Memory
- Control Unit
- Register File
- Immediate Generator
- ALU Control
- 32-bit ALU
- Data Memory
- Processor Top
- Testbench

## Verification

The processor has been functionally verified through simulation with waveform analysis, validating arithmetic, memory, branch, jump, and write-back operations.

## Future Work

- Five-stage Pipeline
- Hazard Detection & Forwarding
- Branch Prediction
- FPGA Implementation


## Author

**Kanak Pradhan**  
B.Tech Electronics Engineering, YCCE Nagpur