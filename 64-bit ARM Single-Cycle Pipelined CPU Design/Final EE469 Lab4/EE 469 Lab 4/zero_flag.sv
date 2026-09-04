// This module is for when there is a 0 for the final result it'll throw a flag.

`timescale 1ns/10ps

module zero_flag (result, zero);
	input logic [63:0] result;
	output logic zero;
	
	logic [63:0] tempout1;
	logic [15:0] tempout2;
	
	genvar i;
	generate
	
		for (i = 0; i < 64; i+=4)begin: nor64
			nor #(50) (tempout1[i/4], result[i], result[i+1], result[i+2], result[i+3]);
		end
	
		for (i = 0; i < 16; i+=4)begin: nor_nand16
			nand #(50) (tempout2[i/4], tempout1[i], tempout1[i+1], tempout1[i+2], tempout1[i+3]);
		end
	
		nor #(50) (zero, tempout2[0], tempout2[1], tempout2[2], tempout2[3]);
		
	endgenerate
   
endmodule 