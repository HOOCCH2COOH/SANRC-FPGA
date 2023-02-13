/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:Active Noise Reduction Control
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
module ANC(
    input                       clk, 
    input                       rst_n,
	 
	 input                       audio_rx_down,  //xn, en finished flag
	 
	 input      signed [15:0]    audio_ref_i,    //xn,xn
	 input      signed [15:0]    audio_en1_i,    //en1,en
	 input      signed [15:0]    audio_en2_i,    //en2
	 
	 output     signed [15:0]    audio_yn1_o,    //fn
	 output     signed [15:0]    audio_yn2_o ,   //yn        
	 output            [11:0]    cyc_cnt,	
	 output                      OFZ_ok
    );

	 
//After the bit width is changed, to be sure the bit width of RAM is changed
localparam WZ_WIDTH  = 5'd28;	 
localparam INP_IN_WIDTH  = WZ_WIDTH;	
localparam INP_OUT_WIDTH = INP_IN_WIDTH+'d16+'d4;	
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

//sz_contral
wire  signed  [19:0]  sz;
wire  signed  [19:0]  sz_next;
wire          [6:0]   sz_addr;
wire          [6:0]   sz_OFZ_addr;       //From OFZ
wire                  sz_wren;

//sn_contral
wire  signed  [INP_OUT_WIDTH-1:0]  sn;
wire          [6:0]   sn_addr;
wire                  sn_wren;

//xn_contral
wire  signed  [15:0]  xn;
wire          [6:0]   xn_addr;

//wz_contral
wire  signed  [WZ_WIDTH-1:0]  wz;
wire  signed  [WZ_WIDTH-1:0]  wz_next;
wire          [6:0]   wz_addr;
wire                  wz_wren;

//inp_contral
wire          [6:0]   inp_frame;
wire  signed          inp_state;
wire  signed  [INP_IN_WIDTH-1:0]   inp_in;
wire  signed  [INP_OUT_WIDTH-1:0]  inp_out;

//lms_contral
wire          [6:0]   lms_frame;

//
wire  signed  [15:0]  vn;   
wire  signed  [INP_OUT_WIDTH-1:0]  yn;        

wire          [15:0]   wire_un;  
wire                   wire_start_pedge;
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	
assign sz_addr       = OFZ_ok    ? inp_frame : sz_OFZ_addr;
//拟合阶段输出白噪声，非拟合阶段输出降噪声波
assign audio_yn2_o = OFZ_ok    ? (yn[INP_OUT_WIDTH-1-:16]) : vn ;
assign inp_in        = inp_state ?        sz : wz;

ANCC 
#(
	.INP_OUT_WIDTH (INP_OUT_WIDTH)
)
u_ANCC(
	.clk           (clk),
	.rst_n         (OFZ_ok && rst_n),
	
	.audio_rx_down (audio_rx_down),
	
	.inp_state     (inp_state),
	.inp_out       (inp_out),
	.inp_frame     (inp_frame),
	.lms_frame     (lms_frame),
	
	.wz_addr       (wz_addr),
	.xn_addr       (xn_addr),
	.sn_addr       (sn_addr),
	.sn_wren       (sn_wren),
	
	.yn            (yn)
	);

OFZ u_OFZ(
	.cyc_cnt       (cyc_cnt),        /*output*/

	.audio_test_o  (audio_yn1_o),
	
	.clk           (clk && !OFZ_ok),
	.rst_n         (rst_n),
	.audio_rx_down (audio_rx_down),
	
	.en_temp       (audio_en1_i),
	.vn_speaker            (vn),
	
	.OFZ_ok        (OFZ_ok),
	//sz_ram
	.sz_wren       (sz_wren),
	.sz_addr       (sz_OFZ_addr),
	.sz_next       (sz_next),
	.sz            (sz)
	);
	
ANC_INP 
#(
	.INP_IN_WIDTH  (INP_IN_WIDTH),
	.INP_OUT_WIDTH	(INP_OUT_WIDTH)
)u_ANC_INP(
	.clk           (clk),
	.rst_n         (rst_n),
	
	.frame         (inp_frame),  
	.in_1          (xn),         
	.in_2          (inp_in),     
	.out           (inp_out)    
	);
	
ANC_LMS 
#(
	.WZ_WIDTH      (WZ_WIDTH),
	.INP_OUT_WIDTH	(INP_OUT_WIDTH)
)u_ANC_LMS(
	.clk           (clk),
	.rst_n         (rst_n),
	
	.lms_frame     (lms_frame),
	.lms_v         (sn),            //bits=S+53
	.lms_e         (audio_en1_i),   //bits=S+15
	
	
	.w_ok          (wz_wren),
	.lms_w         (wz),            //bits=S+31
	.lms_w_next    (wz_next),       //bits=S+31
	.un            (wire_un)
	);	

	
ANC_ALIT
#(
	.ALIT_A        (20),
	.ALIT_B        (20),
	.ALIT_H        (20),
	.ALIT_M        (20)
)u_ANC_ALIT(
	.clk           (clk),
	.rst_n         (rst_n),
	
	.en            (audio_en1_i),
	.un            (wire_un),
	.start_pedge   (wire_start_pedge)
	);	
	
	
//28bits*128words (28bits*126words)
wz_ram u_wz_ram(
	.clock         (clk),
	
	.address       (wz_addr),
	.data          (wz_next),
	.wren          (wz_wren),
	.q             (wz)
	);
	
//20bits*128words (20bits*126words)
sz_ram u_sz_ram(
	.clock         (clk),
	.address       (sz_addr),        
	
	.wren          (sz_wren),
	.data          (sz_next),     
	.q             (sz)           
	);
	
//48bits*128words (48bits*126words)
sn_ram u_sn_ram(
	.clock         (clk),
	.address       (sn_addr),        
	
	.wren          (sn_wren),
	.data          (inp_out),      
	.q             (sn)            
	);
	
//16bits*128words (16bits*126words)
xn_ram u_xn_ram(
	.clock         (clk),
	.address       (xn_addr),        
	
	.wren          (audio_rx_down),
	.data          (audio_ref_i), 
	.q             (xn)            
	);
	
endmodule 
