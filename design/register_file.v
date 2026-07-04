module register_file(input clk,input reg_write,input [4:0] source_reg_1,input [4:0] source_reg_2,input [4:0] destination_reg,input [31:0] write_data,output [31:0] read_data1,output [31:0] read_data2);
reg [31:0] registers[31:0];
integer i;
initial begin
    for(i=0;i<32;i=i+1)
        registers[i] = 0;
end
always @(posedge clk) begin
    if(reg_write && destination_reg != 0)
        registers[destination_reg] <= write_data;
end
assign read_data1 = (source_reg_1 == 0) ? 32'b0 : registers[source_reg_1];
assign read_data2 = (source_reg_2 == 0) ? 32'b0 : registers[source_reg_2];
endmodule