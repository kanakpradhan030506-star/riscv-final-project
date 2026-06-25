module processor_top(input clk, input reset);
wire [31:0] instruction;
wire [31:0] immediate;
wire [31:0] result;
wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire branch;
wire [31:0] pc;
wire [6:0] opcode;
wire [4:0] destination_reg;
wire [2:0] func3;
wire [4:0] source_reg_1;
wire [4:0] source_reg_2;
wire [6:0] func7;
wire [1:0] alu_op;
wire [2:0] alu_sel;
wire [31:0] A;
wire [31:0] B;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] address;
wire [31:0] read_data;
wire [31:0] mem_write_data;
wire [31:0] reg_write_data;
  
assign A = read_data1;

assign B = (alu_src) ? immediate : read_data2;

assign address = result;

assign mem_write_data = read_data2;

assign reg_write_data = (mem_read) ? read_data : result;

program_counter pc1(.clk(clk),.reset(reset),.pc(pc));

  instruction_memory im1(.pc(pc),.instruction(instruction));

complete_riscv_decoder crd(.instruction(instruction),.opcode(opcode),.destination_reg(destination_reg),.func3(func3),.source_reg_1(source_reg_1),.source_reg_2(source_reg_2),.func7(func7),.immediate(immediate));

register_file rf1(.clk(clk),.reg_write(reg_write),.source_reg_1(source_reg_1),.source_reg_2(source_reg_2),.destination_reg(destination_reg),.write_data(reg_write_data),.read_data1(read_data1),.read_data2(read_data2));

alu_control ac1(.alu_op(alu_op),.func3(func3), .func7(func7),.alu_sel(alu_sel));

data_memory dm1(.clk(clk),.mem_read(mem_read),.mem_write(mem_write),.write_data(mem_write_data),.address(address),.read_data(read_data));
                                                                              
 alu_32bit alu1(.A(A) ,.B(B) ,.alu_sel(alu_sel) ,.result(result));
  
 control_signal_generator csg(.opcode(opcode),.reg_write(reg_write),.mem_read(mem_read),.mem_write(mem_write),.alu_src(alu_src),.branch(branch),.alu_op(alu_op));
  
endmodule