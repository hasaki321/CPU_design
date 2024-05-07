`include "defines.v"
 
module wb(
    input                               memtoreg,
    input                               regwrite,
 
    input   [4:0]                       write_addr_i,
    input   [31:0]                      write_data,
    input   [31:0]                      read_data,
    
    output  reg [4:0]                       write_addr_o,
    output  reg [31:0]                      write_data_o,
    output  reg                         regwrite_o
);
 
always @(*)begin 
    write_addr_o = write_addr_i ;
    regwrite_o   =  regwrite    ;
    if((regwrite == 1'b1) && (memtoreg == 1'b0) && ~(write_addr_i == 5'b0))begin      //x0 register can not write,the value is always zero !!!!
        write_data_o = write_data ;
end
    else if((regwrite == 1'b1) && (memtoreg == 1'b1) && ~(write_addr_i == 5'b0))begin 
        write_data_o = read_data ;
    end
    else begin 
        write_data_o = 32'b0;
    end
end
endmodule 