module instruction_memory(input [31:0] pc,output reg [31:0] instruction);
reg [31:0] memory[0:15];
initial begin
    memory[0] = 32'h003100B3;
    memory[1] = 32'h00510113;
    memory[2] = 32'h00112023;
    memory[3] = 32'h00000063;
end
always @(*) begin
    if(pc[5:2] < 4)
        instruction = memory[pc[5:2]];
    else
        instruction = 32'b0;
end
endmodule