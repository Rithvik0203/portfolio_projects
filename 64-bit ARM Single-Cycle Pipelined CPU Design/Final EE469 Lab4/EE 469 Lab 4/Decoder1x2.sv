// This is a 1 to 2 decoder that is built from one not gate and two and gates.
// Select between two outcomes based on the enable signal.

`timescale 1ns/10ps

module Decoder1x2(in, en, out);
	input logic in;
	input logic en;
	output logic [1:0] out;
	
	logic inv_in;
	
	not #(50) not2 (inv_in, in);
	and #(50) and1 (out[0], inv_in, en);
	and #(50) and2 (out[1], in, en);

endmodule

//module Decoder1x2(in, sel, en, out);
//	input logic in, sel, en;
//	output logic [1:0] out;
//	
//	logic inv_in;
//	
//	not #(50) not1 (inv_in, sel);
//	and #(50) and1 (out[0], inv_in, in, en);
//	and #(50) and2 (out[1], in, sel, en);
//
//endmodule	

