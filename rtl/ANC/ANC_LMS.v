/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:
 *
 *Time:
 *
 *Author:
 *
 *
 *
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
module ANC_LMS
#(
	parameter WZ_WIDTH,
	parameter INP_OUT_WIDTH	
)
(
    input                    clk, 
    input                    rst_n,
	 
	 input             [6:0]               lms_frame,   
	 input      signed [INP_OUT_WIDTH-1:0] lms_v, 
	 input      signed [15:0]              lms_e,     
	 
	 
	 
	 //wz_ram_contral
	 input      signed [WZ_WIDTH-1:0] lms_w,
	 output reg signed [WZ_WIDTH-1:0] lms_w_next, 
	 output                   w_ok,
	 input             [15:0]         un
    );
parameter FACTOR = 4'd4;
wire                lms_valid;
assign  lms_valid = lms_frame && lms_frame <= 'd126 ? 1'b1:1'b0;
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
 *Name:LMS algorithm state machine
 *
 *Reg&Wire:@s_cur;@s_next;
 *
 *Function:The timing here is very strict, do not modify
 *
 *Author:
 *                                                                @rainbowsmile-
 ------------------------------------------------------------------------------*/
reg [2:0] s_cur;
reg [2:0] s_next;
localparam  S_READ  =4'h1,
				S_CALC  =4'h2,
				S_WRITE =4'h4;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) s_cur <= S_READ;
	else s_cur <= s_next;
end  
/*-----------------------------------------------------------------------------*/
always @(*) begin  
	if(!lms_valid) s_next = S_READ ;
	else begin
		case(s_cur)
			S_READ:  s_next = S_CALC;
			S_CALC:  s_next = S_WRITE;
			S_WRITE: s_next = S_READ;
			default: s_next = S_READ ;
		endcase
	end
end
/*-----------------------------------------------------------------------------*/ 
assign w_ok = s_cur == S_WRITE ? 1'b1:1'b0; 

wire signed  [INP_OUT_WIDTH+'d16-1:0]  mult_1;
wire signed  [WZ_WIDTH-1:0]            mult_2;

assign mult_1 = lms_e * lms_v;
assign mult_2 = mult_1>>>(32+FACTOR);

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		lms_w_next <= 'd0;
	end
	else begin
		case(s_cur)
			S_READ: ;
			S_CALC: lms_w_next <= lms_w + mult_2;
			S_WRITE:;
			default:;
		endcase
	end
end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/

endmodule 
