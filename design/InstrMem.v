`include "defines.v"
module InstrMem (
    input clk,
    input reset,
    
    input [31:0] r_addr,

    output [31:0] instr
);
// #0.1
wire [9:0] read_addr; 
assign read_addr = r_addr[11:2];

blk_mem_gen_0 instruc_mem ( 
  .clka      (clk          ),            // input clka 
  .addra     (read_addr      ),            // input [8 : 0] addra 
  .douta (instr)
);
endmodule