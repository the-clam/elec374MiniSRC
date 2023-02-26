`timescale 1ns / 10ps
module alu_add(
	input wire [31:0] A,
	input wire [31:0] B,
	input wire C_in,
	output wire [31:0] S,
	output wire C_out 
);

	cla_32_bits adder(.A(A), .B(B), .C_in(C_in), .S(S), .C_out(C_out));

endmodule