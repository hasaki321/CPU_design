module ALU (
    input [31:0] input_1,
    input [31:0] input_2,
    input [2:0] aluctr,
    input [2:0] funct3,
    input [31:0] pc,
    input branch,
    input [1:0] jumpi,
    

    output [31:0] alu_out,
    output [31:0] pc_out,
    output jump
);

wire beq;
wire bne;
wire blt;
wire bltu;
wire bgeu;


assign beq = (funct3 == 3'h0) && (input_1 == input_2);
assign bne = (funct3 == 3'h1) && (input_1 != input_2);
assign blt = (funct3 == 3'h4 ) && (input_1 < input_2);
assign bltu = (funct3 == 3'h6 ) && (input_1 < input_2);
assign bgeu = (funct3 == 3'h7) && (input_1 >= input_2);

assign temp = beq || bne || blt || bltu || bgeu;

assign jump = (jumpi) || (branch && temp);

assign pc_out = (jumpi==2'b01) || (branch && temp)? (pc) :
            (jumpi==2'b10) ? (input_1) : 
            32'b0;

assign alu_out = 
            (jumpi==2'b01) ? (pc+32'h4) :
            (jumpi==2'b10) ? (pc+32'h4) :
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