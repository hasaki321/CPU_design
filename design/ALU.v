module ALU (
    input [31:0] input_1,
    input [31:0] input_2,
    input [2:0] aluctr,
    input branch,

    output [31:0] alu_out,
    output jump
);

assign jump = (branch == 1'b1) ? 
              ((aluctr == 3'h6 && input_1 == input_2) ||
               (aluctr == 3'h7 && input_1 < input_2)) :
              1'b0;

assign alu_out = (aluctr == 3'h1) ? 
              (input_1 + input_2):
              (aluctr == 3'h2) ? 
              (input_1 - input_2):
              (aluctr == 3'h3) ? 
              (input_1 & input_2):
              (aluctr == 3'h4) ? 
              (input_1 | input_2):
              (aluctr == 3'h5) ? 
              (input_1 << input_2):
              32'b0;

    
endmodule