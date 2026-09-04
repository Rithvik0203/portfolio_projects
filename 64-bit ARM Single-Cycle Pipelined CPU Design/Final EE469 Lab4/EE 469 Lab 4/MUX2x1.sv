// This is a 2 to 1 multiplexer that selects one of the two input signals (a or b) 
// based on the value of the selection signal (sel) and forwards the selected input to the output (out). 

`timescale 1ns/10ps

module MUX2x1(sel, a, b, out);
	input logic sel, a, b;
	output logic out;
	
	//a is 0, b is 1
	
	wire g, h, k;
	not #(50) ( k, sel );
	and #(50) ( g, k, a ), ( h, sel, b );
	or #(50) ( out, g, h );

endmodule 