module Binary2TwoDigit(
	input w,x,y,z,
	output reg a0,b0,c0,d0,e0,f0,g0,a1,b1,c1,d1,e1,f1,g1);
	always @ (w,x,y,z) begin
	case ({w,x,y,z})
				
		4'b0000: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0000001; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 0
		4'b0001: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b1001111; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 1
		4'b0010: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0010010; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 2
		4'b0011: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0000110; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 3
		4'b0100: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b1001100; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 4
		4'b0101: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0100100; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 5
		4'b0110: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0100000; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 6
		4'b0111: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0001111; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 7
		4'b1000: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0000000; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 8
		4'b1001: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0001100; {a1,b1,c1,d1,e1,f1,g1} = 7'b0000001; end // 9
		4'b1010: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0000001; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 10
		4'b1011: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b1001111; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 11
		4'b1100: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0010010; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 12
		4'b1101: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0000110; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 13
		4'b1110: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b1001100; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 14
		4'b1111: begin {a0,b0,c0,d0,e0,f0,g0} = 7'b0100100; {a1,b1,c1,d1,e1,f1,g1} = 7'b1001111; end // 15		
	endcase
	end
endmodule
