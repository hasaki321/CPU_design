`include  "defines.v"
 
module mem(
    input   clk,
    input   rst_n,
 
    //MEM
    input                           branch_i,
    input                           memread_i,
    input                           memwrite_i,
    //WB
    input                           memtoreg_i,
    input                           regwrite_i,
 
    input   [1:0]                   aluop,
    //input   [3:0]                   funct,
 
    input   [31:0]                  pc_i,
    input   [31:0]                  write_data,
    input   [3:0]                   align,
    
    input                           branch_sign,
    input   [31:0]                  result,
    input   [4:0]                   rd_addr_i,
 
 
    output   [4:0]                  rd_addr_o,
    output   [31:0]                 pc_o,
    output                          pcsrc,
    output   reg [31:0]             read_data,
    output   reg [31:0]             rd_data,
 
    output   reg                    memtoreg_o,
    output   reg                    regwrite_o 
);
 
//reg  [31:0]     data_mem [0:4095];
wire  [31:0]     ram_data_o;
reg  [31:0]     ram_data_i;
 
assign pcsrc = branch_i && branch_sign  ; 
assign pc_o  = pc_i ;
assign rd_addr_o    =   rd_addr_i   ;
 
 
data_mem  data_mem_u0 (
.clk          (clk),
.rst_n        (rst_n),
.memwrite     (memwrite_i),
.memread      (memread_i),
.data_addr    (result),
.write_data   (ram_data_i),
.read_data    (ram_data_o) 
);
 
 
always @(*)begin 
    if(memtoreg_i == 1'b0)begin
        rd_data =   result  ;
    end
    else begin 
        rd_data =   32'b0   ;
    end
end
 
//always @(*)begin 
//        //ram_data_o    =   32'b0   ;
//    if(memread_i == 1'b1)begin 
//        ram_data_o    =   data_mem[result[13:2]]    ;
//    end 
//    else if (memwrite_i == 1'b1)begin 
//        ram_data_o    =   data_mem[result >> 2]    ;
//        //data_mem[result >> 2]    =   ram_data_i  ;
//    end
//    else begin
//        ram_data_o    =   32'b0   ;
//        //data_mem[result >> 2]    =   ram_data_o    ;
//    end
//end 
 
 
 
 
always @(*) begin
    memtoreg_o  =   memtoreg_i  ;
    regwrite_o  =   regwrite_i  ;
    ram_data_i  =   32'h0;
    //read_data   =   32'b0   ;
         case({aluop,{align[3]}})
            000:begin 
                case(align[2:0])
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
            001:begin
                case(align[2:0])
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
 
 
//always @(*)begin 
//    if(memwrite_i == 1'b1)
//        data_mem[result [13:2]]    =   ram_data_i  ;
//    else 
//        data_mem[result [13:2]]    =   ram_data_o    ;
//end 
endmodule 