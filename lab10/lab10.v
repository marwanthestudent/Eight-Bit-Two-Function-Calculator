module lab10 #(parameter N = 8)(
	input [N-1:0] A,
	output Hex4,
	output [6:0] Hex1,Hex2,Hex3
);
wire [N-1:0] B;
wire [3:0] ONES, TENS;
wire [1:0] HUNDREDS;

twoSIGN twoSIGN_inst
(
	.A(A) ,	// input [N-1:0] A_sig
	.B(B) 	// output [N-1:0] B_sig
);

binary2bcd binary2bcd_inst
(
	.A(B) ,	// input [7:0] A_sig
	.ONES(ONES) ,	// output [3:0] ONES_sig
	.TENS(TENS) ,	// output [3:0] TENS_sig
	.HUNDREDS(HUNDREDS) 	// output [1:0] HUNDREDS_sig
);

bcd2seven ones
(
	.w(ONES[3]) ,	// input  w_sig
	.x(ONES[2]) ,	// input  x_sig
	.y(ONES[1]) ,	// input  y_sig
	.z(ONES[0]) ,	// input  z_sig
	.a(Hex1[0]) ,	// output  a_sig
	.b(Hex1[1]) ,	// output  b_sig
	.c(Hex1[2]) ,	// output  c_sig
	.d(Hex1[3]) ,	// output  d_sig
	.e(Hex1[4]) ,	// output  e_sig
	.f(Hex1[5]) ,	// output  f_sig
	.g(Hex1[6]) 	// output  g_sig
);

bcd2seven tens
(
	.w(TENS[3]) ,	// input  w_sig
	.x(TENS[2]) ,	// input  x_sig
	.y(TENS[1]) ,	// input  y_sig
	.z(TENS[0]) ,	// input  z_sig
	.a(Hex2[0]) ,	// output  a_sig
	.b(Hex2[1]) ,	// output  b_sig
	.c(Hex2[2]) ,	// output  c_sig
	.d(Hex2[3]) ,	// output  d_sig
	.e(Hex2[4]) ,	// output  e_sig
	.f(Hex2[5]) ,	// output  f_sig
	.g(Hex2[6]) 	// output  g_sig
);

bcd2seven hundreds
(
	.w(0) ,	// input  w_sig
	.x(0) ,	// input  x_sig
	.y(HUNDREDS[1]) ,	// input  y_sig
	.z(HUNDREDS[0]) ,	// input  z_sig
	.a(Hex3[0]) ,	// output  a_sig
	.b(Hex3[1]) ,	// output  b_sig
	.c(Hex3[2]) ,	// output  c_sig
	.d(Hex3[3]) ,	// output  d_sig
	.e(Hex3[4]) ,	// output  e_sig
	.f(Hex3[5]) ,	// output  f_sig
	.g(Hex3[6]) 	// output  g_sig
);

assign Hex4 = ~A[7];

endmodule
