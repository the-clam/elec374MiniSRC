`timescale 1ns / 10ps
module cla_4_bits(
	input wire [3:0] A, B, 
	input wire C_in, 
	output wire [3:0] S,
	output wire C_out
);
	wire [3:0] prop, gen, carry;
	
	assign prop = A ^ B;
	assign gen = A & B;

	assign carry[0] = C_in;
	assign carry[1] = gen[0] | (prop[0] & carry[0]);
	assign carry[2] = gen[1] | (prop[1] & gen[0]) | (prop[1] & prop[0] & carry[0]);
	assign carry[3] = gen[2] | (prop[2] & gen[1]) | (prop[2] & prop[1] & gen[0])
						| (prop[2] & prop[1] & prop[0] & carry[0]);
	assign C_out = gen[3] | (prop[3] & gen[2]) | (prop[3] & prop[2] & gen[1]) 
						| (prop[3] & prop[2] & prop[1] & gen[0])
						| (prop[3] & prop[2] & prop[1] & prop[0] & carry[0]);
	assign S = prop ^ carry;
endmodule