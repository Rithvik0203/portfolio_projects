// This is a 16 to 1 multiplexer that selects one of sixteen input signals 
// based on a 4-bit selection signal (sel) and forwards the selected input to the output (out).

`timescale 1ns/10ps

module MUX16x1(out, sel, in);
	input logic [3:0]sel;
	input logic [15:0] in;
	output out;
	wire [3:0] w;
	
	// Four 4-to-1 multiplexers to handle the 16 inputs
	MUX4x1 mu1 (.out(w[0]), .sel(sel[1:0]), .in(in[3:0]));
	MUX4x1 mu2 (.out(w[1]), .sel(sel[1:0]), .in(in[7:4]));
	MUX4x1 mu3 (.out(w[2]), .sel(sel[1:0]), .in(in[11:8]));
	MUX4x1 mu4 (.out(w[3]), .sel(sel[1:0]), .in(in[15:12]));
	
	// Another 4-to-1 multiplexer to select between the outputs of the first four multiplexers
	MUX4x1 mu5 (.out(out), .sel(sel[3:2]), .in(w[3:0]));
	
endmodule 

//   genvar j;
//	generate
//		for (j = 0; j < 16; j++) begin: muxiter16
//			MUX4x1 mu1 (.out(out), .sel(sel[1:0]), .in(in[j*4:j*4+3]));
//		end
//	endgenerate
//   MUX4x1 mu2 (.out(out), .sel(sel[1:0]), .in(w));