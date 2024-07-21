module calculator(

	input clock,
	input clear_entry,
	input clear_all,
	output [3:0] col,
	input [3:0] row,
	output  [3:0] Ccout,	
	output Hex4,
	output [6:0] Hex1,Hex2,Hex3,
	output [2:0] debugLed, //to check if we are cycling through the correct states 
	output [3:0] value // to check if we are recieving an input.

);
		
	wire [7:0] twosN;
	wire reset;
	wire load_A,load_B,load_R;
	wire IUAU;
	wire add_sub;
	wire [7:0] Rout;
	wire [7:0]MUX;

	
	Lab12 Lab12_inst //control unit
	(
		.clk(clock) ,	// input  clk_sig
		.clear_entry(clear_entry) ,	// input  clear_entry_sig
		.clear_all(clear_all) ,	// input  clear_all_sig
		.value(value) ,	// input [3:0] value_sig
		.reset(reset) ,	// output  reset_sig
		.load_A(load_A) ,	// output  load_A_sig
		.load_B(load_B) ,	// output  load_B_sig
		.load_R(load_R) ,	// output  load_R_sig
		.IUAU(IUAU) ,	// output  IUAU_sig
		.add_sub(add_sub), 	// output  add_sub_sig
		.debugLed(debugLed)
	);

	defparam Lab12_inst.S0 = 'b000;
	defparam Lab12_inst.S1 = 'b001;
	defparam Lab12_inst.S2 = 'b010;
	defparam Lab12_inst.S3 = 'b011;
	defparam Lab12_inst.S4 = 'b100;


	lab11 lab11_inst		// input unit instantiation 
	(
		.clk(clock) ,	// input  clk_sig
		.reset(reset) ,	// input  reset_sig
		.row(row) ,	// input [3:0] row_sig
		.col(col) ,	// output [3:0] col_sig
		.twosN(twosN), 	// output [7:0] twosN_sig
		.value(value)
	);
	defparam lab11_inst.DIGITS = 4;



	lab9 lab9_inst	// arithmetic unit instantiation
	(
		.A(twosN) ,	// input [7:0] A_sig
		.InA(~load_A) ,	// input  InA_sig since they're active high and our calculaor is active low we negate te registers.
		.InB(~load_B) ,	// input  InB_sig 
		.Out(~load_R) ,	// input  Out_sig
		.Clear(clear_all) ,	// input  Clear_sig ------> not sure if i need to assign it.
		.Add_Subtract(add_sub) ,	// input  Add_Subtract_sig
		.Rout(Rout) ,	// output [7:0] Rout_sig
		.Ccout(Ccout) ,	// output [3:0] Ccout_sig ----> LEDS of the flags
		.HEX2(HEX2_sig) ,	// output [0:6] HEX2_sig -----> don't assign to anything
		.HEX1(HEX1_sig) ,	// output [0:6] HEX1_sig -----> don't assign to anything
		.HEX0(HEX0_sig) 	// output [0:6] HEX0_sig -----> don't assign to anything
	);

	
	assign MUX = IUAU? Rout : twosN;
	lab10 lab10_inst	// output unit instantiation
	(
		.A(MUX) ,	// input [N-1:0] A_sig
		.Hex4(Hex4) ,	// output  Hex4_sig
		.Hex1(Hex1) ,	// output [6:0] Hex1_sig
		.Hex2(Hex2) ,	// output [6:0] Hex2_sig
		.Hex3(Hex3) 	// output [6:0] Hex3_sig
	);
	defparam lab10_inst.N = 8;

endmodule