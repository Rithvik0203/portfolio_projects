// This module takes in a 2to1 mux and generates it 64 times to have 64 bits for each in and out.

`timescale 1ns/10ps

module MUX64x2x1 (out, sel, a, b);
	input logic sel;
	input logic [63:0] a, b;
	output logic [63:0] out;
	
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: times64
			MUX2x1 mu1(.sel, .a(a[i]), .b(b[i]), .out(out[i]));
		end
	endgenerate
	
endmodule 