module processor_top_tb;
reg clk, reset;
processor_top uut(.clk(clk),.reset(reset));

initial begin
  $dumpfile("processor_top.vcd");
  $dumpvars(0, processor_top_tb);
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
    #500;
  $finish;
end
always #5 clk = ~clk;
endmodule