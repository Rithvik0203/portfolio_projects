`timescale 1ns/10ps

// this module connects the rest of the modules to the main module
module Single_Cycle_CPU (clk, reset);
	input logic clk, reset;
	
	logic [31:0] instr_out;
	logic [1:0] [63:0] reg_out;
	logic [4:0] mux_out1;
	logic [63:0] mux_out2, mux_out3, sign_out, shifter_out, PC_out, ALU_out, Mem_out, mux_out55;
	logic [2:0] ALUOpCtrl;
	logic [3:0] Xfer_size;
	logic [1:0] instr_type;
	logic Reg2Loc, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, BranchTaken, Uncondbranch; 
	logic Zero_Out, ORout, negative, overflow, carryout, z_value, n_value, over_value, carry_value, set_flag;
	
	
	logic [31:0] pip_IF_ID_in, pip_IF_ID_out;
	logic RegWrite_WB;
	logic [4:0] MEM_WB_Rd;
	logic RegWrite_MEM;

	logic [63:0] pipIF_ID_64out, pipIF_ID_64out_EX, pipIF_ID_64out_MEM, pipIF_ID_64out_WB;
	logic [3:0] Xfer_size_EX;
	logic [3:0] Xfer_size_MEM;
	
	logic en;
	assign en = 1'b1;
	
	logic [1:0] instr_type_EX, instr_type_MEM, instr_type_WB;
	
	logic flag;
	logic [4:0] muxoutRd;
	logic zero_flag_alu_out;
	logic negative_flag_alu_out;
	logic overflow_flag_alu_out;
	logic carryout_flag_alu_out;
	
	logic not_clock;
	not no(not_clock, clk);		// clock counts from the negative edge
	

	// control module instantiation
	control         ctrl     (.instr(pip_IF_ID_out[31:21]), .Reg2Loc, .Branch, .MemRead, .MemtoReg, .ALUOp(ALUOpCtrl), .MemWrite, 
								     .ALUSrc, .RegWrite, .clk, .BranchTaken, .ZeroFlag(flag), .instr_type, .xfer_size(Xfer_size), 
								     .negative(negative_flag_alu_out), .carryout(carry_value), .overflow(over_value), .Uncondbranch, .set_flag);
	
	
	
	
	
	// IF: Instruction fetch
	//program_counter pc       (.clk, .reset, .out(PC_out), .PCMuxSel(BranchTaken), .ShifterIn(shifter_out));
	
	// pipelined PC
	program_counter pc       (.clk, .reset, .out(PC_out), .PCMuxSel(BranchTaken), .ShifterIn(shifter_out), .inp(pipIF_ID_64out));

	
	instructmem     inst     (.address(PC_out), .instruction(pip_IF_ID_in), .clk);
	
	// shift value by 2
	shifter         shift    (.value(sign_out), .direction(1'b0), .distance(6'd2), .result(shifter_out));
	
	
	// IF ID pipeline for PC module
	Pipelined_register_64 pipIF_ID_64 (.in(PC_out), .out(pipIF_ID_64out), .reset, .clk, .en);
	
	
	// IF ID pipeline for instruciton memmory
	Pipelined_register_32 pipIF_ID_32 (.in(pip_IF_ID_in), .out(pip_IF_ID_out), .reset, .clk, .en);
	
	
	
	
	
	
	
	
	
	
	
// ID: Instruction decode / register file read

	logic [63:0] ID_EX_signOut;
	logic [63:0] readDataout1;
	logic [63:0] readDataout2;
	logic [4:0] readreg1Rn;
	logic [4:0] readreg2Rm;
	logic [4:0] ID_EX_Rd;

	// Sign extended pielined register
	Pipelined_register_64 pipID_EX_SE (.in(sign_out), .out(ID_EX_signOut), .reset, .clk, .en);


	// read data 1
	Pipelined_register_64 pipID_EX_readdata1 (.in(reg_out[0]), .out(readDataout1), .reset, .clk, .en);

	// read data 2
	Pipelined_register_64 pipID_EX_readdata2 (.in(reg_out[1]), .out(readDataout2), .reset, .clk, .en);
	
	// read register 1
	Pipelined_register_5 pipID_EX_readreg1 (.in(pip_IF_ID_out[9:5]), .out(readreg1Rn), .reset, .clk, .en);
	
	// read register 2
	Pipelined_register_5 pipID_EX_readreg2 (.in(mux_out1), .out(readreg2Rm), .reset, .clk, .en);

	
	// register desitination or write register
	Pipelined_register_5 pipID_EX_Rd (.in(pip_IF_ID_out[4:0]), .out(ID_EX_Rd), .reset, .clk, .en);
	//Pipelined_register_5 pipID_EX_Rd (.in(pip_IF_ID_out[4:0]), .out(ID_EX_Rd), .reset, .clk, .en);

	
	
	// chooses between instructions for register 2 port
	MUX2x1_PARAM #(5) mu1 (.sel(Reg2Loc), .a(pip_IF_ID_out[20:16]), .b(pip_IF_ID_out[4:0]), .out(mux_out1));
	
	
	// sign extended module instantiation
	sign_extended   SE       (.in(pip_IF_ID_out), .out(sign_out), .ctrl(instr_type));
	
	
	// register file
	regfile         regf     (.ReadRegister1(pip_IF_ID_out[9:5]), .ReadRegister2(mux_out1), .WriteRegister(MEM_WB_Rd), //MEM_Rd
								     .WriteData(mux_out3), .RegWrite(RegWrite_WB), .clk(not_clock), .ReadData1(reg_out[0]), .ReadData2(reg_out[1]));
										//mux_out3
	
	// zero flag
	zero_flag zf (.result(reg_out[1]), .zero(flag));

	
// Control signals storage for EX, WB and M stage
	logic [2:0] ALUOP_EX;
	logic ALUSrc_EX;
	logic Reg2Loc_EX;
	logic MemRead_EX;
	logic MemWrite_EX;
	logic RegWrite_EX;
	logic MemtoReg_EX;
	logic BranchOut_EX;
	


	Pipelined_register_5 pip_ID_EX_ALUOP (.in(ALUOpCtrl), .out(ALUOP_EX), .reset, .clk, .en);
	
	Pipelined_register pip_ID_EX_ALUSrc (.in(ALUSrc), .out(ALUSrc_EX), .reset, .clk, .en);

	Pipelined_register pip_ID_EX_M_MemRead (.in(MemRead), .out(MemRead_EX), .reset, .clk, .en);
	
	Pipelined_register pip_ID_EX_M_MemWrite (.in(MemWrite), .out(MemWrite_EX), .reset, .clk, .en);

	Pipelined_register pip_ID_EX_WB_RegWrite (.in(RegWrite), .out(RegWrite_EX), .reset, .clk, .en);

	Pipelined_register pip_ID_EX_WB_MemtoReg (.in(MemtoReg), .out(MemtoReg_EX), .reset, .clk, .en);

	Pipelined_register_5 pip_ID_EX_WB_xfersize (.in(Xfer_size), .out(Xfer_size_EX), .reset, .clk, .en);

	
	// pipelined PC
	Pipelined_register_64 pipIF_ID_64_ID (.in(pipIF_ID_64out), .out(pipIF_ID_64out_EX), .reset, .clk, .en);

	
	
	
	
// EX: Execute / address calculation
	
	logic [63:0] ForwardBout;
	logic [63:0] ForwardAout;
	
	logic [1:0] ForwardA, ForwardB;
	
	
	logic [63:0] ALU_out_MEM;
	logic [63:0] ForwardBout_MEM;
	logic [4:0] EX_MEM_Rd;
	
	
	// ALU result
	Pipelined_register_64 pipEX_MEM_ALUResult (.in(ALU_out), .out(ALU_out_MEM), .reset, .clk, .en);

	// pieplined result from the 2nd mux of the forwardingB
	Pipelined_register_64 pipEX_MEM_forwardB (.in(ForwardBout), .out(ForwardBout_MEM), .reset, .clk, .en);

	
	//RD pipeline
	Pipelined_register_5 pipEX_MEM_Rd (.in(ID_EX_Rd), .out(EX_MEM_Rd), .reset, .clk, .en);
	
	


	// mux to choose the final signal for the various flags
	MUX2x1 zero_falg_alu (.sel(1'b1), .a(z_value), .b(Zero_Out), .out(zero_flag_alu_out));						//zero
	MUX2x1 negative_falg_alu (.sel(1'b1), .a(n_value), .b(negative), .out(negative_flag_alu_out));			// negative
	MUX2x1 overflow_falg_alu (.sel(1'b1), .a(over_value), .b(overflow), .out(overflow_flag_alu_out));		// overflow
	MUX2x1 carryout_falg_alu (.sel(1'b1), .a(carry_value), .b(carryout), .out(carryout_flag_alu_out));		// carryout

	
	// input for forward A	
	logic [63:0] forwardAin[3:0];
	assign forwardAin[0] = readDataout1; 
	assign forwardAin[1] = mux_out3;
	assign forwardAin[2] = ALU_out_MEM;
	assign forwardAin[3] = 64'b0;

	// input for forwardB
	logic [63:0] forwardBin[3:0];
	assign forwardBin[0] = readDataout2;
	assign forwardBin[1] = mux_out3;
	assign forwardBin[2] = ALU_out_MEM;
	assign forwardBin[3] = 64'b0;
	
	

	//forwardA mux select
	//MUX64x4x1 forAmux (.sel(ForwardA), .in({in[3][64'b0], in[2][readDataout1], in[1][mux_out3], in[0][ALU_out_MEM]}), .out(ForwardAout));
	MUX64x4x1 forAmux (.sel(ForwardA), .in(forwardAin), .out(ForwardAout));
	
	
	//forwardB mux select
	//MUX64x4x1 forBmux (.sel(ForwardB), .in({in[3][64'b0], in[2][mux_out2], in[1][mux_out3], in[0][ALU_out_MEM]}), .out(ForwardBout));
	MUX64x4x1 forBmux (.sel(ForwardB), .in(forwardBin), .out(ForwardBout));

	
	// output of the mux goes into ALU
	MUX64x2x1 		 ALU_mux  (.out(mux_out2), .sel(ALUSrc_EX), .a(ForwardBout), .b(ID_EX_signOut));
	
	
	// ALU
	ARMALU 			 alu      (.A(ForwardAout), .B(mux_out2), .cntrl(ALUOP_EX), .result(ALU_out), 
								     .negative, .zero(Zero_Out), .overflow, .carry_out(carryout));
									  
	DFFEnable df_zero 	    (.q(z_value), 	 .d(Zero_Out), .reset, .clk, .enable(set_flag));
	DFFEnable df_negative    (.q(n_value),		 .d(negative), .reset, .clk, .enable(set_flag));
	DFFEnable df_overflow    (.q(over_value),  .d(overflow), .reset, .clk, .enable(set_flag));
	DFFEnable df_carryout    (.q(carry_value), .d(carryout), .reset, .clk, .enable(set_flag));
	

	// forward unit
	forwardUnit forunit (.Ex_Mem_Rd(EX_MEM_Rd), .Mem_WB_Rd(MEM_WB_Rd), .ID_EX_Rn(readreg1Rn), .ID_EX_Rm(readreg2Rm), .EX_MEM_RegWrite(RegWrite_MEM), .MEM_WB_RegWrite(RegWrite_WB),
					.ForwardA(ForwardA), .ForwardB(ForwardB), .clk);
		

		

	// Control signals for MEM/WB stage	
	
	logic MemRead_MEM;
	logic MemWrite_MEM;
//	logic RegWrite_MEM;
	logic MemtoReg_MEM;
	logic BranchOut_MEM;
		
	Pipelined_register pip_EX_MEM_MemRead (.in(MemRead_EX), .out(MemRead_MEM), .reset, .clk, .en);
	
	Pipelined_register pip_EX_MEM_MemWrite (.in(MemWrite_EX), .out(MemWrite_MEM), .reset, .clk, .en);

	Pipelined_register pip_EX_MEM_WB_RegWrite (.in(RegWrite_EX), .out(RegWrite_MEM), .reset, .clk, .en);

	Pipelined_register pip_EX_MEM_WB_MemtoReg (.in(MemtoReg_EX), .out(MemtoReg_MEM), .reset, .clk, .en);	
		
	Pipelined_register_5 pip_EX_WB_xfersize (.in(Xfer_size_EX), .out(Xfer_size_MEM), .reset, .clk, .en);
		
	
	Pipelined_register_64 pipIF_ID_64_EX (.in(pipIF_ID_64out_EX), .out(pipIF_ID_64out_MEM), .reset, .clk, .en);
	
				
		
		
		
		
// MEM: Memory access


	logic [63:0] ALU_out_WB;
	logic [63:0] Mem_out_WB;
//	logic [4:0] MEM_WB_Rd;
	
	// data value we get form the data mem
	Pipelined_register_64 pip_MEM_WB_dataValue (.in(Mem_out), .out(Mem_out_WB), .reset, .clk, .en);

	
	// ALU result for WB
	Pipelined_register_64 pip_MEM_WB_ALUResult (.in(ALU_out_MEM), .out(ALU_out_WB), .reset, .clk, .en);



	//RD
	Pipelined_register_5 pip_MEM_WB_Rd (.in(EX_MEM_Rd), .out(MEM_WB_Rd), .reset, .clk, .en);

	
	// data memory
	datamem 			 data     (.address(ALU_out_MEM), .write_enable(MemWrite_MEM), .read_enable(MemRead_MEM), 
								     .write_data(ForwardBout_MEM), .clk(clk), .xfer_size(Xfer_size_MEM), .read_data(Mem_out));

									  
	

	// control signals for WB stage
	
//	logic RegWrite_WB;
	logic MemtoReg_WB;

	
	Pipelined_register pip_MEM_WB_RegWrite (.in(RegWrite_MEM), .out(RegWrite_WB), .reset, .clk, .en);

	Pipelined_register pip_MEM_WB_MemtoReg (.in(MemtoReg_MEM), .out(MemtoReg_WB), .reset, .clk, .en);	
											  
	Pipelined_register_64 pipIF_ID_64_MEM (.in(pipIF_ID_64out_MEM), .out(pipIF_ID_64out_WB), .reset, .clk, .en);
								  									  
									  
									  
									  
									  
// WB: Write back
	MUX64x2x1		 data_mux (.out(mux_out3), .sel(MemtoReg_WB), .b(Mem_out_WB), .a(ALU_out_WB));
	
	
endmodule 


// testbench for single cycle CPU module
module Single_Cycle_CPU_tb();
	logic clk, reset;
	
	parameter ClockDelay = 10000;

	Single_Cycle_CPU dut (.clk, .reset);
	
	initial $timeformat(-9, 2, " ns", 10);
	integer i;
	
	initial begin
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		reset = 1; @(posedge clk);
	   reset = 0; @(posedge clk);
		           @(posedge clk);
		for (i=0; i < 70; i++) begin
			@(posedge clk);
		end
		$stop;
	end


endmodule
