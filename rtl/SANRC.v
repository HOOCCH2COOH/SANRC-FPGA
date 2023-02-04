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
    output          aud_mclk  ,   //仅供给芯片的时钟     
    output          aud_dacdat,  
    //wm8978 control interface
    output          aud_scl   ,            
    inout           aud_sda   ,
	 
	 /*MIC*/
	 //mic_xn
	 input           mic_sd_ref,
    output          mic_sck_ref, 	
    output          mic_ws_ref,
	 //mic_en1
	 input           mic_sd_en1, 
	 output          mic_sck_en1,
    output          mic_ws_en1, 
	 //mic_en2
	 input           mic_sd_en2,
    output          mic_sck_en2, 	
    output          mic_ws_en2,
	 //mic_bn1
	 input           mic_sd_bn1,
    output          mic_sck_bn1, 	
    output          mic_ws_bn1,
	 //mic_bn2
	 input           mic_sd_bn2,
    output          mic_sck_bn2, 	
    output          mic_ws_bn2,
	 /*END*/
	 
	 //Logic analyzer measurement
	 output          mic_sd_l_Logic,
	 output          mic_sd_r_Logic,
	 output          Triger_Logic,

	 inout   [7:0]   can_data,
	 
	 input           can_clk,
	 input           can_int,
	 input           can_wr,
	 input           can_rd,
	 input           can_cs,
	 input           can_ale,
	 output          can_en,
	 output          can_rst,
	 
	 output          led_0,
	 output          led_1,
	 
	 input           falut_en1,
	 input           falut_en2,
	 output          mute_en1,
	 output          mute_en2,
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



wire signed [15:0] mic_data_ref;
wire signed [15:0] mic_data_en1;
wire signed [15:0] mic_data_en2;
wire signed [15:0] mic_data_bn1;
wire signed [15:0] mic_data_bn2;


wire signed [15:0] audio_yn1_o;
wire signed [15:0] audio_yn2_o;
wire               audio_rx_down;  
wire signed [15:0] audio_yn2_sel_o;
//MULTI WIRE

//mic
assign mic_sck_ref = aud_bclk;
assign mic_sck_en1 = aud_bclk;
assign mic_sck_en2 = aud_bclk;
assign mic_sck_bn1 = aud_bclk;
assign mic_sck_bn2 = aud_bclk;
assign mic_ws_ref  = aud_lrc;
assign mic_ws_en1  = aud_lrc;
assign mic_ws_en2  = aud_lrc;
assign mic_ws_bn1  = aud_lrc;
assign mic_ws_bn2  = aud_lrc;

assign mute_en1    = 0;
assign mute_en1    = 0;

/**/`ifdef HARD /**/
wire               mic_l;
wire               mic_r;
assign mic_sd_l_Logic = mic_l;   
assign mic_sd_r_Logic = mic_r;  
/**/`else       /**/   
assign mic_sd_l_Logic = mic_sd_ref;    
assign mic_sd_r_Logic = mic_sd_en1;   
/**/`endif      /**/   


assign Triger_Logic = cyc_cnt=='d1;
assign audio_yn1_sel_o = !OFZ_ok ? audio_yn1_o:'d0;  
assign audio_yn2_sel_o = Key0 ? audio_yn2_o:'d0;    //如果key为1，输出ANC模块信号；否则静音

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/
WMC u_WMC(
    .clk                (sys_clk    ),        // 时钟信号
    .rst_n              (rst_delay_n),        // 复位信号

    .aud_bclk           (aud_bclk   ),        // WM8978位时钟，所有麦克风、扬声器数字信号使用的时钟
    .aud_lrc            (aud_lrc    ),        // 对齐信号
    .aud_adcdat         (),                   // 音频输入
    .aud_dacdat         (aud_dacdat ),        // 音频输出
    
	 .audio_left_i       (),                   // 左声道输入
	 .audio_right_i      (),                   // 右声道输入
	 .audio_left_o       (audio_yn1_o),        /*input*/   
	 .audio_right_o      (audio_yn2_sel_o),    /*input*/   
	
	 .audio_rx_down      (),                   // 接收完成
	 
    .aud_scl            (aud_scl    ),        // IIC通信
    .aud_sda            (aud_sda    )         // IIC通信
);

ANC u_ANC(
	 .cyc_cnt            (cyc_cnt),
	 .OFZ_ok             (OFZ_ok),           /*output*/ 

    .clk                (sys_clk    ),   
    .rst_n              (rst_delay_n), 
	 
    .audio_rx_down      (audio_rx_down),   
	    
    .audio_ref_i        (mic_data_ref),       /*input*/   
    .audio_en1_i        (mic_data_en1),       /*input*/   
	 .audio_en2_i        (mic_data_en2),       /*input*/   
	 
    .audio_yn1_o        (audio_yn1_o),        /*output*/   
	 .audio_yn2_o        (audio_yn2_o)         /*output*/
	 
);


//麦克风采集模块
MIIS u1_MIIS(
    .clk                (sys_clk), 
    .rst_n              (rst_delay_n), 
	 
/**/`ifdef HARD /**/   //硬件仿真模式
    .mic_sd_l           (mic_l), 
	 .mic_sd_r           (mic_r), 
