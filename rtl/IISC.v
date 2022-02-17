/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name: Single Active Noise Reduction Contral
 *
 *Time: First 20210913; Last 
 *
 *Author: XuQing
 *
 *Describe: 
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
`include "../rtl/macro.v"
module IISC(   
    input           clk  ,     
    input           rst_n ,            
	 
	 output reg      aud_mclk,
	 output reg      aud_bclk,
    output reg      aud_lrc   
);

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
 *Name:
 *
 *Reg&Wire:
 *
 *Function:
 *
 *Author:
 *                                                                @rainbowsmile-
 ------------------------------------------------------------------------------*/
reg   [1:0] mclk_cnt; //4分频
reg   [4:0] lrc_cnt;  //32分频
reg   [3:0] bclk_cnt; //16分频
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		bclk_cnt <= 'd0;
		aud_bclk <= 'd0;
	end
	else begin
		bclk_cnt <= bclk_cnt + 1'b1;
		if(bclk_cnt=='d0) aud_bclk <= ~aud_bclk;
	end
		
end  

always @(negedge aud_bclk or negedge rst_n) begin
	if(!rst_n)begin
		lrc_cnt <= 5'd0;
		aud_lrc <= 1'd0;
	end
	else begin
		lrc_cnt <= lrc_cnt +1'b1;
		if(lrc_cnt == 'd0) aud_lrc<=~aud_lrc;
	end

end

always @(negedge clk or negedge rst_n) begin
	if(!rst_n)begin
		mclk_cnt <= 2'd0;
		aud_mclk <= 1'd0;
	end
	else begin
		mclk_cnt <= mclk_cnt +1'b1;
		if(mclk_cnt == 'd0) aud_mclk<=~aud_mclk;
	end

end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	
endmodule 
