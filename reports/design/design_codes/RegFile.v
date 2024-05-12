module RegFile(    
    input clk,    
    input reset,

    input regWr,
    input memtoreg,

    input [4:0] rs1_addr,    
    input [4:0] rs2_addr, 
    input [4:0] rd_addr,

    input [31:0] rd_data,   

    output [31:0] rs1_data,    
    output [31:0] rs2_data  
);    
  
    reg [31:0] regFiles[0:31]; //寄存器组  
    
    integer i; 

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            regFiles[i] = 32'b0; // 给每个寄存器赋值为其索引值
        end
    end
      
    assign rs1_data = regFiles[rs1_addr];   
    assign rs2_data = regFiles[rs2_addr];  
        
    // always @ (posedge clk) begin
    //     if (reset == 1'b1) begin    
    //         for(i=1;i<32;i=i+1)    
    //             regFiles[i] <= 32'b0;    
    //     end    
    // end    
    always @ (negedge clk) begin
        if(regWr | memtoreg ) begin    
            regFiles[rd_addr] <= rd_data;    
        end
    end
            
endmodule  