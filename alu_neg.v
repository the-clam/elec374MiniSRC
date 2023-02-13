`timescale 1ns / 1ps
module alu_neg (
	input wire [31:0] Ra,
	output wire [31:0] Rz
	);
	
	wire [31:0] temp; 
	wire c_out;
	not_32_bit not_op(.Ra(Ra),.Rz(temp));
	add_32_bit add_op(.Ra(temp), .Rb(32'd1), .c_in(1'd0),.sum(Rz), .c_out(c_out));
	
endmodule