/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name: Single Active Noise Reduction Contral
 *
 *Time: First 20210913; Last 
 *
 *Author: XuQing
 *
 *Describe: 已解决Yn断点问题，降噪效果较好
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
`include "../rtl/macro.v"
module SANRC(
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/
    input           sys_clk   ,            
    input           sys_rst_n ,            
/*-------------------------------------*/
    //wm8978 audio interface (master mode)
    output          aud_bclk  ,           
    output          aud_lrc   ,    
    output          aud_mclk  ,          
    output          aud_dacdat,           
    
    //wm8978 control interface
    output          aud_scl   ,            
    inout           aud_sda   ,
	 
	 //mic
	 input           mic_sd_l  ,
	 output          mic_bclk_l, 
    output          mic_lrc_l,
	 output          mic_chan_l,
	 
	 input           mic_sd_r  ,
    output          mic_bclk_r, 	
    output          mic_lrc_r,
	 output          mic_chan_r,
	 
	 //Logic analyzer measurement
	 output          mic_sd_l_Logic,
	 output          mic_sd_r_Logic,
	 output          Triger_Logic,
	 
	 
	 
	 //Key test
	 input           Key0     
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


wire        [11:0] cyc_cnt;
wire               OFZ_ok;
wire               rst_delay_n;


wire signed [15:0] mic_data_l;
wire signed [15:0] mic_data_r;
wire signed [15:0] audio_left_o;
wire signed [15:0] audio_right_o;
wire               audio_rx_down;  
wire signed [15:0] audio_right_o_key;
//MULTI WIRE

//mic
assign mic_bclk_l = aud_bclk;
assign mic_lrc_l  = aud_lrc;
assign mic_chan_l = 'b0;

assign mic_bclk_r = aud_bclk;
assign mic_lrc_r  = aud_lrc;
assign mic_chan_r = 'b0;


/**/`ifdef HARD /**/
wire               mic_l;
wire               mic_r;
assign mic_sd_l_Logic = mic_l;   
assign mic_sd_r_Logic = mic_r;  
/**/`else       /**/   
assign mic_sd_l_Logic = mic_sd_l;    
assign mic_sd_r_Logic = mic_sd_r;   
/**/`endif      /**/   


assign Triger_Logic = cyc_cnt=='d1;

assign audio_right_o_key = Key0 ? audio_right_o:'d0;
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/
WMC u_WMC(
    .clk                (sys_clk    ),        // 时钟信号
    .rst_n              (rst_delay_n),        // 复位信号

    .aud_bclk           (aud_bclk   ),        // WM8978位时钟
    .aud_lrc            (aud_lrc    ),        // 对齐信号
    .aud_adcdat         (),       
    .aud_dacdat         (aud_dacdat ),        // 音频输出
    
	 .audio_left_i       (),
	 .audio_right_i      (),
	 .audio_left_o       (audio_left_o),       /*input*/   
	 .audio_right_o      (audio_right_o_key),  /*input*/   
	
	 .audio_rx_down      (),
	 
    .aud_scl            (aud_scl    ),  
    .aud_sda            (aud_sda    )
);

ANC u_ANC(
	 .cyc_cnt            (cyc_cnt),
	 .OFZ_ok             (OFZ_ok),           /*output*/ 

    .clk                (sys_clk    ),   
    .rst_n              (rst_delay_n), 
	 
    .audio_rx_down      (audio_rx_down),   
	    
    .audio_left_i       (mic_data_l),       /*input*/   
    .audio_right_i      (mic_data_r),       /*input*/   
    .audio_left_o       (audio_left_o),     /*output*/   
	 .audio_right_o      (audio_right_o)     /*output*/
);

MIIS u_MIIS(
    .clk                (sys_clk), 
    .rst_n              (rst_delay_n), 
	 
/**/`ifdef HARD /**/
    .mic_sd_l           (mic_l), 
	 .mic_sd_r           (mic_r), 
/**/`else       /**/   
	 .mic_sd_l           (mic_sd_l), 
	 .mic_sd_r           (mic_sd_r), 
/**/`endif      /**/   

    .mic_sck            (aud_bclk),      
    .mic_ws             (aud_lrc),  
	 
    .mic_data_l         (mic_data_l),
	 .mic_data_r         (mic_data_r),
	 .rx_done_pedge      (audio_rx_down)
);

//After the MIC module clock is reset, 
//it takes a certain time to reach the steady state. Rst_n cannot be equal to RST_delay_n  
IISC u_IISC(
    .clk                (sys_clk    ),
    .rst_n              (sys_rst_n), 
	 
	 .aud_mclk           (aud_mclk),   //12.5M
    .aud_bclk           (aud_bclk), 
	 .aud_lrc            (aud_lrc)
);


OFZ_MIC_TEST u_OFZ_MIC_TEST(
	 .rst_n              (rst_delay_n),
    .cyc_cnt            (cyc_cnt), 
	 .OFZ_ok             (OFZ_ok  ), 
	 .bclk               (aud_bclk  ), 
	 .lrc                (aud_lrc  ), 
	 .audio_rx_down      (audio_rx_down),
	 
	 .mic_l              (mic_l),
	 .mic_r              (mic_r)
);


DRST u_DRST(
	 .clk                (sys_clk    ),
    .rst_n              (sys_rst_n  ), 
	 .rst_delay_n        (rst_delay_n)
);
endmodule 
