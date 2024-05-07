`include "define.v"
module Mem (
    input clk,
    input reset,
    
    input Re;
    input We;
    input funct3;
    
    input [31:0] addr,
    input [31:0] w_data,

    output [31:0] out_data
);

reg [31:0] memory [0:4096]; 

always @(*) begin
    memtoreg_o  =   memtoreg_i  ;
    regwrite_o  =   regwrite_i  ;
    ram_data_i  =   32'h0;
         case({Re,We})
            10:begin 
                ram_data_o = memory[addr[11:0]]
                case(funct3)
                    `L_BYTE:begin
                        read_data   =   {{24{ram_data_o[7]}},ram_data_o[7:0]}   ;
                    end
                    `L_HALF:begin
                        read_data   =   {{16{ram_data_o[15]}},ram_data_o[15:0]}   ;
                    end
                    `L_WORD:begin
                        read_data   =   ram_data_o[31:0]   ;
                    end
                    `L_BYTE_U:begin
                        read_data   =   {24'b0,ram_data_o[7:0]}   ;
                    end
                    `L_HALF_U:begin
                        read_data   =   {16'b0,ram_data_o[15:0]}   ;
                    end
                endcase
            end
            01:begin
                memory[addr[11:0]] = w_data
                case(funct3)
                    `S_BYTE:begin 
                        ram_data_i    =   {{ram_data_o[31:8]},{write_data[7:0]}}   ;
                    end
                    `S_HALF:begin 
                        ram_data_i    =   {{ram_data_o[31:16]},{write_data[15:0]}}   ;
                    end 
                    `S_WORD:begin 
                        ram_data_i    =   write_data[31:0]   ;
                    end
                endcase 
            end    
        endcase
end 

endmodule