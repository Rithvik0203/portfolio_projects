// This is a 4 to 1 multiplexer that selects one of four input signals
// based on a 2-bit selection signal (sel) and forwards the selected input to the output (out). 

`timescale 1ns/10ps

module MUX4x1 (out, sel, in);
	output logic out;
	input logic [1:0] sel;
	input logic [3:0] in;
	wire [1:0] w;
	
	// Two 2-to-1 multiplexers select between the first two and the last two inputs
   MUX2x1 mu1 (.sel(sel[0]), .a(in[0]), .b(in[1]), .out(w[0]));
	MUX2x1 mu2 (.sel(sel[0]), .a(in[2]), .b(in[3]), .out(w[1]));
	
	// Another 2-to-1 multiplexer selects between the outputs of the first two multiplexers
	MUX2x1 mu3 (.sel(sel[1]), .a(w[0]), .b(w[1]), .out(out));

endmodule 