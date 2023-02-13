module alu_shl (
	input wire [31:0] input_data,
	input wire [31:0] num_shifts,
	output wire [31:0] output_data
);

	assign output_data [31:0] = input_data << num_shifts;
	
endmodule