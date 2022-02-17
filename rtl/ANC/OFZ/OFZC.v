/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:Offline Fit Sz Control
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
module OFZC(
   input                       clk, 
   input                       rst_n,
	
	input                       start_en,
	
	input       signed  [35:0]  yn,
	input       signed  [15:0]  en,
	output reg  signed  [35:0]  fn,
	
	output reg                  OFZ_ok,
	output reg          [6:0]   inp_frame,
	output reg          [6:0]   lms_frame,
	
	output              [11:0]  vn_addr,
	output              [6:0]   sz_addr,
	
	output reg          [11:0]  cyc_cnt
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
/**/`ifdef OFZ
	if(!rst_n) OFZ_ok <= 'd0;
/**/`else
	if(!rst_n) OFZ_ok <= 'd1;
/**/`endif

	else if(cyc_cnt ==4095)  OFZ_ok <= 'd1;
end  
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
wire signed     [35:0]  en_shift;       //bits=bits of fn
assign en_shift = en<<<20;

reg [1:0]    clk_cnt;
reg [2:0]    s_cur ;
reg [2:0]    s_next ;
localparam  S_START  = 'h1,
				S_OPM    = 'h2,
				S_LMS    = 'h4;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) s_cur <= S_START;
	else s_cur <= s_next;
end  
/*-----------------------------------------------------------------------------*/
always @(*) begin  
	case(s_cur)
		S_START:begin
			if(start_en) s_next <= S_OPM;
			else s_next <= S_START;
		end
		S_OPM:begin
			if(inp_frame == 7'd127) s_next <= S_LMS;
			else s_next <= S_OPM;
		end
		S_LMS:begin
			if(lms_frame == 7'd127 && clk_cnt ==2'd2) s_next <= S_START;
			else s_next <= S_LMS;
		end
		default: s_next = S_START ;
	endcase
end
/*-----------------------------------------------------------------------------*/
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		inp_frame <= 'd0;
		lms_frame <= 'd0;
		clk_cnt <= 'd0;
		cyc_cnt <= 'd0;
		fn <= 'd0;
	end
	else begin
		case(s_cur)
			S_START:begin
				
			end
			S_OPM:begin       
				inp_frame <= inp_frame + 1'b1;
				if(inp_frame == 7'd127) fn <= en_shift - yn;
			end
			S_LMS:begin
				if(clk_cnt < 2'd2) clk_cnt <= clk_cnt + 1'b1; 
				else begin
					clk_cnt <= 1'b0;
					lms_frame <= lms_frame +1'b1;

					if(lms_frame == 7'd127) cyc_cnt <= cyc_cnt + 1'b1;
				end
			end
			default: ;
		endcase
	end
end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/


assign vn_addr = s_cur == S_LMS ? (cyc_cnt - (lms_frame - 1'b1)) : (cyc_cnt - inp_frame);
assign sz_addr = s_cur == S_LMS ? (lms_frame - 1'b1)             : (inp_frame);


endmodule 
