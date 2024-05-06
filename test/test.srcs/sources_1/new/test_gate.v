`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/06 18:18:06
// Design Name: 
// Module Name: test_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_gate(
        input a,
        input b,
        output [5:0] y
    );
    assign y[0] = a & b;
    assign y[1] = ~(a & b);
    assign y[2] = a | b;
    assign y[3] = ~(a | b);
    assign y[4] = a ^ b;
    assign y[5] = ~(a ^ b);

endmodule
