

// This module forwards the values out from register file, prior ALU result, and datamemory or earlier ALU result
// handles the forwarding unit logic

module forwardUnit(Ex_Mem_Rd, Mem_WB_Rd, ID_EX_Rn, ID_EX_Rm, EX_MEM_RegWrite, MEM_WB_RegWrite, ForwardA, ForwardB, clk);
	input logic [4:0] Ex_Mem_Rd, Mem_WB_Rd, ID_EX_Rn, ID_EX_Rm;
	input logic EX_MEM_RegWrite, MEM_WB_RegWrite;
	output logic [1:0] ForwardA, ForwardB;
	input logic clk;
		
	always @(*) begin
        // Default values
        ForwardA = 2'b00;
        ForwardB = 2'b00;
        
        // Check for ForwardA
        if ((EX_MEM_RegWrite) & (Ex_Mem_Rd != 5'b11111) & (Ex_Mem_Rd == ID_EX_Rn)) begin
            ForwardA = 2'b10;
        end else if (((MEM_WB_RegWrite) & (Mem_WB_Rd != 5'b11111) & (Mem_WB_Rd == ID_EX_Rn))
				& !((EX_MEM_RegWrite) & (Ex_Mem_Rd != 5'b11111) & (Ex_Mem_Rd == ID_EX_Rn))) begin
            ForwardA = 2'b01;
        end

        // Check for ForwardB
        if ((EX_MEM_RegWrite) & (Ex_Mem_Rd != 5'b11111) & (Ex_Mem_Rd == ID_EX_Rm)) begin
            ForwardB = 2'b10;
        end else if ((MEM_WB_RegWrite) & (Mem_WB_Rd != 5'b11111) & (Mem_WB_Rd == ID_EX_Rm)) begin
            ForwardB = 2'b01;
        end
    end



endmodule
