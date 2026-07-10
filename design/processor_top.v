module processor_top(input clk, input reset);

wire [31:0] pc;
wire [31:0] instruction;
wire [31:0] immediate;
wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire branch;
wire jump;
wire jalr;
wire[6:0] opcode;
wire [2:0] func3;
wire [6:0] func7;
wire [4:0] source_reg_1;
wire [4:0] source_reg_2;
wire [4:0] destination_reg;
wire [2:0] alu_op;
wire [3:0] alu_sel;
wire [31:0] mem_write_data;
wire [31:0] reg_write_data;
wire [31:0] next_pc;
wire [31:0] pc_plus4;
wire [31:0] branch_target;
wire [31:0] jalr_target;
wire zero ;
wire branch_taken;
wire beq;
wire bne;
wire blt;
wire bge;
wire bltu;
wire bgeu;
wire [31:0]A;
wire [31:0] B;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] result;
wire [31:0] read_data;
wire [31:0] address;
 
assign beq = (A == B);
assign bne = (A != B);
assign blt = ($signed(A) < $signed(B));
assign bge = ($signed(A) >= $signed(B));
assign bltu = (A < B);
assign bgeu = (A >= B);

assign branch_target = pc + immediate;
assign pc_plus4 = pc + 32'b4;
assign jalr_target = read_data1 + immediate;

assign A = read_data1;
assign B = (alu_src) ? immediate : read_data2;

assign address = result;
assign mem_write_data = read_data2;

assign reg_write_data = (jump || jalr) ? pc_plus4: (opcode == 7'b0010111) ? pc + immediate: (mem_read) ? read_data : result;

assign next_pc = jalr ? ( jalr_target & 32'hFFFFFFFE):
 jump ? branch_target :
  branch_taken ? branch_target :
  pc_plus4;

assign branch_taken = (branch &&(func3 == 3'b000)) ? beq:
(branch &&(func3 == 3'b001)) ? bne:
(branch &&(func3 == 3'b100)) ? blt:
(branch &&(func3 == 3'b101)) ? bge:
(branch &&(func3 == 3'b110)) ? bltu:
(branch &&(func3 == 3'b111)) ? bgeu:
1'b0;

program_counter pc1(.clk(clk),.reset(reset),.next_pc(next_pc),.pc(pc));

instruction_memory im1(.pc(pc),.instruction(instruction));

complete_riscv_decoder crd(.instruction(instruction),.opcode(opcode),.destination_reg(destination_reg),.func3(func3),.source_reg_1(source_reg_1),.source_reg_2(source_reg_2),.func7(func7),.immediate(immediate));

register_file rf1(.clk(clk),.reg_write(reg_write),.source_reg_1(source_reg_1),.source_reg_2(source_reg_2),.destination_reg(destination_reg),.write_data(reg_write_data),.read_data1(read_data1),.read_data2(read_data2));

alu_control ac1(.alu_op(alu_op),.func3(func3), .func7(func7),.alu_sel(alu_sel));

data_memory dm1(.clk(clk),.mem_read(mem_read),.mem_write(mem_write),.write_data(mem_write_data),.address(address),.read_data(read_data));
                                                                              
 alu_32bit alu1(.A(A) ,.B(B) ,.alu_sel(alu_sel) ,.result(result),.zero(zero));
  
 control_signal_generator csg(.opcode(opcode),.reg_write(reg_write),.mem_read(mem_read),.mem_write(mem_write),.alu_src(alu_src),.branch(branch),.jump(jump), .jalr(jalr) ,.alu_op(alu_op));
  
  endmodule