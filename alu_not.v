`timescale 1ns / 1ps
module alu_not (
	input wire [31:0] input_data,
	output wire [31:0] output_data
);
	
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin : loop
			assign output_data[i] = !input_data[i];
		end
	endgenerate
endmodule