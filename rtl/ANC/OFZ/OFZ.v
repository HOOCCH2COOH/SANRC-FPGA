/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name: Offline Fit Sz
 *
 *Time: 20210910
 *
 *Author:
 *
 *Describe: This module be used to compulate the paramater sz.
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
`include "../rtl/macro.v"
module OFZ
(
    input                      clk, 
    input                      rst_n,
	 
	 input                      audio_rx_down,
	 
	 input       signed  [15:0] en_temp,    //data from right channel accepted in audio module
	 output      signed  [15:0] vn,         //send to speaker
	 
	 /*-*-*-*-*-*-*-*Test-*-*-*-*-*-*-*-*-*-*/
	 output              [11:0] cyc_cnt,
	 output              [15:0] audio_test_o,
	 /*-------------------------------------*/
	 
	 output                     OFZ_ok,     //OFZ模块的自锁信号
	 //sz_ram
	 output                     sz_wren,
	 output      signed  [6:0]  sz_addr,
	 output      signed  [19:0] sz_next,
	 input       signed  [19:0] sz
    );
	 
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
 *Name:
 *
 *Reg&Wire:
 *
 *Function:z
 *
 *Author:
 *                                                                @rainbowsmile-
 ------------------------------------------------------------------------------*/
localparam FU = 4'd5;
wire           [11:0] vn_addr;

wire           [6:0]  inp_frame;
wire           [6:0]  lms_frame;
wire  signed   [15:0] en;
wire  signed   [35:0] yn;
wire  signed   [35:0] fn;
wire                  w_ok;

wire  signed   [19:0] sz_next_temp;

//以下代码是为了保证麦克风采集的数据和拟合的结果是在扬声器稳定输出时得到的
assign sz_wren      = (cyc_cnt < ('d4095-'d255)) ? w_ok : 'd0;
assign audio_test_o = (cyc_cnt < ('d4095-'d255)) ? fn[34:19] : 'd0;
assign en           = (cyc_cnt > 'd255)  ? en_temp : 'd0;  
assign sz_next      = (cyc_cnt > 'd255)  ? sz_next_temp : 'd0;  

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	

OFZC u_OFZC(
	.clk           (clk),
	.rst_n         (rst_n),

	.start_en      (audio_rx_down),
	
	.en            (en),            //bits=S+15
	.yn            (yn),            //bits=S+53
	.fn            (fn),            //bits=S+53
	
	.OFZ_ok        (OFZ_ok),
	
	.inp_frame     (inp_frame),     //valid=[1:126]
	.lms_frame     (lms_frame),     //valid=[1:126]
	
	.vn_addr       (vn_addr),
	.sz_addr       (sz_addr),
	.cyc_cnt       (cyc_cnt)
	);

LMS 
#(
   .FU            (FU)
) u_LMS(
	.clk           (clk),
	.rst_n         (rst_n),
	
	.lms_frame     (lms_frame),     //valid=[1:126]
	.lms_v         (vn),            //bits=S+15
	.lms_e         (fn),            //bits=S+53
	
	
	.w_ok          (w_ok),          
	.lms_w         (sz),            //bits=S+31
	.lms_w_next    (sz_next_temp)   //bits=S+15
	);

INP u_INP(
	.clk           (clk),
	.rst_n         (rst_n),
	
	.frame         (inp_frame),     //valid=[1:126]
	.in_1          (vn),            //bits=S+15
	.in_2          (sz),            //bits=S+31
	.out           (yn)             //bits=S+53
	);
	
	
//16bits*8192words (16bits*8192words)
vn_rom u_vn_rom(
	.clock         (clk),
	.address       (vn_addr),         
	
	.q             (vn)             
	);
	

endmodule 
