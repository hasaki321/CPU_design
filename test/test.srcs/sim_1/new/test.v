`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/06 18:28:50
// Design Name: 
// Module Name: test
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


module test(

    );
    reg a,b;
    wire [5:0] y;

    test_gate uut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        a=0;b=0;
        # 100;
        a=0;b=1;
        # 100;
        a=1;b=0;
        # 100;
        a=1;b=1;
        # 100;
        $finish;
    end

endmodule
