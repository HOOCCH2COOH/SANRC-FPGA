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
module MIIS(
	 input                    clk,
    input                    rst_n,
	 
	 input                    mic_sd_l,
	 input                    mic_sd_r,
	 input                    mic_sck,
	 input                    mic_ws,
	 
	 output reg signed [15:0] mic_data_l,
	 output reg signed [15:0] mic_data_r,
	 output                   rx_done_pedge
    );
	 
	 
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
 *Name:脉冲发生器
 *
 *Reg&Wire:
 *
 *Function:
 *
 *Author:
 *                                                                @rainbowsmile-
 ------------------------------------------------------------------------------*/
wire     mic_ws_edge ;             
reg      mic_ws_d0; 
assign   mic_ws_edge = ~mic_ws & mic_ws_d0;
always @(posedge mic_sck or negedge rst_n) begin
    if(!rst_n) mic_ws_d0 <= 1'b0;
    else       mic_ws_d0 <= mic_ws;
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
reg [ 4:0]    rx_cnt;                            // 发送数据计数
wire          rx_done;
(*noprune*)reg [23:0]    mic_data_l_temp/*synthesis noprune*/;  
(*noprune*)reg [23:0]    mic_data_r_temp/*synthesis noprune*/;

always @(posedge mic_sck or negedge rst_n) begin
    if(!rst_n) begin
        rx_cnt <= 5'd0;
    end
    else if(mic_ws_edge)
        rx_cnt <= 5'd0;
    else if(mic_ws==1'b0 && rx_cnt < 5'd27)
        rx_cnt <= rx_cnt + 1'b1;
end

always @(posedge mic_sck or negedge rst_n) begin
    if(!rst_n) begin
        mic_data_l_temp <= 24'd0;
		  mic_data_r_temp <= 24'd0;
    end
	 else if(mic_ws)begin
		  mic_data_l_temp <= 24'd0;
		  mic_data_r_temp <= 24'd0;
	 end
	 else if(rx_cnt < 5'd26) begin
        mic_data_l_temp[5'd23 - rx_cnt] <= mic_sd_l;
		  mic_data_r_temp[5'd23 - rx_cnt] <= mic_sd_r;
	end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        mic_data_l <= 16'b0;
		  mic_data_r <= 16'b0;
    end
    else if(rx_cnt == 5'd24) begin
        mic_data_l <= mic_data_l_temp[19-:16];
		  mic_data_r <= mic_data_r_temp[19-:16];
    end
end

reg    rx_done_delay;
assign rx_done = rx_cnt == 5'd26;
assign rx_done_pedge = rx_done & ~rx_done_delay;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) rx_done_delay <= 'b0;
    else       rx_done_delay <= rx_done;
end

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	
endmodule 
