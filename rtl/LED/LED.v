
`timescale 10ns/10ns
`include "../rtl/macro.v"
module LED(
        input                    clk,
        input                    rst_n,

        output reg               led_0,
		  output reg               led_1
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
reg [23:0]  reg_cnt;
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
		led_0 <= 1'b0;
		led_1 <= 1'b0;
		reg_cnt <= 'd0;
  end
  else begin
		if(reg_cnt == 'b1) begin
			 led_0 <= ~led_0;
			 led_1 <= ~led_1;
		end
		
		reg_cnt <= reg_cnt+1'b1;
  end
end

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/


















endmodule

