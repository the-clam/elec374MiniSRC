`timescale 1ns / 10ps
module alu_div(
	input signed [31:0] A, B, // dividend/divisor
	output signed [31:0] Q, R // quotient/remainder	
);
	reg [32:0] A_reg; // should be all 0s to start, will hold remainder
	reg [31:0] Q_reg; // originally hold the dividend, will hold the quotient
	reg [32:0] M_reg; // hold positive divisor
	reg needs_complement; // if either A or B are negative
	integer i;

	always @ (*)
	begin
		A_reg = $signed(0); // Initialize 33-bit register A with all zeros.
		needs_complement = 0;
		// If A is negative, flip Q before initializing Q_reg w/ dividend.
		if(A[31] == 1) 
			begin
				Q_reg = $signed(~A + 1);
				needs_complement = !needs_complement;
			end
		else Q_reg = $signed(A);
		// If B is negative, flip B before initializing M_reg.
		if(B[31] == 1) 
			begin
				M_reg = $signed(~B + 1);
				needs_complement = !needs_complement;
			end
		else M_reg = $signed(B);
		// Run non-restoring algorithm.
		for(i = 0; i < 32; i = i + 1)
		begin
			A_reg = {A_reg[31:0], Q_reg[31]}; // Shift A and Q left one binary position.
			Q_reg = {Q_reg[30:0], 1'bX};
			if(A_reg[32] == 1) A_reg = A_reg + M_reg; // If A < 0, A += M, otherwise A -= M.
			else A_reg = A_reg - M_reg; 
			if(A_reg[32] == 1) Q_reg[0] = 1'b0; // If A < 0, Q[0] = 0, otherwise, Q[0] = 1.
			else Q_reg[0] = 1'b1;
		end	
		if(needs_complement) Q_reg = ~Q_reg + 1; // 2's comp answer to get negative quotient if needed. 
		if(A_reg[32] == 1) A_reg = A_reg + M_reg; // If remainder < 0, A += M to get positive remainder.
	end
	assign Q = Q_reg[31:0];
	assign R = A_reg[31:0];
endmodule