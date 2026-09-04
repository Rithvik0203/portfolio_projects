// This is a 3 to 8 decoder and uses one 1 to 2 decoder and two 2 to 4 decoders.
// Select one of eight outputs based on the enable signal.

`timescale 1ns/10ps

module Decoder3x8(in, out, en);
	input logic [2:0] in;
	input logic en;
	output logic [7:0] out;
	logic [1:0] w;
	
	Decoder1x2 dec1(.in(in[2]), .en(en), .out(w[1:0]));
	Decoder2x4 dec2(.in(in[1:0]), .out(out[3:0]), .en(w[0]));
	Decoder2x4 dec3(.in(in[1:0]), .out(out[7:4]), .en(w[1]));
	
//	Decoder2x4 dec1 (in(), out(), en(), sel());
	
endmodule 

