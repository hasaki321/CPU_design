module RegFile(    
    input clk,    
    input reset,    
    input regWr,    
    input [4:0] rs1_addr,    
    input [4:0] rs2_addr,    
    input [4:0] wr_addr,    
    input [31:0] wr_data,    
    output [31:0] rs1_data,    
    output [31:0] rs2_data    
);    
  
    reg [31:0] regFiles[0:31]; //寄存器组  
       
    integer i;    
      
    assign rs1_out = regFiles[rs1_addr];   
    assign rs2_out = regFiles[rs2_addr];  
        
    always @ (negedge clk) begin    
        if (reset == 0) begin    
            for(i=1;i<32;i=i+1)    
                regFile[i] <= 0;    
        end    
        else if(regWr == 1) begin    
            regFiles[wr_addr] <= wr_data;    
        end    
    end    
            
endmodule  