
// This module is the control path and controls how the instructions are to be implemented
`timescale 1ns/10ps 

module control (instr, Reg2Loc, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, clk, BranchTaken, 
					 ZeroFlag, instr_type, xfer_size, negative, carryout, overflow, Uncondbranch, set_flag);
	input logic clk, ZeroFlag, negative, carryout, overflow;
	input logic [10:0] instr;
	output logic Reg2Loc, Branch, BranchTaken, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Uncondbranch, set_flag;
	output logic [2:0] ALUOp;
	output logic [1:0] instr_type;
	output logic [3:0] xfer_size;
	
	logic branchAND;
	
// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			1result = A - B

	always_comb begin
		
		Reg2Loc = 1'b0;
		BranchTaken = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUOp = 3'b000;
		MemWrite = 1'b0;
		ALUSrc = 1'b0;
		RegWrite = 1'b0;
		instr_type = 2'b00;
		xfer_size = 4'bxxxx;
		set_flag = 1'b0;
		Uncondbranch = 1'b0;
		
		casex (instr)
		
			11'b1001000100x: begin // ADDI (Add Immediate) I-Type
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				ALUOp = 3'b010; 
				instr_type = 2'b00;
			end

			11'b10101011000: begin // ADDS (ADD & Set flags) R-Type
				RegWrite = 1'b1;
				ALUOp = 3'b010; // ADD operation with flags
				set_flag = 1'b1;
				instr_type = 2'bxx;
			end

			11'b000101XXXXX: begin // B (Unconditional Branch) B-Type
				ALUOp = 3'bxxx; 
				instr_type = 2'b10;
				Uncondbranch = 1'b1;
				BranchTaken = (ZeroFlag & Branch) | Uncondbranch;
			end
		
			11'b01010100xxx: begin // B.LT (Conditional Branch if Less Than) CB-Type
				Branch = 1'b1;
				MemRead = 1'bx;
				MemtoReg = 1'bx;
				ALUOp = 3'bxxx; 
				instr_type = 2'b11;
				BranchTaken = negative ^ overflow;
			end

			11'b100101xxxxx: begin // BL (Branch with Link) B-Type // Unconditional
				RegWrite = 1'b1;
				ALUOp = 3'bxxx; 
				instr_type = 2'b10;
				Uncondbranch = 1'b1;
			end

			11'b11010110000: begin // BR (Branch to Register) R-Type // Unconditional
				ALUOp = 3'bxxx; 
				Uncondbranch = 1'b1;
			end

			11'b10110100XXX: begin // CBZ (Compare & Branch if Zero) CB-Type // Conditional
				Reg2Loc = 1'b1;
				ALUOp = 3'b000; 
				instr_type = 2'b11;
				Branch = 1'b1;
				BranchTaken = (ZeroFlag & Branch) | Uncondbranch;
			end

			11'b11111000010: begin // LDUR (Load Register Unscaled offset) D-Type
				Reg2Loc = 1'b1;
				MemRead = 1'b1;
				MemtoReg = 1'b1;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				ALUOp = 3'b010; 
				instr_type = 2'b01;
				xfer_size = 4'b1000;
			end

			11'b11111000000: begin // STUR (Store Register Unscaled offset) D-Type
				Reg2Loc = 1'b1;
				MemRead = 1'b1;
				MemtoReg = 1'b1;
				ALUSrc = 1'b1;
				MemWrite = 1'b1;
				ALUOp = 3'b010; 
				instr_type = 2'b01;
				xfer_size = 4'b1000;
			end

			11'b11101011000: begin // SUBS (SUBtract & Set flags) R-Type
				RegWrite = 1'b1;
				ALUOp = 3'b011; // SUB operation with flags
				set_flag = 1'b1;
				instr_type = 2'bxx;
			end

			default: begin
				// Default values if no instruction matches
				Reg2Loc = 1'b0;
				BranchTaken = 1'b0;
				Branch = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 1'b0;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
				instr_type = 2'b00;
				xfer_size = 4'bxxxx;
				set_flag = 1'b0;
				Uncondbranch = 1'b0;
			end
		endcase
	end

endmodule 