`include ""

module pc_reg (
    input clk; //时钟信号
    input reset_n; //低位复位

    input pc_select; //pc类型选择 pc+4 | pc+imm

    input [31:0] pc_imm; //32位立即数

    output reg [31:0] instruction; //指令寄存器

    output reg [31:0] pc_current; //当前pc值
);
    
endmodule