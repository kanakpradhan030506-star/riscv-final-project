module control_signal_generator(input [6:0] opcode,output reg reg_write,output reg mem_read,output reg mem_write,output reg alu_src,output reg branch,
output reg jalr,output reg jump,output reg [2:0] alu_op);
always @(*) begin

reg_write = 0;
mem_read = 0;
mem_write = 0;
alu_src = 0;
branch = 0;
alu_op = 3'b000;
jalr =0;
jump =0;

case(opcode)
7'b0110011: begin//R TYPE
    reg_write = 1;
    alu_src = 0;
    alu_op = 3'b010;
end
7'b0010011: begin//I TYPE
    reg_write = 1;
    alu_src = 1;
    alu_op = 3'b011;
end
7'b0000011: begin// lw
    reg_write = 1;
    mem_read = 1;
    alu_src = 1;
    alu_op = 3'b000;
end
7'b0100011: begin// sw
    mem_write = 1;
    alu_src = 1;
    alu_op = 3'b000;
end
7'b1100011: begin// beq , bne , blt , bge , bltu , bgeu
    branch = 1;
    alu_src = 0;
    alu_op = 3'b001;
end
 7'b1100111:begin //jalr
    reg_write =1;
    alu_src =1;
    alu_op = 3'b000;
    jalr =1;
end
7'b1101111:begin //jal
    reg_write =1;
    jump =1;
end
7'b0110111:begin //lui
    reg_write =1;
    alu_src =1;
    alu_op = 3'b100;
end
7'b0010111:begin //auipc
    reg_write =1;
    alu_src =1;
    alu_op = 3'b000;
end
endcase
end
endmodule