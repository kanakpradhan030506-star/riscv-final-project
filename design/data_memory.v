module data_memory(input clk,input mem_read,input mem_write,input [31:0] write_data,input [31:0] address,output reg [31:0] read_data);
reg [31:0] memory[0:31];
always @(posedge clk) begin
    if(mem_write)
        memory[address[4:0]] <= write_data;
end
always @(*) begin
    if(mem_read)
        read_data = memory[address[4:0]];
    else
        read_data = 32'b0;
end
endmodule