// This is the top level where the xor, and, and or all are called 64 times then uses the
// 64 by 8to1 mux to give an output of 64 bit result.

`timescale 1ns/10ps

module ARMALU (A, B, cntrl, result, negative, zero, overflow, carry_out); 
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	output logic [63:0] result;
	output logic zero, overflow, carry_out, negative;

	logic [63:0] XOR_result;
	logic [63:0] AND_result;
	logic [63:0] OR_result;
	
	genvar i;
	generate 
		for (i = 0; i < 64; i++) begin: gates64 
			xor #(50) (XOR_result[i], A[i], B[i]);
			and #(50) (AND_result[i], A[i], B[i]);
			or  #(50) (OR_result[i], A[i], B[i]);
		end
	endgenerate
	
	
	logic [63:0] S;
							
	AdderSubtractor add_sub (.A, .B, .CTRL(cntrl[0]), .cout(carry_out), .S, .overflow);
	
	MUX64x8x1 mu1 (.B(B), .XOR_result(XOR_result), .AND_result(AND_result), .OR_result(OR_result), .ADD(S), .SUB(S), .sel(cntrl), .out(result));

	assign negative = result[63];
	
	zero_flag zf (.result, .zero);
	
endmodule 
