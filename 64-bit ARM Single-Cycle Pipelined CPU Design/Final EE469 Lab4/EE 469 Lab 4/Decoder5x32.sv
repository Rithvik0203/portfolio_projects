// This is a 5 to 32 decoder and uses one 2 to 4 decoder and four 3 to 8 decoders.
// The 32 registers are written to through WriteRegister and handled RegWrite (the enable) 

`timescale 1ns/10ps

module Decoder5x32 (RegWrite, WriteRegister, Reg);
	input logic RegWrite;
	input logic [4:0] WriteRegister;
	output logic [31:0] Reg;
	wire [3:0] w;
	
	Decoder2x4 dec1 (.in(WriteRegister[4:3]), .out(w[3:0]), .en(RegWrite));
	Decoder3x8 dec2 (.in(WriteRegister[2:0]), .out(Reg[7:0]), .en(w[0]));
	Decoder3x8 dec3 (.in(WriteRegister[2:0]), .out(Reg[15:8]), .en(w[1]));
	Decoder3x8 dec4 (.in(WriteRegister[2:0]), .out(Reg[23:16]), .en(w[2]));
	Decoder3x8 dec5 (.in(WriteRegister[2:0]), .out(Reg[31:24]), .en(w[3]));
	
endmodule 