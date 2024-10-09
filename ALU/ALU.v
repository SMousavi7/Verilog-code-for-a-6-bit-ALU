module ALU_6bit(input_a, input_b, out, op);
	input [5:0]input_a, input_b;
	input [1:0]op;
	output [5:0] out;
	wire[5:0] out0, out1, out2, out3;

	shift s(input_a, input_b, out0);
	add a(input_a, input_b, out1);
	gharine g(input_a, input_b, out2);
	ghadrMotlagh gm(input_a, input_b, out3);
	
	assign out = op[1]? (op[0]? out3 : out2) : (op[0]? out1 : out0);

endmodule

module add(a, b, out);
	input [5:0]a;
	input [5:0]b;
	output [5:0]out;
	assign out = a + (b + b + b);
endmodule

module shift(a, b, out);
	input [5:0]a;
	input [5:0]b;
	output [5:0]out;
	assign out = (a <<< 2) + (b >>> 1);
endmodule

module gharine(a, b, out);
	input [5:0]a, b;
	output [5:0]out;
	assign out = -1 * b;
endmodule

module ghadrMotlagh(a, b, out);
	input [5:0]a, b;
	output [5:0]out;
	assign out = ((a + a) >= b)? ((a + a) - b) : (b - (a + a));
endmodule
