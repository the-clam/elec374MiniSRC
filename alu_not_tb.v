`timescale 1ns / 10ps
module alu_not_tb;
	reg [31:0] data_input;
	wire [31:0] data_output;
	
	alu_not alu_not_instance(
		.data_input(data_input),
		.data_output(data_output)
	);
	
	initial
		begin
			data_input <= 32'hFFFF;
			#25;
			data_input <= 32'hF0F0;
			#25;			
		end
	
endmodule