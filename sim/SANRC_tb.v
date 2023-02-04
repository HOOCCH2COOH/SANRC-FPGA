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

	.mic_sd_l         (),
	.mic_sck_l       (),
	.mic_ws_l        (),
	.mic_chan_l       (),
	
	.mic_sd_r         (),
	.mic_sck_r       (),
	.mic_ws_r        (),
	.mic_chan_r       (),
	
	.mic_sd_l_Logic   (),
	.mic_sd_r_Logic   (),
	.Triger_Logic     (),
	
	.Key0             ('b1)
	);          



endmodule

