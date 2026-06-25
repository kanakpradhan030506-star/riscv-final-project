module processor_top_tb;
reg clk, reset;
processor_top uut(.clk(clk),.reset(reset));
always #5 clk = ~clk;
initial begin
  $dumpfile("processor_top.vcd");
  $dumpvars(0, processor_top_tb);
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
    #100;
  $finish;
end
endmodule