/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name: Inner Product
 *
 *Time:
 *
 *Author:
 *
 *Describe: realize inner product of the two vector(1X30)
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
module INP(
    input                    clk, 
    input                    rst_n,
	 
	 input             [6:0]  frame,
	 input      signed [15:0] in_1,    
	 input      signed [19:0] in_2,  
	 
	 output reg signed [35:0] out
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
