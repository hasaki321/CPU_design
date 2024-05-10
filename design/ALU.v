module ALU (
    input [31:0] input_1,
    input [31:0] input_2,
    input [2:0] aluctr,
    input branch,

    output [31:0] alu_out,
    output jump
);

assign jump = 0;

assign alu_out = 32'b0;

    
endmodule