
module EPCS (
	clkin,
	read,
	rden,
	addr,
	reset,
	dataout,
	busy,
	data_valid,
	write,
	datain,
	illegal_write,
	wren);	

	input		clkin;
	input		read;
	input		rden;
	input	[23:0]	addr;
	input		reset;
	output	[7:0]	dataout;
	output		busy;
	output		data_valid;
	input		write;
	input	[7:0]	datain;
	output		illegal_write;
	input		wren;
endmodule
