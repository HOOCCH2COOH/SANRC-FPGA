//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           wm8978_ctrl
// Last modified Date:  2018/05/24 16:20:57
// Last Version:        V1.0
// Descriptions:        WM8978控制模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/05/24 16:21:23
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
`timescale 10ns/10ns
module WMC(
    input                 clk        ,   // 时钟信号
    input                 rst_n      ,   // 复位信号
    
    //audio interface(mast  
    input                 aud_bclk   ,   // WM8978位时钟
    input                 aud_lrc    ,   // 对齐信号
    input                 aud_adcdat ,   // 音频输入
    output                aud_dacdat ,   // 音频输出
    
	 input    signed [15:0] audio_left_o,
	 input    signed [15:0] audio_right_o,
	 
	 output   signed [15:0] audio_left_i,
	 output   signed [15:0] audio_right_i,
	 output                audio_rx_down,
    //control interfac  
    output                aud_scl    ,   
    inout                 aud_sda    
);

//parameter define
parameter    WL = 6'd16;                // word length音频字长定义

wm8978_config #(
    .WL             (WL)
) u_wm8978_config(
    .clk            (clk),              // 时钟信号
    .rst_n          (rst_n),            // 复位信号
        
    .aud_scl        (aud_scl),          // WM8978的SCL时钟
    .aud_sda        (aud_sda)           // WM8978的SDA信号
);

ARC #(
    .WL             (WL)
) u_ARC(
    .clk            (clk),              // 时钟信号
    .rst_n          (rst_n),            // 复位信号
    
	 .aud_bclk	     (aud_bclk),
	 .aud_lrc	     (aud_lrc),
	 .aud_adcdat	  (aud_adcdat),
	 
	 .audio_left_i   (audio_left_i),
	 .audio_right_i  (audio_right_i),
	 .audio_rx_down  (audio_rx_down)
);

ASC #(
    .WL             (WL)
) u_ASC(
    .rst_n          (rst_n),            // 复位信号
    
	 .aud_bclk	     (aud_bclk),
	 .aud_lrc	     (aud_lrc),
	 .aud_dacdat     (aud_dacdat),
	 
	 .audio_left_o	  (audio_left_o),
	 .audio_right_o  (audio_right_o) 
);


endmodule 