module lab11 //keypadinput Depends: keypad_base(clock_div,keypad_fsm, keypad_decoder, shift_reg)
#( parameter DIGITS = 4)
	( 	input clk,
		input reset,
		input [3:0] row,
		output [3:0] col,
		output [7:0] twosN,
		output [3:0] value
	);
		wire [(DIGITS*4)-1:0] out;
		// Debug
		
		wire trig;
		wire [7:0] binarySM_sig;
	keypad_base keypad_base(
		.clk(clk),
		.row(row),
		.col(col),
		.value(value),
		.valid(trig)
	);
	shift_reg #(.COUNT(DIGITS)) shift_reg(
		.trig(trig),
		.in(value),
		.out(out),
		.reset(reset)
	);
	
	BCD2BinarySM BCD2BinarySM_inst
	(
		.BCD(out) ,	// input [15:0] BCD_sig
		.binarySM(binarySM_sig) 	// output [N-1:0] binarySM_sig
	);
	defparam BCD2BinarySM_inst.N = 8;
	
	assign twosN[7] = binarySM_sig[7];
	twoSIGN twoSIGN_inst
	(
		.A(binarySM_sig) ,	// input [N-1:0] A_sig
		.B(twosN[6:0]) 	// output [N-1:0] B_sig
	);

	
endmodule
