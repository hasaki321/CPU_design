`include "defines.v"

module pc_reg (
    input clk, //时钟信号
    input reset, //�??1时低位复�??

    input jump, //pc立即数跳�?? 0:pc+4 | 1:imm

    input [31:0] pc_imm, //32位立即数

    output [31:0] instr, //指令寄存�??
    output reg [31:0] pc
);

initial begin
    pc = 32'b0;
end;

always @(posedge clk) begin // 在周期的上升边或下降边沿
    if (reset)
        pc = 32'b0;
    else if (jump) begin
        pc = pc_imm;
    end
    else begin
        pc = pc + 32'h4;
    end
end;
reg imem_clk;

always @(posedge clk or negedge clk) begin
    imem_clk <= #0.01 clk; // 添加 1 个时钟周期的延迟
end
InstrMem instruc_menmory(
    imem_clk,
    reset,
    
    pc,
    instr
);
endmodule