module ControlUnit (
    input clk,
    input reset
);
    
reg jump;
reg [31:0] pc_imm;

wire [31:0] pc_current;
wire [31:0] instr;
wire [4:0] rs1_addr;
wire [4:0] rs2_addr;
wire [4:0] rd_addr;
wire [31:0] imm;

wire [31:0] rs1_data;
wire [31:0] rs2_data;
wire [31:0] rd_data;


// control signal
wire [2:0] funct;    
wire [2:0] aluctr;
wire branch;
wire memread;
wire memtoreg;
wire memwrite;
wire regwrite;
wire immadd;


initial begin
    assign jump = 1'b0;
    assign pc_imm = 32'b0;
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
    regwrite,
    immadd
);

assign rd_data = 5'b0;

RegFile regfiles(
    clk,
    reset,
    regwrite,
     
    rs1_addr,
    rs2_addr,
    rd_addr,
    rd_data,

    rs1_data,
    rs2_data
);

wire [31:0] input_1; 
wire [31:0] input_2; 

assign input_1 = rs1_data;
assign input_2 = (immadd) ? imm : rs2_data;

wire [31:0] alu_out;
wire zero_flow;
ALU alu(
    input_1,
    input_2,
    aluctr,
    branch,

    alu_out,
    zero_flow
);

assign rd_data = (regwrite) ? alu_out : 32'b0;

always @(*) begin
    jump = (zero_flow && branch) ? 1'b1 : 1'b0;
    pc_imm = (jump) ? imm : 32'b0;
end



wire [31:0] mem_read_out;
DataMem data_mem(
    clk,
    reset,
    
    funct,
    alu_out,
    rs2_data,

    memread,
    memwrite,

    mem_read_out
);

assign rd_data = (memtoreg) ? mem_read_out : 32'b0;

endmodule