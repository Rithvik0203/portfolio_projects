// This module is an adder subractor that uses a full adder. It handles overflow and carry_out.

`timescale 1ns/10ps

module AdderSubtractor (A, B, CTRL, cout, S, overflow);
	input logic CTRL;
	input logic [63:0] A, B;
	output logic [63:0] S;
	output logic overflow, cout;
	wire [63:0] Bout;
	
	
	logic[63:0] w;
	
	//0 is adding, 1 is subtraction
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: xor64
			xor (Bout[i], CTRL, B[i]);
		end
	endgenerate
	
	FullAdder fa(.cin(CTRL), .a(A[0]), .b(Bout[0]), .s(S[0]), .cout(w[0]));
	genvar j;
	generate
		for (j = 1; j < 64; j++) begin: FA64
			FullAdder fa(.cin(w[j-1]), .a(A[j]), .b(Bout[j]), .s(S[j]), .cout(w[j]));
		end
	endgenerate
	
	// xor the overflow with the second last bit
	xor (overflow, w[63], w[62]);
	
	assign cout = w[63];
	
endmodule 