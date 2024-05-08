`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 15:23:55
// Design Name: 
// Module Name: BRAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BRAM(
input clk,               //???
input rst                //??��??????????��
    );    
	
reg[9:0]     w_addr;      //RAM PORT A ��???
reg[31:0]    w_data;     //RAM PORT  A ��????
reg          wea;        //RAM PORT  A ��??????????��
reg          enb;        //RAM PORT  B ????????????��
reg[9:0]     r_addr;     //RAM PORT  B ?????
wire[31:0]   r_data;    //RAM PORT   B ??????


//????RAM PORTA ��??????
always@(posedge clk or negedge rst) begin
      if(!rst)
	     wea <= 1'b0;
	  else begin
	      if(&w_addr)                       //w_addr??bit��??1????��??512???????��?????
	         wea <= 1'b0;
		  else 
		     wea <= 1'b1;                  //RAM ��???
	  end 
end 

//????RAM PORTB ????????
always@(posedge clk or negedge rst) begin
      if(!rst)
	     enb <= 1'b0;
	  else begin
	      if(&r_addr)                       //r_addr??bit��??1????????512??????????????
	         enb <= 1'b0;
		  else 
		     enb <= 1'b1;                  //RAM ?????
	  end 
end 

//????RAM PORTA��???????????
always@(posedge clk or negedge rst) begin
      if(!rst) begin
	      w_addr <= 10'd00000000010;
		  w_data <= 32'd1;
	  end
      else begin
	      if(wea) begin                    //ram��?????�� 
		      if(&w_addr) begin           //w_addr??bit��??1????��??512???????��????? 
			      w_addr <= w_addr;      //��?????????????????????????????????��???RAM
				  w_data <= w_data;
			  end 
			  else begin
			      w_addr <= w_addr + 1'b1;
				  w_data <= w_data + 1'b1;
			  end
		  end 
	  end 
end 

//????RAM PORTB ?????
always@(posedge clk or negedge rst) begin
      if(!rst) begin
	      r_addr <= 10'd0;
	  end
      else begin
	      if(enb) begin                    //ram???????�� 
		      if(&r_addr) begin           //r_addr??bit��??1????????512?????????????? 
			      r_addr <= r_addr + 1'b1;      //????????????????????
			  end 
			  else begin
			      r_addr <= r_addr + 1'b1;
			  end
		  end 
	  end 
end 
////////////////////////////////////////////////
//?????RAM 
blk_mem_gen_1 ram_ip_test ( 
  .clka      (clk          ),            // input clka 
  .wea       (wea          ),            // input [0 : 0] wea 
  .addra     (w_addr       ),            // input [8 : 0] addra 
  .dina      (w_data       ),            // input [15 : 0] dina 
   .clkb     (clk          ),            // input clkb 
   .enb      (enb)          ,
   .addrb    (r_addr       ),            // input [8 : 0] addrb 
   .doutb    (r_data       )             // output [15 : 0] doutb 
  ); 

endmodule
