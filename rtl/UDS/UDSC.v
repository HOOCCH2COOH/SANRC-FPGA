/*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
 *Name:
 *
 *Time:
 *
 *Author:
 *
 *Describe:
 *                                                                @rainbowsmile-
 *-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-$-*/
`timescale 10ns/10ns
`include "../rtl/macro.v"
module BOOT
(
    input                       clk, 
    input                       rst_n,
	
	 input      signed [15:0]    audio_bn1_i,    //xn,xn
	
	 input      signed [15:0]    audio_bn2_i,
	 input      signed [15:0]    audio_yn1_i,
	 input      signed [15:0]    audio_yn2_i,
	 output     reg              calib_1,
	 output     reg              calib_2,
	 
	 inout             [7:0]     can_data,
	 
	 input                       can_clk,
	 input                       can_int,
	 input                       can_wr,
	 input                       can_rd,
	 input                       can_cs,
	 input                       can_ale,
	 output                      can_en,
	 output                      can_rst
    );



wire [23:0] addr;
wire [7:0]  datain;
wire [7:0]  dataout;
wire        rden;
wire        wren;
wire        illegal_write;
//EPCS u_EPCS(
//	.clkin         (clk),
//	.reset         (rst_n),        
//	
//	.read          (spi_sck),
//	.write         (spi_miso), 
//	.busy          (spi_mosi), 
//	.addr          (addr),
//	.datain        (datain),
//	.dataout       (dataout),
//	.rden          (rden),
//	.wren          (wren),
//	.illegal_write (illegal_write)
//	
//	);
	

endmodule 
