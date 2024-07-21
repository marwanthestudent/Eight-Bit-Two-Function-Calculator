module halfADDER (s, cout, a, b);
	input a, b;
	output s, cout;
	and (cout, a, b);
	xor (s, a, b);
endmodule