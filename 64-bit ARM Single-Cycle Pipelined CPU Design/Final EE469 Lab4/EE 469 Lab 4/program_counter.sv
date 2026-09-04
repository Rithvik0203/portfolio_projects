// This program shows what step or instruction to run based on its address
`timescale 1ns/10ps

module program_counter (clk, reset, out, PCMuxSel, ShifterIn, inp);
	input logic clk, reset, PCMuxSel;
	input logic [63:0] ShifterIn;
	output logic [63:0] out;
	input logic [63:0] inp;
	
	logic [63:0] in;
	logic [63:0] AdderOut1, AdderOut2, PlusFour, carry_w1, carry_w2;
	logic [63:0] next_PC_val;
	logic [63:0] oldOut;
	
	assign PlusFour = 64'd4;
	
	// These two full adders take the first bit so that it has a carry in and carry out
	FullAdder FA01(.cin(1'b0), .a(out[0]), .b(PlusFour[0]), .s(AdderOut1[0]), .cout(carry_w1[0]));		// +4 adder
	FullAdder FA02(.cin(1'b0), .a(out[0]), .b(ShifterIn[0]), .s(AdderOut2[0]), .cout(carry_w2[0]));		// shifter adder

	// This 64 register is a DFFEnable that holds the next value of the full adder
	register64 reg64 (.in(next_PC_val), .out, .en(1'b1), .clk);
	//register64 reg64oldout (.in(out), .out(oldOut), .en(1'b1), .clk);
	genvar i;
	generate 
	
	// Loops through the so that PC adds by 4
      for (i = 1; i < 64; i++) begin: PC
			FullAdder FA1(.cin(carry_w1[i-1]), .a(out[i]), .b(PlusFour[i]), .s(AdderOut1[i]), .cout(carry_w1[i]));
			//FullAdder FA2(.cin(carry_w2[i-1]), .a(oldOut[i]), .b(ShifterIn[i]), .s(AdderOut2[i]), .cout(carry_w2[i]));
			FullAdder FA2(.cin(carry_w2[i-1]), .a(inp[i]), .b(ShifterIn[i]), .s(AdderOut2[i]), .cout(carry_w2[i]));

		end
	endgenerate
	
	// Outputs the final result
	MUX64x2x1 mu1 (.out(in), .sel(PCMuxSel), .a(AdderOut1), .b(AdderOut2));	
	
	// This resets the PC to 0 to make sure it isn't adding more than 4
	MUX64x2x1 resetter (.out(next_PC_val), .b(64'd0), .a(in), .sel(reset));
	
endmodule 