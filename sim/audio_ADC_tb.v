

module audio_ADC_tb (   
    //system reset
    input                  rst_n     ,         // 复位信号
	 input       [12:0]     cyc_cnt,
	 input                  OFZ_ok,
    //wm8978 interface
    input                  aud_bclk  ,         // WM8978位时钟
    input                  aud_lrc   ,         // 对齐信号
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
reg signed   [15:0]    OFZ_en_mem[2047:0];
reg signed   [15:0]    ANC_en_mem[2047:0];
reg signed   [15:0]    ANC_xn_mem[2047:0];

initial begin $readmemh("OFZ_en_mem.txt", OFZ_en_mem);end
initial begin $readmemh("ANC_en_mem.txt", ANC_en_mem);end
initial begin $readmemh("ANC_xn_mem.txt", ANC_xn_mem);end
/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/	
       
reg    [10:0]    ANC_cnt;

wire signed [23:0] mic_left_i;
wire signed [23:0] mic_right_i;

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
assign  mic_left_i  = OFZ_ok ? ANC_xn_mem[ANC_cnt]<<<5: 'd0;
assign  mic_right_i = OFZ_ok ? 
							{ANC_en_mem[cyc_cnt][15],
							 ANC_en_mem[cyc_cnt][15],
							 ANC_en_mem[cyc_cnt][15],
							 ANC_en_mem[cyc_cnt][15],
							 ANC_en_mem[cyc_cnt][15:0],
							 4'd0}
							 : 
							{OFZ_en_mem[cyc_cnt][15],
						    OFZ_en_mem[cyc_cnt][15],
							 OFZ_en_mem[cyc_cnt][15],
							 OFZ_en_mem[cyc_cnt][15],
							 OFZ_en_mem[cyc_cnt][15:0],
							 4'd0};

always @(posedge aud_lrc or negedge rst_n) begin
    if(!rst_n) ANC_cnt <= 'b0;
    else if(OFZ_ok) ANC_cnt <= ANC_cnt + 1'b1;
	 else ANC_cnt <= ANC_cnt;
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
wire    lrc_edge;
reg     aud_lrc_d0;  
assign  lrc_edge = ~aud_lrc & aud_lrc_d0;     // LRC信号的边沿检测
always @(posedge aud_bclk or negedge rst_n) begin
    if(!rst_n) aud_lrc_d0 <= 1'b0;
    else       aud_lrc_d0 <= aud_lrc;
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
always @(posedge aud_bclk or negedge rst_n) begin
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
always @(negedge aud_bclk or negedge rst_n) begin
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


endmodule
