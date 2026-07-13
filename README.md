# RV32I Single-Cycle RISC-V Processor

A 32-bit Single-Cycle RISC-V (RV32I) Processor designed in Verilog HDL. This processor executes one instruction per clock cycle and implements the core RV32I instruction set using a modular RTL architecture.
<img width="1840" height="882" alt="riscv-1" src="https://github.com/user-attachments/assets/c6c681b6-fc4c-40b2-97e5-af1069c6de8d" />
<img width="1832" height="897" alt="riscv-2" src="https://github.com/user-attachments/assets/31e9b393-c7a8-41f1-a9dd-336dad24d5be" />
<img width="1822" height="886" alt="riscv-3" src="https://github.com/user-attachments/assets/9c380619-7d83-40be-80d7-fbdeb6df5873" />
<img width="1817" height="167" alt="riscv-4" src="https://github.com/user-attachments/assets/51b3f4ec-dea5-4b5c-86fb-c0d0f40f67b7" />

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
