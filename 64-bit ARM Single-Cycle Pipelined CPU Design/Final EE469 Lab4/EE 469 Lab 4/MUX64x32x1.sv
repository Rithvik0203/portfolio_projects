// This is 64-bit wide, 32 to 1 multiplexer. It selects one of 32 input signals, each 64 bits wide, 
// based on a 5-bit selection signal (sel) and forwards the selected input to the 64-bit output (out).

`timescale 1ns/10ps

module MUX64x32x1 (in, sel, out);
	input logic [4:0] sel;
	input logic [31:0][63:0] in;
	output logic [63:0] out;
  
   genvar j, k;
	generate
	
	    // Loop to instantiate 64 instances of the MUX32x1 module
		 for (j = 0; j < 64; j++) begin: muxiter64
//			logic [31:0] bits;
//			for (k = 0; k < 32; k++) begin: bit32
//				assign bits[j][k] = in[k][j];
//			end
//			MUX32x1 mu1 (.out(out[j]), .in(bits[j]), .sel(sel));
			MUX32x1 mu1 (.out(out[j]), // Connects to the j-th bit of the output
							 .in({in[31][j], in[30][j],in[29][j],in[28][j],in[27][j],in[26][j],in[25][j],in[24][j],in[23][j],
									in[22][j],in[21][j],in[20][j],in[19][j],in[18][j],in[17][j],in[16][j],in[15][j],in[14][j],
									in[13][j],in[12][j],in[11][j],in[10][j],in[9][j],in[8][j],in[7][j],in[6][j],in[5][j],
									in[4][j],in[3][j],in[2][j],in[1][j],in[0][j]}),  // Connects to the j-th bit of each 64-bit input
							 .sel(sel)); // Connects to the selection input
		end
	endgenerate
	
  
endmodule 