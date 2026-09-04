// This module takes in a 4to1 mux and generates it 64 times to have 64 bits for each in and out.

`timescale 1ns/10ps

module MUX64x4x1 (sel, in, out);
	input logic [1:0] sel;
	input logic [63:0] in [3:0];
	output logic [63:0] out;
	
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: times64
			MUX4x1 mu1(.out(out[i]), .sel, .in({in[3][i], in[2][i], in[1][i], in[0][i]}));
		end
	endgenerate
	
endmodule 