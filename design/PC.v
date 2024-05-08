`include "defines.v"

module pc_reg (
    input clk, //时钟信号
    input reset, //�?1时低位复�?

    input jump, //pc立即数跳�? 0:pc+4 | 1:imm

    input [31:0] pc_imm, //32位立即数

    output reg [31:0] instr, //指令寄存�?

    output reg [31:0] pc_current //当前pc�?
);
reg Re = 1'b1;
reg We = 1'b0;
reg [2:0] funct3 = 3'b010;
wire [31:0] out_data = 32'b0;
reg [31:0] w_addr = 32'b0;
reg [31:0] w_data = 32'b0;

Mem instruc_menmory(
    clk,
    reset,
    
    Re,
    We,
    funct3,
    
    pc_current,
    w_addr,
    w_data,

    out_data
);

always @(posedge clk) begin // 在周期的上升边或下降边沿
    if (reset)
        pc_current <= 32'b0;
    else if (jump)
        pc_current <= pc_imm;
    else
        pc_current <= pc_current + 32'h4;
    instr <= out_data;
end

endmodule