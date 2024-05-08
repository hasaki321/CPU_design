module test_frame (
    input clk,
    input reset
);
    
reg jump;
reg [31:0] pc_imm;

wire [31:0] pc_current;
wire [31:0] instr;
wire [31:0] rs1_addr;
wire [31:0] rs2_addr;
wire [31:0] rd_addr;
wire [31:0] imm;

// control signal
wire [3:0] funct;    
wire [2:0] aluctr;
wire branch;
wire memread;
wire memtoreg;
wire memwrite;
wire regwrite;




initial begin
    jump = 1'b0;
    pc_imm = 32'b0;
end

pc_reg pc_count(
    clk,
    reset,
    jump,
    pc_imm,
    instr,
    pc_current
);

ID instruction_decoder(
    instr,
    pc_current,

    rs1_addr,
    rs2_addr,
    rd_addr,
    imm,

    funct, 
    aluctr,
    branch,
    memread,
    memtoreg,
    memwrite,
    regwrite
);

endmodule