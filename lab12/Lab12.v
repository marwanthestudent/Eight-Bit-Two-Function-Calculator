module Lab12 (
	input /*trig,*/clk,clear_entry,clear_all,
	input [3:0] value,
	output reg reset,load_A,load_B,load_R,IUAU,add_sub,
	output [2:0] debugLed
	
);
	reg [2:0] state, nextstate;
	wire oneHz;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
	assign debugLed = state;
	
	OneHzClk OneHzClk_inst // no need to slow it down the only requirement is that the clock
	( 								// in the control unit is faster than the one in the input unit
	.clock(clk) ,	// input  clock_sig
	.reset(clear_all) ,	// input  reset_sig
	.OneHz(oneHz) 	// output  OneHz_sig
	);

	always @ (negedge clk, negedge clear_all)begin
	
		if (clear_all == 0) state <= S0;
		else state<= nextstate;
		end
		
	always @ (*) begin
		//if (trig == 0)begin
		case (state)
			S0: begin nextstate <= S1; reset = 0;load_A = 1;load_B = 1;load_R = 1; IUAU=0; end
			S1: begin reset = 1&clear_entry ;load_A = 1;load_B = 1;load_R = 1; IUAU=0; 
			
				if(value == 4'b1010)begin
				add_sub = 0;nextstate <= S2;end
				else if(value == 4'b1011)begin
				add_sub = 1;nextstate <= S2; end
				else begin nextstate <= S1;end
				end
			
			S2: begin reset = 1&clear_entry;load_A = 0;load_B = 1;load_R = 1; IUAU=0;	
			
				if(value == 4'b1111)begin nextstate <= S3; end
				else begin nextstate <= S2; end
				end
			
				
			S3: begin nextstate <= S4; reset = 1&clear_entry ;load_A = 1;load_B = 0;load_R = 1; IUAU=0;end	
				
			S4: begin nextstate <= S4; reset = 1&clear_entry ;load_A = 1;load_B = 1;load_R = 0; IUAU=1; end
			default: nextstate <= S0;
			
		endcase
		//end
	end	
endmodule
