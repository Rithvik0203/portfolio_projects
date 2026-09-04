//This module sign extends an instruction from 32 bits to 64 bits and does it based on ARM type.

`timescale 1ns/10ps

module sign_extended (in, out, ctrl);
	input logic [1:0] ctrl;
	input logic [31:0] in;
	output logic [63:0] out;
	
	logic [63:0] i_out, b_out, d_out, cb_out;
	
	
	assign i_out = {{52{in[21]}}, in[21:10]}; // I-type
	assign d_out = {{55{in[20]}}, in[20:12]}; // D-type
	assign b_out = {{38{in[25]}}, in[25:0]};	// B-type
	assign cb_out = {{45{in[23]}}, in[23:5]};	// cB-type
	
	MUX64x4x1 hi (.sel(ctrl), .in({cb_out, b_out, d_out, i_out}), .out);

endmodule 