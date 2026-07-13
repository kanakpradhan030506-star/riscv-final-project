module instruction_memory(input [31:0] pc,output reg [31:0] instruction);
reg [31:0] memory[0:31];
integer i;
initial begin
    for(i = 0; i < 32; i = i + 1)
        memory[i] = 32'h00000013; // NOP instruction
    memory[0]  = 32'h00500093;   // addi x1,x0,5
    memory[1]  = 32'h00A00113;   // addi x2,x0,10
    memory[2]  = 32'h002081B3;   // add  x3,x1,x2
    memory[3]  = 32'h40110233;   // sub  x4,x2,x1
    memory[4]  = 32'h0020F2B3;   // and  x5,x1,x2
    memory[5]  = 32'h0020E333;   // or   x6,x1,x2
    memory[6]  = 32'h0020C3B3;   // xor  x7,x1,x2
    memory[7]  = 32'h00109433;   // sll  x8,  x1, x1
    memory[8]  = 32'h001154B3;   // srl  x9,  x2, x1
    memory[9]  = 32'h40115533;   // sra  x10, x2, x1
    memory[10] = 32'h0020A5B3;   // slt  x11, x1, x2
    memory[11] = 32'h0020B633;   // sltu x12, x1, x2
    memory[12] = 32'h00302023;   // sw  x3,0(x0)
    memory[13] = 32'h00002683;   // lw  x13,0(x0)
    memory[14] = 32'h12345737;   // lui x14,0x12345
    memory[15] = 32'h00000797;   // auipc x15,0
    memory[16] = 32'h00208463;  // beq x1,x2,beq_pass
    memory[17] = 32'h00629463;  // bne x5,x6,bne_pass
    memory[18] = 32'h00A4C463;  // blt x9,x10,blt_pass
    memory[19] = 32'h00E6D463;  // bge x13,x14,bge_pass
    memory[20] = 32'h0128E463;  // bltu x17,x18,bltu_pass
    memory[21] = 32'h016AF463;  // bgeu x21,x22,bgeu_pass
    memory[22] = 32'h00800CEF;  // jal x25,jal_target
    memory[23] = 32'h008E0EE7;  //jalr x29,x28,8
end
always @(*) begin
    if(pc[6:2] < 32)
        instruction = memory[pc[6:2]];
    else
        instruction = 32'h00000013;
end
endmodule