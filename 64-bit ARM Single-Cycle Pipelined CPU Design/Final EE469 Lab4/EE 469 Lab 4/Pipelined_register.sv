

module Pipelined_register(in, out, reset, clk, en);
	input logic en, clk, reset;
	input logic in;
	output logic out;
	
	DFFEnable pipe(.q(out), .d(in), .reset(1'b0), .clk, .enable(1'b1));


endmodule
