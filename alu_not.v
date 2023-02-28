`timescale 1ns / 1ps
module alu_not (
	input wire [31:0] data_input, output wire [31:0] data_output
);
	assign data_output = ~data_input;
endmodule