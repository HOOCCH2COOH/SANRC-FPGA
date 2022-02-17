module ARC(  
	//system reset
	input                    clk       ,         // 时钟信号
	input                    rst_n     ,         // 复位信号

	//wm8978 interface
	input                    aud_bclk  ,         // WM8978位时钟
	input                    aud_lrc   ,         // 对齐信号
	input                    aud_adcdat,
	
	output reg signed [15:0] audio_left_i,
	output reg signed [15:0] audio_right_i,
	output                   audio_rx_down

);

//parameter define
parameter    WL = 6'd16;                // word length音频字长定义  



wire        rx_done;
reg         rx_done_d0;
reg         rx_done_d1;
always @(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
       rx_done_d0 <= 1'b0;
		 rx_done_d1 <= 1'b0;
	end
   else begin
       rx_done_d0 <= rx_done;
		 rx_done_d1 <= rx_done_d0;
	end
end
assign   audio_rx_down = rx_done_d0 & ~rx_done_d1 & aud_lrc;


wire [31:0] adc_data;
always @(posedge aud_bclk or negedge rst_n) begin
	if(!rst_n)begin
		audio_left_i  <= 'd0;
		audio_right_i <= 'd0;
	end
	else if(rx_done) begin
		if(!aud_lrc) audio_left_i <= adc_data[15:0];
	   else audio_right_i <= adc_data[15:0];
	end
end  
//例化WM8978音频接收模块
AR #(
    .WL             (WL)
) u_AR(    
    .rst_n          (rst_n),            // 复位信号
    
    .aud_bclk       (aud_bclk),         // WM8978位时钟
    .aud_lrc        (aud_lrc),          // 对齐信号
    .aud_adcdat     (aud_adcdat),       // 音频输入
        
    .adc_data       (adc_data),    // FPGA接收的数据
    .rx_done        (rx_done)     // FPGA接收数据完成
);


endmodule
