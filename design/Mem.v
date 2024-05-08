`include "defines.v"
module Mem (
    input clk,
    input reset,
    
    input Re,
    input We,
    input [2:0] funct3,
    
    input [31:0] r_addr,
    input [31:0] w_addr,
    input [31:0] w_data,

    output reg [31:0] read_data
);

wire [31:0] ram_data_o; 

reg [31:0] ram_data_i = 32'b0; 
wire [3:0] fucnt = {1'b0,funct3};

blk_mem_gen_0 instruc_mem ( 
  .clka      (clk          ),            // input clka 
  .wea       (We          ),            // input [0 : 0] wea 
  .addra     (w_addr[11:2]       ),            // input [8 : 0] addra 
  .dina      (w_data       ),            // input [15 : 0] dina 
   .clkb     (clk          ),            // input clkb 
   .enb      (Re)          ,
   .addrb    (r_addr[11:2]       ),            // input [8 : 0] addrb 
   .doutb    (ram_data_o       )             // output [15 : 0] doutb 
  ); 

always @(*) begin
    read_data = 32'b0;
    
    case({Re,We})
        2'b10:begin 
            case(fucnt)
                `L_BYTE:begin
                    read_data   =   {{24{ram_data_o[7]}},ram_data_o[7:0]};
                end
                `L_HALF:begin
                    read_data   =   {{16{ram_data_o[15]}},ram_data_o[15:0]}   ;
                end
                `L_WORD:begin
                    read_data   =   ram_data_o[31:0];
                end
                `L_BYTE_U:begin
                    read_data   =   {24'b0,ram_data_o[7:0]}   ;
                end
                `L_HALF_U:begin
                    read_data   =   {16'b0,ram_data_o[15:0]}   ;
                end
            endcase
        end
        2'b01:begin
            case(funct3)
                `S_BYTE:begin 
                    ram_data_i    =   {{ram_data_o[31:8]},{w_data[7:0]}}   ;
                end
                `S_HALF:begin 
                    ram_data_i    =   {{ram_data_o[31:16]},{w_data[15:0]}}   ;
                end 
                `S_WORD:begin 
                    ram_data_i    =   w_data[31:0]   ;
                end
            endcase 
        end    
    endcase
end 



endmodule