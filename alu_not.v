`timescale 1ns / 1ps
module alu_not (
	input wire [31:0] data_input,
	output wire [31:0] data_output
);
	
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin : loop
			assign data_output[i] = !data_input[i];
		end
	endgenerate
endmodule