`include  "defines.v"
 
module id (
    //input                                 clk,
    input                                   rst_n,
 
    input       [31:0]                      pc_i,
    input       [31:0]                      instr_i,
 
    output reg  [31:0]                      pc_o,
    //from regs
    input   [`REG_WIDTH-1:0]                rs1_data_i,
    input   [`REG_WIDTH-1:0]                rs2_data_i,
 
    //to regs
    output   reg   [`REG_ADDR_WIDTH-1:0]    rs1_addr_o,
    output   reg   [`REG_ADDR_WIDTH-1:0]    rs2_addr_o,
 
    //output   reg   [`INSTR_WIDTH-1:0]       instr_o,  //????
    //output   reg   [`REG_WIDTH-1:0]         instr_addr_o,
 
    output   reg   [`REG_WIDTH-1:0]         rs1_data_o,
    output   reg   [`REG_WIDTH-1:0]         rs2_data_o,
    
    output   reg   [`REG_ADDR_WIDTH-1:0]    rd_addr_o,
    //output   reg                            reg_wen,
 
 
    //control signal
    output  reg                             branch,
    output  reg                             memread,
    output  reg                             memtoreg,
    output  reg                             memwrite,
    output  reg                             alusrc,
    output  reg                             regwrite,
    //output  reg    [`ALUOP_WIDTH-1: 0]  aluop,
    output  reg    [`ALUOP_WIDTH-1: 0]      aluop,
 
    output  reg    [`REG_WIDTH-1:0]         imm,
    output         [3:0]                    funct,
 
    //output  reg                             jump,
    //output  reg                             jump_reg       
 
    output      [6:0]                opcode_o
);
 
 
always @(*)begin 
    if(!rst_n)begin
        pc_o    =   32'h0;
    end 
    else begin 
        pc_o    =   pc_i;
    end
end
 
wire    [6:0]   opcode  =   instr_i[6:0] ;
wire    [4:0]   rd      =   instr_i[11:7]     ;
wire    [2:0]   funct3  =   instr_i[14:12] ;
wire    [4:0]   rs1     =   instr_i[19:15]    ;    
wire    [4:0]   rs2     =   instr_i[24:20]    ;
wire    [6:0]   funct7  =   instr_i[31:25] ;
assign  opcode_o = opcode;
//assign          opcode  =   instr_i[6:0]  ;
//assign          rd      =   instr_i[11:7] ;
//assign          funct3  =   instr_i[14:12];
//assign          rs1     =   instr_i[19:15];
//assign          rs2     =   instr_i[24:20];
//assign          funct7  =   instr_i[31:25];
assign    funct  =  {funct7[5],funct3};
always @(*)begin  
    //instr_o         =   instr_i; 
    pc_o    =   pc_i;
    rs1_addr_o      =   `REG_ADDR_WIDTH'h0;
    rs2_addr_o      =   `REG_ADDR_WIDTH'h0;
    rs1_data_o      =   `REG_WIDTH'h0;
    rs2_data_o      =   `REG_WIDTH'h0;
    rd_addr_o       =   `REG_ADDR_WIDTH'h0;
    //reg_wen         =   1'b0;
    imm             =   32'h0;
    //control signal
    branch          =   1'b0;
    memread         =   1'b0;
    memtoreg        =   1'b0;
    memwrite        =   1'b0;
    alusrc          =   1'b0;
    regwrite        =   1'b0;
    aluop           =   2'b00;
    //jump            =   1'b0;
    //jump_reg        =   1'b0;
    //opcode_o        =   opcode;
    case(opcode) 
        `INSTR_TYPE_R:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;
                rs1_data_o = rs1_data_i;
                rs2_data_o = rs2_data_i;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b1;
                aluop      = 2'b10;
                imm        = 32'h0;
            end
            `INSTR_TYPE_I:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = rs1_data_i;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b1;
                regwrite   = 1'b1;
                aluop      = 2'b10;
                imm        = {{20{instr_i[31]}},instr_i[31:20]};
            end
            `INSTR_TYPE_B:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;
                rs1_data_o = rs1_data_i;
                rs2_data_o = rs2_data_i;
                rd_addr_o  = 5'b0;
                //reg_wen    = 1'b1;
                branch     = 1'b1;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b0;
                aluop      = 2'b01;
                imm        = {{19{instr_i[31]}},instr_i[31],instr_i[7],instr_i[30:25],instr_i[11:8],1'b0};
            end 
            `INSTR_TYPE_J:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = `REG_WIDTH'h0;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b1;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b1;
                aluop      = 2'b11;
                imm        = {{11{instr_i[31]}},instr_i[31],instr_i[19:12],instr_i[20],instr_i[30:21],1'b0};
                //jump       = 1'b1;
            end
            `INSTR_TYPE_JR:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = rs1_data_i;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b1;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b1;
                aluop      = 2'b11;
                //imm        = {{11{instr_i[31]}},instr_i[31],instr_i[19:12],instr_i[20],instr_i[30:21],1'b0};
                imm        = {{20{instr_i[31]}},instr_i[31:20]};
                //jump_reg   = 1'b1;
            end
            `INSTR_TYPE_U:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = `REG_WIDTH'h0;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b1;
                aluop      = 2'b11;
                imm        = {instr_i[31:12],12'b0};
            end
            `INSTR_TYPE_UPC:begin
                rs1_addr_o = `REG_ADDR_WIDTH'h0;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = `REG_WIDTH'h0;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b0;
                alusrc     = 1'b0;
                regwrite   = 1'b1;
                aluop      = 2'b11;
                imm        = {instr_i[31:12],12'b0};
            end
            `INSTR_TYPE_IL:begin
                rs1_addr_o = rs1;
                rs2_addr_o = `REG_ADDR_WIDTH'h0;
                rs1_data_o = rs1_data_i;
                rs2_data_o = `REG_WIDTH'h0;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b1;
                memtoreg   = 1'b1;
                memwrite   = 1'b0;
                alusrc     = 1'b1;
                regwrite   = 1'b1;
                aluop      = 2'b00;
                imm        = {{20{instr_i[31]}},instr_i[31:20]};
            end
            `INSTR_TYPE_S:begin
                rs1_addr_o = rs1;
                rs2_addr_o = rs2;
                rs1_data_o = rs1_data_i;
                rs2_data_o = rs2_data_i;
                rd_addr_o  = rd;
                //reg_wen    = 1'b1;
                branch     = 1'b0;
                memread    = 1'b0;
                memtoreg   = 1'b0;
                memwrite   = 1'b1;
                alusrc     = 1'b1;
                regwrite   = 1'b0;
                aluop      = 2'b00;
                imm        = {{20{instr_i[31]}},instr_i[31:25],instr_i[11:7]};
            end
        endcase 
end
 
 
    
endmodule 