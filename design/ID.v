`include "defines.v"
module ID (
    input [31:0] instr,
    input [31:0] pc,
    
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
    output reg [1:0] jumpi,
    output reg alului
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
    jumpi            =   2'b0;
    alului = 2'b0;

    
    aluctr = 4'h0;

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
                    3'h7: begin
                        aluctr = 3'h3;
                    end
                    3'h1: begin
                        aluctr = 3'h4;
                    end
                    3'h5: begin
                        aluctr = 3'h5;
                    end
                endcase
            end
            `INSTR_TYPE_I:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm = {{20{instr[31]}},instr[31:20]};
                case (funct3)
                    3'h0: begin
                        aluctr = 3'h1;
                    end
                    3'h7: begin
                        aluctr = 3'h3;
                    end
                endcase
                regwrite   = 1'b1;
                immadd = 1'b1;
            end
            `INSTR_TYPE_B:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;

                imm = {{19{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8],1'b0};

                branch     = 1'b1;
            end 
            `INSTR_TYPE_J:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm = {{11{instr[31]}},instr[31],instr[19:12],instr[20],instr[30:21],1'b0};

                // branch     = 1'b1;
                regwrite   = 1'b1;
                jumpi       = 2'b01;
                immadd = 1'b1;
            end
            `INSTR_TYPE_JR:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rd_addr_o  = rd;

                regwrite   = 1'b1;
                jumpi       = 2'b10;
                imm= {{20{instr[31]}},instr[31:20]};
            end
            `INSTR_TYPE_U:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rd_addr_o  = rd;

                regwrite   = 1'b1;
                aluctr = 3'h6 ;
                immadd = 1'b1;
                imm={instr[31:12],12'b0};
            end
            `INSTR_TYPE_UPC:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rd_addr_o  = rd;

                regwrite   = 1'b1;
                aluctr      = 3'h7;
                immadd = 1'b1;
                imm       = {instr[31:12],12'b0};
            end
            `INSTR_TYPE_IL:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;

                rd_addr_o  = rd;
                imm       = {{20{instr[31]}},instr[31:20]};

                aluctr = 3'h1;
                memread    = 1'b1;
                memtoreg   = 1'b1;
                immadd = 1'b1;
            end
            `INSTR_TYPE_S:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;

                rd_addr_o  = rd;
                
                imm       = {{20{instr[31]}},instr[31:25],instr[11:7]};

                aluctr = 3'h1;
                memwrite   = 1'b1;
                immadd = 1'b1;
            end
        endcase 



end



endmodule