
module Pipelined_register_5(in, out, reset, clk, en);
	input logic en, clk, reset;
	input logic [4:0] in;
	output logic [4:0] out;
	
	genvar i;
	generate 
		// Generate 32 instances of the DFF module for each bit of the 32-bit register
		for (i = 0; i < 5; i++) begin: pipe
			DFFEnable pipe(.q(out[i]), .d(in[i]), .reset(1'b0), .clk, .enable(1'b1));
		end
	endgenerate

endmodule
