`include "defines.v"
module ID (
    input [31:0] instr,
    
    output reg [4:0] rs1_addr_o,
    output reg [4:0] rs2_addr_o,

    output reg [4:0] rd_addr_o,
    output reg [31:0] imm,

    output reg [2:0] funct,    
    output reg [2:0] aluctr,
    output reg branch,
    output reg memread,
    output reg memtoreg,
    output reg memwrite,
    output reg regwrite,
    output reg immadd,
    output reg jump
);

wire    [6:0]   opcode  =   instr[6:0] ;
wire    [4:0]   rd      =   instr[11:7]     ;
wire    [2:0]   funct3  =   instr[14:12] ;
wire    [4:0]   rs1     =   instr[19:15]    ;    
wire    [4:0]   rs2     =   instr[24:20]    ;
wire    [6:0]   funct7  =   instr[31:25] ;



always @(*) begin
    rs1_addr_o      =   5'h0;
    rs2_addr_o      =   5'h0;

    rd_addr_o       =   5'h0;

    imm = 32'b0;

    immadd = 1'b0;
    memread         =   1'b0;
    memtoreg        =   1'b0;
    memwrite        =   1'b0;
    regwrite        =   1'b0;
    branch          =   1'b0;
    jump            =   1'b0;
    
    aluctr = 3'h0;

    funct = funct3;

    case(opcode) 
        `INSTR_TYPE_R:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;
                rd_addr_o  = rd;

                regwrite   = 1'b1;
                case (funct3)
                    3'h0: begin
                        aluctr = (funct7[5]) ? 3'h2 : 3'h1;
                    end
                    3'h6: begin
                        aluctr = 3'h3;
                    end
                    3'h7: begin
                        aluctr = 3'h4;
                    end
                    3'h1: begin
                        aluctr = 3'h5;
                    end
                endcase
            end
            `INSTR_TYPE_I:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm[11:0] = {funct7,rs2};

                aluctr = 3'h1 ; //只有addi所以只有一种情况
                regwrite   = 1'b1;
                immadd = 1'b1;
            end
            `INSTR_TYPE_B:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;

                imm[10:0] = {funct7[5:0],rd};
                imm[12] = funct7[6];

                branch     = 1'b1;
                case (funct3)
                    3'h0: begin
                        aluctr = 3'h6;
                    end
                    3'h4: begin
                        aluctr = 3'h7;
                    end
                endcase
            end 
            `INSTR_TYPE_J:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm[19:12] = {rs1,funct3};
                imm[11] = rs2[0];
                imm[10:1] = {funct7[5:0],rs2[4:1]};
                imm[20] = funct7[6];

                // branch     = 1'b1;
                regwrite   = 1'b1;
                jump       = 1'b1;
            end
            `INSTR_TYPE_IL:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm[11:0] = {funct7,rs2};

                aluctr = 3'h1;
                memread    = 1'b1;
                memtoreg   = 1'b1;
                immadd = 1'b1;
            end
            `INSTR_TYPE_S:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;

                rd_addr_o  = rd;
                
                imm[11:0] = {funct7,rd};

                aluctr = 3'h1;
                memwrite   = 1'b1;
                immadd = 1'b1;
            end
        endcase 



end



endmodule