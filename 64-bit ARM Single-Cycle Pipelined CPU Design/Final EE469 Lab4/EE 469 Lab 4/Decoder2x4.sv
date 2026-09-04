// This is a 2 to 4 decoder that uses three 1 to 2 decoders.
// Select one of four outputs based on the enable signal.

`timescale 1ns/10ps

module Decoder2x4(in, out, en); // , sel);
	//input logic in, en;
	//input logic [1:0] sel;
	input logic [1:0] in;
	input logic en;
	output logic [3:0] out;
	logic [1:0] w;	
	
	Decoder1x2 dec1(.in(in[1]), .en(en), .out(w));
	Decoder1x2 dec2(.in(in[0]), .en(w[0]), .out(out[1:0]));
	Decoder1x2 dec3(.in(in[0]), .en(w[1]), .out(out[3:2]));
	
//	Decoder1x2 dec1 (.in(in), .sel(sel[0]), .en(en), .out(w));
//	Decoder1x2 dec1 (.in(w[1]), .sel(sel[1]), .en(en), .out(out[1:0]));
//	Decoder1x2 dec1 (.in(w[2]), .sel(sel[1]), .en(en), .out(out[3:2]));
	
endmodule 
