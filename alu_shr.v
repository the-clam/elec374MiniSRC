module alu_shr (
	input wire [31:0] data_input,
	input wire [31:0] num_shifts,
	output wire [31:0] data_out
);

	assign data_out[31:0] = data_input >> num_shifts;

endmodule 