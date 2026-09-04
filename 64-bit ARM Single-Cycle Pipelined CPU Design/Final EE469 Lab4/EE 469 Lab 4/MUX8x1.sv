// This is a 8 to 1 multiplexer that selects one of eight input signals
// based on a 2-bit selection signal (sel) and forwards the selected input to the output (out).

`timescale 1ns/10ps

module MUX8x1 (out, sel, in);
	input logic [7:0] in;
	input logic [2:0] sel;
	output logic out;
	wire [1:0] w;
	 
	MUX4x1 mu1 (.out(w[0]), .sel(sel[1:0]), .in(in[3:0]));
	MUX4x1 mu2 (.out(w[1]), .sel(sel[1:0]), .in(in[7:4]));
	MUX2x1 mu3 (.sel(sel[2]), .a(w[0]), .b(w[1]), .out(out));

endmodule 