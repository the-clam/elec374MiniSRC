`timescale 1ns / 10ps
module alu_neg_tb;
	reg [31:0] data_input;
	wire [31:0] data_output;
	
	alu_neg alu_neg_instance(
		.data_input(data_input),
		.data_output(data_output)
	);
	
	initial
		begin
			data_input <= 32'd10;
			#25;
			data_input <= 32'd42;
			#25;			
		end
	
endmodule