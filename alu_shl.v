`timescale 1ns / 10ps
module alu_shl (
	input wire [31:0] data_input, num_shifts,
	output wire [31:0] data_output
);
	assign data_output [31:0] = data_input << num_shifts;	
endmodule