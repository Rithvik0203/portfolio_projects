// It's a DFF but with an enable. The enable allows for whatever is being written to pass through.

`timescale 1ns/10ps

module DFFEnable(q, d, reset, clk, enable);
	output reg q;
	input d, reset, clk, enable; // d is external input
	wire temp;
	
	MUX2x1 mu1 (.sel(enable), .a(q), .b(d), .out(temp));
	D_FF de (.q(q), .d(temp), .reset(reset), .clk(clk));

endmodule 