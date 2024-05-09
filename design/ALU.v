module ALU (
    input [31:0] input_1,
    input [31:0] input_2,
    input [2:0] aluctr,
    input branch,

    output reg [31:0] alu_out,
    output reg zero_flow
);

initial begin
     alu_out = 32'b0;
     zero_flow = 1'b0;
end
    
endmodule