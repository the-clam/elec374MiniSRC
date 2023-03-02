`timescale 1ns / 10ps
module alu_neg (
	input wire [31:0] data_input, output wire [31:0] data_output
);
	wire [31:0] flipped_bits;
	alu_not not_instance(.data_input(data_input), .data_output(flipped_bits)); // Flip all bits.
	wire C_out;
	alu_add add_instance(.A(flipped_bits), .B(32'b1), .C_in(1'b0), .S(data_output), .C_out(C_out)); // Add 1.
endmodule