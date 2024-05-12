`include "defines.v"
 
module alu(
    //input                                   clk,
    //input                                   rst_n,
 
    input       [31:0]                      pc_i,
    input       [31:0]                      rs1_data_i,
    input       [31:0]                      rs2_data_i,
    input       [4:0]                       rd_addr_i,
    input       [3:0]                       funct,
    input       [31:0]                      imm,
    input       [6:0]                       opcode,
 
    input                                   branch,
    input                                   memread,
    input                                   memtoreg,
    input                                   memwrite,
    input                                   alusrc,
    input                                   regwrite,
    //output  reg    [`ALUOP_WIDTH-1: 0]  aluop,
    input       [1: 0]                      aluop,
    
    output reg                              branch_sign,
    output reg  [31:0]                      result,
    output reg  [4:0]                       rd_addr_o,
    //MEM
    output reg                              branch_o,
    output reg                              memread_o,
    output reg                              memwrite_o,
    //WB
    output reg                              memtoreg_o,
    output reg                              regwrite_o,
    output reg  [31:0]                      pc_o,
    output reg  [31:0]                      write_data,
    output reg  [3:0]                       align,
    output reg  [1:0]                       aluop_o
);
 
wire            cond_beq    ;
wire            cond_bge    ;
wire            cond_bgeu   ;
wire    [31:0]  alu_src1;
wire    [31:0]  alu_src2;
reg     [31:0]  mask ;
 
assign      cond_beq    =   (rs1_data_i == rs2_data_i)    ;
assign      cond_bge    =   ($signed(rs1_data_i) >= $signed(rs2_data_i))    ;
assign      cond_bgeu   =   rs1_data_i >= rs2_data_i    ;
 
assign      alu_src1    =   rs1_data_i  ;
assign      alu_src2    =   (alusrc == 1'b0)? rs2_data_i : imm  ;
always @(*)begin 
    rd_addr_o   =   rd_addr_i   ;
    //MEM
    branch_o    =   branch      ;
    memread_o   =   memread     ;
    memwrite_o  =   memwrite    ;
    //WB                           
    memtoreg_o  =   memtoreg    ;
    regwrite_o  =   regwrite    ;
    branch_sign =   1'b0        ;
    result      =   32'b0       ;
    pc_o        =   pc_i        ;
    write_data  =   32'b0       ;
    align       =   4'b0        ;
    aluop_o     =   aluop       ;
    case(aluop)
        2'b10:begin
            case(funct[2:0])
                `ADD:begin //ADD\SUB opreation both complete
                    if(opcode == `INSTR_TYPE_I)begin 
                        result  =   alu_src1+alu_src2;
                    end
                    else begin 
                        result  =   (funct[3] == 1'b0)?  (alu_src1 + alu_src2) : (alu_src1 - alu_src2)  ;
                    end
                end
                `XOR:begin
                    result  =   alu_src1 ^ alu_src2     ;
                end
                `OR:begin 
                    result  =   alu_src1 | alu_src2     ;
                end 
                `AND:begin 
                    result  =   alu_src1 & alu_src2     ;
                end 
                `SLL:begin 
                    result  =   alu_src1 << alu_src2[4:0]     ;
                end 
                `SRL:begin     //SRL\SRA opreation both complete
                    if(funct[3] == 1'b0)begin
                        result  =   (alu_src1 >> alu_src2[4:0]) ;
                    end  
                    else begin 
                        mask    =   (alu_src1[31] == 1) ? { {32{1'b1}} << (32 - alu_src2[4:0]) } : 32'b0;
                        result  =   (alu_src1 >> alu_src2[4:0]) | mask;
                    end
                    
                end 
                `SLT:begin 
                    result  =   ($signed(alu_src1) < $signed(alu_src2))? 32'b1 : 32'b0  ;
                end 
                `SLTU:begin
                    result  =   (alu_src1 < alu_src2)? 32'b1 : 32'b0  ; 
                end
            endcase
        end 
        2'b01:begin
            case(funct[2:0])
                3'b000:begin
                    pc_o  =   (cond_beq == 1'b1)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_beq == 1'b1)? 1'b1 : 1'b0   ;
                end
                3'b001:begin
                    pc_o  =   (cond_beq == 1'b0)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_beq == 1'b0)? 1'b1 : 1'b0   ;     
                end 
                3'b101:begin
                    pc_o  =   (cond_bge == 1'b1)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_bge == 1'b1)? 1'b1 : 1'b0   ;
                end 
                3'b100:begin
                    pc_o  =   (cond_bge == 1'b0)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_bge == 1'b0)? 1'b1 : 1'b0   ;
                end
                3'b111:begin
                    pc_o  =   (cond_bgeu == 1'b1)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_bgeu == 1'b1)? 1'b1 : 1'b0   ;
                end 
                3'b110:begin
                    pc_o  =   (cond_bgeu == 1'b0)? (pc_i+imm) : pc_i  ;
                    branch_sign  =   (cond_bgeu == 1'b0)? 1'b1 : 1'b0   ;
                end
            endcase    
        end
        2'b11:begin
            case(opcode)
                `INSTR_TYPE_J:begin 
                    result  =   pc_i + 32'h4    ;
                    pc_o    =   pc_i + imm      ;
                    branch_sign = 1'b1;
                end
                `INSTR_TYPE_JR:begin 
                    result  =   pc_i + 32'h4    ;
                    pc_o    =   alu_src1 + imm      ;
                    branch_sign = 1'b1;
                end
                `INSTR_TYPE_U:begin 
                    result  =   imm     ;
                end 
                `INSTR_TYPE_UPC:begin 
                    result  =   pc_i + imm    ;
                    //branch_sign = 1'b1;
                end
            endcase
        end
        2'b00:begin
            result  =   alu_src1 + imm  ;
            write_data = rs2_data_i   ;     //only use in tpye_s case 
            align[3] = opcode[5]    ;
            align[2:0] = funct[2:0] ;
        end
    endcase
end
 
endmodule 