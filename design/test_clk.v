`timescale 1ns / 1ps

module test_clk (
    
);

reg reset;
reg clk;
reg clk_mem;

ControlUnit test(.clk(clk),.clk_mem(clk_mem),.reset(reset));

initial begin
reset = 1'b1;
clk = 1'b1;
clk_mem = 1'b1;
#0.15 reset = 1'b0;
#1000 reset = 1'b1;
end 

always #0.15 clk =~clk;
always @(posedge clk) begin
    #0.12 clk_mem = 1'b1;
    #0.12 clk_mem = 1'b0;
end
    
endmodule