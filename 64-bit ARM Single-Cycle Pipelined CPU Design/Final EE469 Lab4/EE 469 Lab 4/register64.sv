// The register64 module represents a 64-bit register that stores a 64-bit input (in) and provides a 64-bit 
// output (out). The register is enabled for writing based on the en signal and operates synchronously with the clock (clk).

`timescale 1ns/10ps

module register64 (in, out, en, clk);
	input logic en, clk;
	input logic [63:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate 
		// Generate 64 instances of the DFFEnable module for each bit of the 64-bit register
		for (i = 0; i < 64; i++) begin: reg64s
			DFFEnable d(.q(out[i]), .d(in[i]), .reset(1'b0), .clk(clk), .enable(en));
		end
	endgenerate
	
endmodule


