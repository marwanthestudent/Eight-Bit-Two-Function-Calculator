module lab9 (
	input [7:0] A, //declare data inputs
	input InA, InB, Out, Clear, Add_Subtract, //declare control inputs
	output  [7:0] Rout, //declare result output
	output  [3:0] Ccout, //declare condition code output
	output  [0:6] HEX2, HEX1, HEX0); //declare seven-segment outputs
	//Declare internal nodes
	wire [7:0] Aout, Bout, R; //declare register outputs
	wire Cout, Ovr, Zero, Neg, c7; //declare condition codes
	wire [3:0] Ccout_W;
	
	
	
	//Instantiate registers
	NbitRegister #(4'd8) regA //8-bit register
	(
	.D(A) , // Register A input
	.CLK(InA) , // Register A load
	.CLR(Clear) , // Register A clear
	.Q(Aout) // Register A output
	);
	
	NbitRegister #(4'd8) regB //8-bit registerCout1
	(

	.D(A) ,
	.CLK(InB) ,
	.CLR(Clear) , 
	.Q(Bout) 
	);
	
	RippleCarryAdder RippleCarryAdderStructural_inst
	(
	.A(Aout) ,	// input [7:0] A_sig
	.B(Bout) ,	// input [7:0] B_sig
	.add_subtract(Add_Subtract) ,	// input  add_subtract_sig
	.S(R) ,	// output [7:0] S_sig
	.Cout(Ccout_W[3]),
	.Ovr(Ccout_W[2]),
	.Zero(Ccout_W[1]),
	.Neg(Ccout_W[0])
	);
	
	NbitRegister #(4'd8) regR //8-bit register
	(
	.D(R) ,
	.CLK(Out) ,
	.CLR(Clear) , 
	.Q(Rout) 
	);
	

	NbitRegister #(3'd4) regCC //4-bit register
	( 
	.D(Ccout_W),
	.CLK(Out) , // Register CC load
	.CLR(Clear) , // Register CC clear
	.Q(Ccout) // Register CC output
	);

	
	
	
	//Instantiate bin2sev decoders
	Binary2Hex Hex0
	(
		.w(Rout[3]) ,	// input  w_sig
		.x(Rout[2]) ,	// input  x_sig
		.y(Rout[1]) ,	// input  y_sig
		.z(Rout[0]) ,	// input  z_sig
		.a(HEX0[0]) ,	// output  a_sig
		.b(HEX0[1]) ,	// output  b_sig
		.c(HEX0[2]) ,	// output  c_sig
		.d(HEX0[3]) ,	// output  d_sig
		.e(HEX0[4]) ,	// output  e_sig
		.f(HEX0[5]) ,	// output  f_sig
		.g(HEX0[6]) 	// output  g_sig
	);
	
	Binary2Hex Hex1
	(
		.w(Rout[7]) ,	// input  w_sig
		.x(Rout[6]) ,	// input  x_sig
		.y(Rout[5]) ,	// input  y_sig
		.z(Rout[4]) ,	// input  z_sig
		.a(HEX1[0]) ,	// output  a_sig
		.b(HEX1[1]) ,	// output  b_sig
		.c(HEX1[2]) ,	// output  c_sig
		.d(HEX1[3]) ,	// output  d_sig
		.e(HEX1[4]) ,	// output  e_sig
		.f(HEX1[5]) ,	// output  f_sig
		.g(HEX1[6]) 	// output  g_sig
	);
	
	Binary2Hex Hex2
	(
		.w(Ccout[3]) ,	// input  w_sig
		.x(Ccout[2]) ,	// input  x_sig
		.y(Ccout[1]) ,	// input  y_sig
		.z(Ccout[0]) ,	// input  z_sig
		.a(HEX2[0]) ,	// output  a_sig
		.b(HEX2[1]) ,	// output  b_sig
		.c(HEX2[2]) ,	// output  c_sig
		.d(HEX2[3]) ,	// output  d_sig
		.e(HEX2[4]) ,	// output  e_sig
		.f(HEX2[5]) ,	// output  f_sig
		.g(HEX2[6]) 	// output  g_sig
	);

	
	
endmodule