`timescale 1ns / 1ps

module test_clk (
    
);

reg reset;
reg clk;

test_frame test(.clk(clk),.reset(reset));

initial begin
reset = 1'b1;
clk = 1'b1;
#30 reset = 1'b0;
#500 reset = 1'b1;
end 

always #20 clk =~clk;
    
endmodule