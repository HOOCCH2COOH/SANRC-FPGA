
`timescale 10ns/10ns
module OFZ_MIC_TEST (   
    //system reset
    input                  rst_n,   
	 input       [11:0]     cyc_cnt,
	 input                  OFZ_ok,
    //wm8978 interface
    input                  bclk, 
    input                  lrc,  
	 input                  audio_rx_down,
	 output   reg           mic_l,
	 output   reg           mic_r
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
wire        [15:0] xn_data;
wire        [15:0] en_data;
wire        [15:0] dn_data;

wire signed [23:0] mic_left_i;
wire signed [23:0] mic_right_i;

assign  mic_left_i  = ~OFZ_ok ? 
							'd0:
							 {xn_data[15],
							 xn_data[15],
							 xn_data[15],
							 xn_data[15],
							 xn_data[15:0],
							 4'd0};
							 
							 
assign  mic_right_i = ~OFZ_ok ? 
							{dn_data[15],
							 dn_data[15],
							 dn_data[15],
							 dn_data[15],
							 dn_data[15:0],
							 4'd0}                             :
							 {en_data[15],
							 en_data[15],
							 en_data[15],
							 en_data[15],
							 en_data[15:0],
							 4'd0};

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	


/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
 *Name:
 *
 *Reg&Wire:
 *
 *Function:LRC信号的边沿检测
 *
 *Author:
 *                                                                @rainbowsmile-
 ------------------------------------------------------------------------------*/
wire           lrc_edge;
reg            lrc_d0;  
reg     [11:0] ANC_cyc_cnt;

assign  lrc_edge = ~lrc & lrc_d0;   //negedge
always @(posedge bclk or negedge rst_n) begin
    if(!rst_n) lrc_d0 <= 1'b0;
    else       lrc_d0 <= lrc;
end


always @(posedge audio_rx_down or negedge rst_n) begin
    if(!rst_n) ANC_cyc_cnt <= 'b0;
	 else if(~OFZ_ok) ANC_cyc_cnt <= 'b0;
    else ANC_cyc_cnt <= ANC_cyc_cnt + 1'b1;
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
reg    [ 5:0]    tx_cnt;  
always @(posedge bclk or negedge rst_n) begin
    if(!rst_n) begin
        tx_cnt       <=  6'd0;
    end
    else if(lrc_edge == 1'b1) begin
        tx_cnt       <= 6'd0;
    end
    else if(tx_cnt < 6'd25)
        tx_cnt <= tx_cnt + 1'b1;
end


//把预发送的音频数据串行发送出去
always @(negedge bclk or negedge rst_n) begin
   if(!rst_n) begin
		 mic_l <= 1'b0;
		 mic_r <= 1'b0;
   end
   else if(tx_cnt < 'd24)begin
		 mic_l <= mic_left_i['d23 - tx_cnt];
		 mic_r <= mic_right_i['d23 - tx_cnt];
	end
   else begin
		 mic_l <= 1'b0;
		 mic_r <= 1'b0;
	end
end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	

dn_rom u_dn_rom(
	.clock         (bclk),
	.address       (cyc_cnt),         
	
	.q             (dn_data)             //16
	);

xn_rom u_xn_rom(
	.clock         (bclk),
	.address       (ANC_cyc_cnt),         
	
	.q             (xn_data)             //16
	);

en_rom u_en_rom(
	.clock         (bclk),
	.address       (ANC_cyc_cnt),         
	
	.q             (en_data)             //16
	);

	
endmodule
