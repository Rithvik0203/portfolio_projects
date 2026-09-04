// This is a 32 to 1 multiplexer that selects one of 32 input signals  
// based on a 5-bit selection signal (sel) and forwards the selected input to the output (out).

`timescale 1ns/10ps

module MUX32x1(in, sel, out);
	input logic [31:0] in;  
	input logic [4:0] sel;
	output logic out;
	wire [1:0] w;
 
   // Two 16-to-1 multiplexers to handle the 32 inputs
	MUX16x1 mu1 (.in(in[15:0]), .sel(sel[3:0]), .out(w[0]));
	MUX16x1 mu2 (.in(in[31:16]), .sel(sel[3:0]), .out(w[1]));
	
	// A 2-to-1 multiplexer to select between the outputs of the two 16-to-1 multiplexers
	MUX2x1  mu3 (.sel(sel[4]), .a(w[0]), .b(w[1]), .out(out));

endmodule 

//   genvar j;
//	generate
//		for (j = 0; j < 32; j++) begin: muxiter32
//			MUX16x1 mu1 (.out(w[j]), 
//							 .sel(sel[3:0]), 
//							 .in(in[j*16:j*16+15]));
//		end
//	endgenerate
//  
//  MUX2x1 mu2 (.sel(sel[4]), .a(w[0]), .b(w[1]), .out(out));