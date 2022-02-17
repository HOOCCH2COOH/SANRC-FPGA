module ASC(  
	//system reset    
	input                     rst_n,    

	//wm8978 interface
	input                     aud_bclk,      
	input                     aud_lrc,    
	output                    aud_dacdat,
	
	input      signed [15:0]  audio_left_o,
	input      signed [15:0]  audio_right_o
);

parameter  WL = 6'd16;
reg          [15:0]  audio_o;

always @(posedge aud_bclk or negedge rst_n) begin
	if(!rst_n) begin
		audio_o <= 'd0;
	end
	else if(!aud_lrc) audio_o <= audio_left_o;
	else audio_o <= audio_right_o;
end  

AS #(
    .WL             (WL)
) u_AS(
    .rst_n          (rst_n),            // 复位信号
        
    .aud_bclk       (aud_bclk),         // WM8978位时钟
    .aud_lrc        (aud_lrc),          // 对齐信号
    .aud_dacdat     (aud_dacdat),       // 音频数据输出
        
    .dac_data       (audio_o)
);


endmodule











