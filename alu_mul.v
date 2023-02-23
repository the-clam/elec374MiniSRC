`timescale 1ns / 10ps
module alu_mul(
	input signed [31:0] A, // multiplicand
	input signed [31:0] B, // multiplier
	output signed [63:0] P // product
);

	reg [2:0] bit_pair; // Hold booth re-coded bit pair.
	reg [32:0] multiplied; // Hold multiplicand multiplied by bit pair. 
	reg [63:0] shifted; // Hold shifted product.
	reg [63:0] sum; // Hold final product.

	integer bits; // used to loop thru all 32 bits
	integer shifts; // count number of bits to shift each partial product by
	
	// Retain a copy of the negated multiplicand for use with Booth's algorithm.
	wire [31:0] negated;
	alu_neg alu_neg_instance(.data_input(A), .data_output(negated)); // Use negation module to implement.

	always @ (*)
	begin
		sum = 64'b0; // Clear sum for next input.
				
		for(bits = 0; bits < 32; bits = bits + 2) // Do 16 times (every other bit).
		begin		
			// Calculate bit pair for bit i.
			if (bits == 0) bit_pair = {B[bits + 1], B[bits], 1'b0};
			else bit_pair = {B[bits + 1], B[bits], B[bits - 1]};

			// Based on this bit pair, calculate the value to multiply by.
			case(bit_pair)
				3'b001, 3'b010 : multiplied = {A[31], A}; // 1 - copy the multiplicand, sign extend by 1 bit
				3'b101, 3'b110 : multiplied = {negated[31], negated};// -1 invert multiplicand, sign extend by 1 bit
				3'b011 : multiplied = {A, 1'b0}; // 2 shift left 1 by appending 0
				3'b100 : multiplied = {negated, 1'b0}; // -2 shift left 1 by appending 0
				default : multiplied = {32'b0}; // 3'b000, 3'b111 : 0
			endcase
			shifted = $signed(multiplied);

			// Shift partial product to be added to the final product sum.
			// ie. for partial product @ bit 2, shift 2 bits over
			for(shifts = 0; shifts < bits; shifts = shifts + 1)
			begin
				shifted = {shifted, 1'b0};
			end
			
			// Add shifted partial product to the final sum.
			sum = sum + shifted;
		end
	end
	// Return sum of all partial products as the product.
	assign P = sum;
endmodule