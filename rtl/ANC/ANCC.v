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
module ANCC
#(
	parameter INP_OUT_WIDTH
)
(
    input                    clk, 
    input                    rst_n,
	
	 input                    audio_rx_down,   //xn, en finished flag
	 
	 //inp_lms
	 output reg        [6:0]  inp_frame,
	 output reg        [6:0]  lms_frame,
	 output                   inp_state,
	 input      signed [INP_OUT_WIDTH-1:0] inp_out,
	 
	 
	 //ram_rom
	 output            [6:0]  wz_addr,
	 output            [6:0]  sn_addr,
	 output                   sn_wren,
	 output            [6:0]  xn_addr,

	
	
	 output reg signed [INP_OUT_WIDTH-1:0] yn
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
reg            [1:0]  clk_cnt;
reg            [6:0]  sn_cnt;
reg            [6:0]  xn_cnt;
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	


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
reg [4:0]    s_cur ;
reg [4:0]    s_next ;
localparam  S_START        = 5'h01,
				S_INP_1        = 5'h02,
				S_INP_2        = 5'h04,
				S_LMS          = 5'h08;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) s_cur <= S_START;
	else s_cur <= s_next;
end  
/*-----------------------------------------------------------------------------*/
always @(*) begin  
	case(s_cur)
		S_START:begin
			if(rst_n && audio_rx_down) s_next = S_INP_1;
			else s_next = S_START;
		end
		S_INP_1:begin
			if(inp_frame == 'd127)  s_next = S_INP_2;
			else s_next = S_INP_1;
		end
		S_INP_2:begin
			if(inp_frame == 'd127)  s_next = S_LMS;
			else s_next = S_INP_2;
		end
		S_LMS:begin
			if(lms_frame == 'd127)  s_next = S_START;
			else s_next = S_LMS;
		end
		default: s_next = S_START ;
	endcase
end
/*-----------------------------------------------------------------------------*/
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		inp_frame <= 'd0;
		sn_cnt <= 'd0;
		xn_cnt <= 'd0;
		lms_frame <= 'd0;
		clk_cnt <= 'd0;
		yn <= 'd0;
	end
	else begin
		case(s_cur)
			S_START:begin
				
			end
			S_INP_1:begin
				if(inp_frame <= 'd126) inp_frame <= inp_frame + 1'b1;
				else begin
					inp_frame <= 'd0;
					yn <= inp_out;
				end
			end
			S_INP_2:begin
				if(inp_frame <= 'd126) inp_frame <= inp_frame + 1'b1;
				else begin
					inp_frame <= 'd0;
				end
			end
			S_LMS:begin
				if(clk_cnt < 2'd2) clk_cnt <= clk_cnt + 1'b1; 
				else begin
					clk_cnt <= 'd0;
					lms_frame <= lms_frame +1'b1;
				end
				
				
				if(lms_frame == 'd127) begin
					sn_cnt <= sn_cnt + 1'b1;
					xn_cnt <= xn_cnt + 1'b1;
					lms_frame <= 'd0;
				end
			end
			default: ;
		endcase
	end
end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/

//addr_contral
assign xn_addr     = inp_frame ? xn_cnt - inp_frame: xn_cnt;            //xn read in INP state; xn write at audio_rx_down set 1.   
assign sn_addr     = lms_frame ? sn_cnt - lms_frame + 1'b1 : sn_cnt;    //sn write in INP state; sn read in LMS state. 
assign wz_addr     = lms_frame ? lms_frame - 1'b1 : inp_frame;          //wz write/read in LMS state; wz read in INP state. 
assign sn_wren     = inp_state && inp_frame == 'd127;


assign inp_state   = s_cur == S_INP_2 ? 1'b1:1'b0;



endmodule 
