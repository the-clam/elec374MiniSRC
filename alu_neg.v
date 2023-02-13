`timescale 1ns / 1ps
module alu_neg (
	input wire [31:0] input_data,
	output wire [31:0] output_data
);
	
	wire [31:0] flipped_bits;
	alu_not alu_not_instance(.input_data(input_data), .output_data(flipped_bits)); // Flip all bits.
	wire C_out;
	alu_add alu_add_instance(.A(flipped_bits), .B(32'b1), .C_in(0), .S(output_data), .C_out(C_out)); // Add one (using carry in).
	
endmodule