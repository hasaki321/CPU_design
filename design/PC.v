`include "defines.v"

module pc_reg (
    input clk; //时钟信号
    input reset; //为1时低位复位

    input jump; //pc立即数跳转 0:pc+4 | 1:imm

    input [31:0] pc_imm; //32位立即数

    output reg [31:0] instr; //指令寄存器

    output reg [31:0] pc_current; //当前pc值
);

reg [31:0] instruc_menmory [0:1023];

always @(posedge clk or negedge clk) begin // 在周期的上升边或下降边沿
    reset ? (pc_current<=32'b0;) : (jump? (pc_current<=pc_imm;):(pc_current<=pc_current+32'h4;))
end

always @(*) begin
    instr = instruc_menmory[pc_current[11:2]] //根据pc的第2-11位在指令寄存器中取指令
end

endmodule