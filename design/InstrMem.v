`include "defines.v"
module InstrMem (
    input clk,
    input reset,
    
    input [31:0] r_addr,

    output [31:0] instr
);

wire [31:0] ram_data_o; 

blk_mem_gen_0 instruc_mem ( 
  .clka      (clk          ),            // input clka 
  .wea       (1'b0         ),            // input [0 : 0] wea 
  .addra     (r_addr[11:2]      ),            // input [8 : 0] addra 
  .dina      (32'b0        ),            // input [15 : 0] dina 
  .douta (instr)
);
endmodule