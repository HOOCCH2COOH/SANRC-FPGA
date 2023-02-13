`timescale 10ns/10ns
module  SANRC_tb;
  
parameter  T = 20;            //50M        
            
                
reg                 clk;  
reg                 rst_n;  
initial begin
    clk            = 'b0;
    rst_n          = 'b0;

    #(T+1)  rst_n  = 'b1;    
    #9;
	 
end

always #(T/2) clk = ~clk;

SANRC u_SANRC(
	.sys_clk          (clk),       
	.sys_rst_n        (rst_n),      
	 
	.aud_bclk         (),   
	.aud_mclk         (),   
	.aud_lrc          (),    
	.aud_dacdat       (), 
	
	.aud_scl          (),
	.aud_sda          (),

	.mic_sd_ref         (),
	.mic_sck_ref        (),
	.mic_ws_ref         (),
	
	.mic_sd_en1         (),
	.mic_sck_en1        (),
	.mic_ws_en1         (),
	
	.mic_sd_en2         (),
	.mic_sck_en2        (),
	.mic_ws_en2         (),
	
	.mic_sd_bn1         (),
	.mic_sck_bn1        (),
	.mic_ws_bn1         (),
	
	.mic_sd_bn2         (),
	.mic_sck_bn2        (),
	.mic_ws_bn2         (),

	 
	.mic_sd_l_Logic   (),
	.mic_sd_r_Logic   (),
	.Triger_Logic     (),
	.dacdat_Logic   (),

	
	.can_data   (),
	.can_clk   (),
	.can_int     (),
	.can_wr     (),
	.can_rd     (),
	.can_cs     (),
	.can_ale     (),
	.can_en     (),
	.can_rst     (),
	.led_0     (),
	.led_1     (),
	
	.falut_en1   (),
	.falut_en2   (),
	.mute_en1     (),
	.mute_en2     (),
	
	.Key0             ('b1)
  
	);          


endmodule

