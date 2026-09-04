// This module takes in a 8to1 mux and generates it 64 times to have 64 bits for each in and out.

`timescale 1ns/10ps

module MUX64x8x1 (B, XOR_result, AND_result, OR_result, ADD, SUB, sel, out);
	input logic [2:0] sel;
	input logic [63:0] B, XOR_result, AND_result, OR_result, ADD, SUB;
	output logic [63:0] out;
	
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: times64
			MUX8x1 mu1(.out(out[i]), .sel, 
						  .in({1'b0, XOR_result[i], OR_result[i], AND_result[i], SUB[i], ADD[i], 1'b0, B[i]}));
		end
	endgenerate
	
endmodule 