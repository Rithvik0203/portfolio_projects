// This is a full adder. I followed a block diagram to make this full adder.

`timescale 1ns/10ps

module FullAdder(cin, a, b, s, cout);
	input logic cin, a, b;
	output logic s, cout;

	logic x, y, z;
	xor ( s, a, b, cin );
	and ( x, a, b );
	and ( y, a, cin );
	and ( z, b, cin );
	or ( cout, x, y, z );
	
endmodule 