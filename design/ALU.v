module ALU (
    input [31:0] input_1,
    input [31:0] input_2,
    input [2:0] aluctr,
    input [2:0] fucnt3,
    input [31:0] pc,
    input branch,
    input jumpi,
    

    output [31:0] alu_out,
    output jump
);

wire beq;
wire bne;
wire blt;
wire bltu;
wire bgeu;


assign beq = (fucnt3 == 3'h0 && input_1 == input_2);
assign bne = (fucnt3 == 3'h1 && input_1 != input_2);
assign blt = (fucnt3 == 3'h4 && input_1 < input_2);
assign bltu = (fucnt3 == 3'h6 && input_1 < input_2);
assign bgeu = (fucnt3 == 3'h7 && input_1 >= input_2);

assign temp = beq || bne || blt || bltu || bgeu;

assign jump = (jumpi) || (branch && temp);

assign alu_out = 
(jumpi==2'b01) ? (pc+4) :
                (jumpi==2'b10) ? (pc+4) :
            (aluctr == 3'h1) ? 
              (input_1 + input_2):
              (aluctr == 3'h2) ? 
              (input_1 - input_2):
              (aluctr == 3'h3) ? 
              (input_1 & input_2):
              (aluctr == 3'h4) ? 
              (input_1 << input_2):
              (aluctr == 3'h5) ? 
              (input_1 >>> input_2):
              (aluctr == 3'h6) ? 
              (input_2 << 12):
              (aluctr == 3'h7) ? 
              (pc + (input_2 << 12)):
              32'b0;

    
endmodule