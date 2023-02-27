`timescale 1ns / 10ps
module alu_mul(
	input signed [31:0] A, B,// multiplicand and multiplier 
	output signed [63:0] P // product
);
	reg [4:0] bit_pair; // Hold booth re-coded bit pair.
	reg [35:0] multiplied; // Hold multiplicand multiplied by bit pair. 
	reg [63:0] shifted; // Hold shifted product.
	reg [63:0] sum; // Hold final product.
	integer bits; // used to loop thru all 32 bits
	integer shifts; // count number of bits to shift each partial product by
	
	// Retain copy of the negated multiplicand for use with Booth's algorithm.
	wire [31:0] neg;
	alu_neg alu_neg_instance(.data_input(A), .data_output(neg));

	always @ (*)
	begin
		sum = 64'b0; // Clear sum for next input.	
		for(bits = 0; bits < 32; bits = bits + 4) // Do for every other bit.
		begin		
			// Calculate bit pair for bit i.
			if (bits == 0) bit_pair = {B[bits + 3], B[bits + 2], B[bits + 1], B[bits], 1'b0};
			else bit_pair = {B[bits + 3], B[bits + 2], B[bits + 1], B[bits], B[bits - 1]};
			// Based on this bit pair, calculate the value to multiply by.
			case(bit_pair)
				5'b00001, 5'b00010 : multiplied = {A[31], A[31], A[31], A[31], A}; // 1
				5'b00011, 5'b00100 : multiplied = {A[31], A[31], A[31], A, 1'b0}; // 2
				5'b00101, 5'b00110 : multiplied = {A[31], A[31], A[31], A, 1'b0} + {A[31], A[31], A[31], A[31], A}; // 3
				5'b00111, 5'b01000 : multiplied = {A[31], A[31], A, 2'b0}; // 4
				5'b01001, 5'b01010 : multiplied = {A[31], A[31], A, 2'b0} + {A[31], A[31], A[31], A[31], A}; // 5
				5'b01011, 5'b01100 : multiplied = {A[31], A[31], A, 2'b0} + {A[31], A[31], A[31], A, 1'b0}; // 6
				5'b01101, 5'b01110 : multiplied = {A[31], A[31], A, 2'b0} + {A[31], A[31], A[31], A, 1'b0} + {A[31], A[31], A[31], A[31], A}; // 7
				5'b01111 : multiplied = {A[31], A, 3'b0}; // 8
				5'b10000 : multiplied = {neg[31], neg, 3'b0}; // -8
				5'b10001, 5'b10010 : multiplied = {neg[31], neg[31], neg, 2'b0} + {neg[31], neg[31], neg[31], neg, 1'b0} + {neg[31], neg[31], neg[31], neg[31], neg}; // -7
				5'b10011, 5'b10100 : multiplied = {neg[31], neg[31], neg, 2'b0} + {neg[31], neg[31], neg[31], neg, 1'b0}; // -6
				5'b10101, 5'b10110 : multiplied = {neg[31], neg[31], neg, 2'b0} + {neg[31], neg[31], neg[31], neg[31], neg}; // -5
				5'b10111, 5'b11000 : multiplied = {neg[31], neg[31], neg, 2'b0}; // -4
				5'b11001, 5'b11010 : multiplied = {neg[31], neg[31], neg[31], neg, 1'b0} + {neg[31], neg[31], neg[31], neg[31], neg}; // -3
				5'b11011, 5'b11100 : multiplied = {neg[31], neg[31], neg[31], neg, 1'b0}; // -2
				5'b11101, 5'b11110 : multiplied = {neg[31], neg[31], neg[31], neg[31], neg}; // -1
				default : multiplied = {35'b0}; // 5'b00000, 5'b11111 : 0
			endcase
			shifted = $signed(multiplied);
			// Shift partial product to be added to the final product sum.
			// ie. for partial product @ bit 2, shift 2 bits over
			for(shifts = 0; shifts < bits; shifts = shifts + 1) shifted = {shifted, 1'b0};
			// Add shifted partial product to the final sum.
			sum = sum + shifted;
		end
	end
	assign P = sum; // Return sum of all partial products as the product.
endmodule