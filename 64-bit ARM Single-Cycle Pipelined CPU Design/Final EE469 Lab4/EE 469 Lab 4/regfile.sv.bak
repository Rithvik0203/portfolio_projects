// TOPLEVEL - It has a 32-register with 66-bit wide registers. Allows reading from two registers and writing
// to the other at the same time.. 

`timescale 1ns/10ps

module regfile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, clk, ReadData1, ReadData2);
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	logic [31:0] decoderOut;
	logic [31:0] [63:0] out;
	
	Decoder5x32 decode(.RegWrite(RegWrite), .WriteRegister(WriteRegister), .Reg(decoderOut[31:0]));
	
	genvar i;
	generate
	   // Generate 32 64-bit registers
		for (i = 0; i < 31; i++) begin: register
			register64 re64(.in(WriteData), .out(out[i]), .en(decoderOut[i]), .clk(clk));
		end
	endgenerate
	
	
	assign out[31][63:0] = 64'b0; //Register 31 to 0
	
	
	MUX64x32x1 mu1 (.in(out), .sel(ReadRegister1), .out(ReadData1));
	MUX64x32x1 mu2 (.in(out), .sel(ReadRegister2), .out(ReadData2));

	
endmodule
