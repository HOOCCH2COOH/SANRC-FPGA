/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:inner product(INP)
 *
 *Time:
 *
 *Author:
 *
 *Describe:实现向量的点乘（内积）
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
module ANC_INP
#(
	parameter INP_IN_WIDTH,
	parameter INP_OUT_WIDTH	
)
(
    input                    clk, 
    input                    rst_n,
	 
	 input             [6:0]  frame,
	 input      signed [15:0] in_1,    
	 input      signed [INP_IN_WIDTH-1:0] in_2,  
	 
	 output reg signed [INP_OUT_WIDTH-1:0] out    
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
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
		out <= 'd0;
	 end
	 else if(frame && frame <= 'd126)begin
		out <= out + in_1 * in_2;
	 end
	 else out <= 'd0;
end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	



endmodule 