/**/`else       /**/   //实际降噪模式
	 .mic_sd_l           (mic_sd_ref), 
	 .mic_sd_r           (mic_sd_en1), 
/**/`endif      /**/   

    .mic_sck            (aud_bclk),      
    .mic_ws             (aud_lrc),  
	 
    .mic_data_l         (mic_data_ref),
	 .mic_data_r         (mic_data_en1),
	 .rx_done_pedge      (audio_rx_down)
);

MIIS u2_MIIS(
    .clk                (sys_clk), 
    .rst_n              (rst_delay_n), 

	 .mic_sd_l           (mic_sd_ref), 
	 .mic_sd_r           (mic_sd_en2), 

    .mic_sck            (aud_bclk),      
    .mic_ws             (aud_lrc),  
	 
    .mic_data_l         (),
	 .mic_data_r         (mic_data_en2),
	 .rx_done_pedge      ()
);

/*解串bn1和bn2麦克风数据*/
MIIS u3_MIIS(
    .clk                (sys_clk), 
    .rst_n              (rst_delay_n), 

	 .mic_sd_l           (mic_sd_bn1),         /*input*/  
	 .mic_sd_r           (mic_sd_bn2),         /*input*/  

    .mic_sck            (aud_bclk),      
    .mic_ws             (aud_lrc),  
	 
    .mic_data_l         (mic_data_bn1),       /*output*/
	 .mic_data_r         (mic_data_bn2),       /*output*/
	 .rx_done_pedge      ()                    /*output, 需要给出输出出发引脚*/
);
BOOT u_BOOT(
    .clk                (sys_clk), 
    .rst_n              (rst_delay_n), 

	 .audio_bn1_i        (mic_data_bn1),         /*input*/  
	 .audio_bn2_i        (mic_data_bn2),         /*input*/  

    .audio_yn1_i        (audio_yn1_o),      
    .audio_yn2_i        (audio_yn2_o),  
	 
    .calib_1            (),        /*output*/
	 .calib_2            (),         /*output*/
	 
	 .can_data          (can_data), 
	 
	 .can_clk           (can_clk),  
	 .can_int           (can_int),  
	 .can_wr            (can_wr),  
	 .can_rd            (can_rd),      /*input*/
	 .can_cs            (can_cs),      /*input*/
	 .can_ale           (can_ale),     /*input*/
	 
	 .can_en            (can_en),      /*output*/
	 .can_rst           (can_rst)      /*output*/
	 

	 
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

// 硬件仿真测试模块，用于输出硬件仿真的麦克风数据

OFZ_MIC_TEST u_OFZ_MIC_TEST(
	 .rst_n              (rst_delay_n),
    .cyc_cnt            (cyc_cnt),         /*input*/
	 .OFZ_ok             (OFZ_ok  ), 
	 .bclk               (aud_bclk  ), 
	 .lrc                (aud_lrc  ), 
	 .audio_rx_down      (audio_rx_down),
	 
	 .mic_l              (mic_l),           /*output*/
	 .mic_r              (mic_r)            /*output*/
);


DRST u_DRST(
	 .clk                (sys_clk    ),
    .rst_n              (sys_rst_n  ), 
	 .rst_delay_n        (rst_delay_n)
);

LED u_LED(
	 .clk                (sys_clk    ),
    .rst_n              (sys_rst_n  ), 
	 
	 .led_0              (led_0),
	 .led_1              (led_1)
);
endmodule 
