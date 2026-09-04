
module Pipelined_register_64(in, out, reset, clk, en);
	input logic en, clk, reset;
	input logic [63:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate 
		// Generate 64 instances of the DFFEnable module for each bit of the 64-bit register
		for (i = 0; i < 64; i++) begin: pipe
			DFFEnable pipe(.q(out[i]), .d(in[i]), .reset(1'b0), .clk, .enable(en));
		end
	endgenerate

endmodule
