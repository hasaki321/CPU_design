module test_frame (
    input clk,
    input reset
);
    
reg jump;
reg [31:0] pc_imm;

initial begin
    jump = 1'b0;
    pc_imm = 32'b0;
end

pc_reg pc_count(
    clk,
    reset,
    jump,
    pc_imm,
);

endmodule