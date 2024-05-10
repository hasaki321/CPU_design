`include "defines.v"
module DataMem (
    input clk,
    input reset,
    
    
    input [2:0] funct,
    input [31:0] addr,
    input [31:0] w_data,

    input Re,
    input We,

    output reg [31:0] read_data
);

wire [31:0] ram_data_o; 

reg [31:0] write_data = 32'b0; 

blk_mem_gen_1 data_mem ( 
  .clka      (clk          ),            // input clka 
  .wea       (We          ),            // input [0 : 0] wea 
  .addra     (addr[9:0]       ),            // input [8 : 0] addra 
  .dina      (write_data       ),            // input [15 : 0] dina 

   .clkb     (clk          ),            // input clkb 
   .enb      (Re)          ,
   .addrb    (addr[9:0]       ),            // input [8 : 0] addrb 
   .doutb    (ram_data_o       )             // output [15 : 0] doutb 
  ); 

always @(*) begin
    read_data = 32'b0;
    
    case({Re,We})
        2'b10:begin 
            case({1'b0,funct})
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
            case(funct)
                `S_BYTE:begin 
                    write_data    =   {{ram_data_o[31:8]},{w_data[7:0]}}   ;
                end
                `S_HALF:begin 
                    write_data    =   {{ram_data_o[31:16]},{w_data[15:0]}}   ;
                end 
                `S_WORD:begin 
                    write_data    =   w_data[31:0]   ;
                end
            endcase 
        end    
    endcase
end 



endmodule