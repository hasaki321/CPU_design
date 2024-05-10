`timescale 1ns/1ps

module test_clk (
    
);
    
reg clk;
initial begin
    clk = 1'b0;
end;
always #10 clk = ~clk;

test t(
    clk
);
endmodule