// This is a 2 to 1 multiplexer that selects one of the two input signals (a or b) 
// based on the value of the selection signal (sel) and forwards the selected input to the output (out). 

`timescale 1ns/10ps

module MUX2x1_PARAM #(width = 64) (sel, a, b, out);
	input logic sel;
	input logic [width-1:0] a, b;
	output logic [width-1:0] out;
	
	//a is 0, b is 1
	wire [63:0] g, h, k;
	
	genvar i;
	generate
		for (i = 0; i < width; i++) begin : gen_mux2x1
			not #(50) ( k[i], sel );
			and #(50) ( g[i], k[i], a[i] ), ( h[i], sel, b[i] );
			or #(50) ( out[i], g[i], h[i] );
		end
	endgenerate
endmodule 