/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:
 *
 *Time:
 *
 *Author:
 *
 *Describe:
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
`include "../rtl/macro.v"
module SPI
(
    input                       clk, 
    input                       rst_n,


    
	 input                       ssck, 
    input                       miso, 
	 output      reg             mosi,
	 output      reg             cs
    );

always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        mosi <=  1'b1;
        cs <= 1'd0;
    end
    else
        mosi <=  1'b0;
        cs <= 1'd1;
end

endmodule 
