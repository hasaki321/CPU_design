`include "defines.v"
module ID (
    input [31:0] instr;
    input [31:0] pc;
    
    output reg [31:0] rs1_data;
    output reg [31:0] rs2_data;
    output reg [31:0] rd_data;
    output reg [3:0] funct;


    output  reg                             branch,
    output  reg                             memread,
    output  reg                             memtoreg,
    output  reg                             memwrite,
    output  reg                             regwrite,
);

wire    [6:0]   opcode  =   instr[6:0] ;
wire    [4:0]   rd      =   instr[11:7]     ;
wire    [2:0]   funct3  =   instr[14:12] ;
wire    [4:0]   rs1     =   instr[19:15]    ;    
wire    [4:0]   rs2     =   instr[24:20]    ;
wire    [6:0]   funct7  =   instr[31:25] ;



always @(*) begin
    rs1_addr_o      =   `REG_ADDR_WIDTH'h0;
    rs2_addr_o      =   `REG_ADDR_WIDTH'h0;
    rs1_data_o      =   `REG_WIDTH'h0;
    rs2_data_o      =   `REG_WIDTH'h0;
    rd_addr_o       =   `REG_ADDR_WIDTH'h0;
    //reg_wen         =   1'b0;
    imm             =   32'h0;
    //control signal
    memread         =   1'b0;
    memtoreg        =   1'b0;
    memwrite        =   1'b0;
    regwrite        =   1'b0;

    funct = {funct7[5],funct3};

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
                regwrite   = 1'b1;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b0;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b1;
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
                regwrite   = 1'b0;
            end
        endcase 



end



endmodule