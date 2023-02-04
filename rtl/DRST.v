/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name: MIC I2S
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
module DRST(
        input                    clk,
        input                    rst_n,

        output reg               rst_delay_n
    );

/**/`ifdef SIM/**/
parameter DELAY_TIME = 32'd1500;       //delay about 30us
/**/`else/**/
parameter DELAY_TIME = 32'd25000000;   //delay about 500ms
/**/`endif/**/

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
reg [31:0]  reg_cnt;
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
		reg_cnt <= 32'd0;
		rst_delay_n <= 1'b0;
  end
  else begin
		if(reg_cnt==DELAY_TIME-1'b1) begin
			 rst_delay_n <= 1'b1;
		end
		else
			 reg_cnt <= reg_cnt+1'b1;
  end
end

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/


















endmodule

