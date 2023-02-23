module alu_shra (
	input wire [31:0] data_input,
	input wire [31:0] num_shifts,
	output wire [31:0] data_output
);

	assign data_output [31:0] = $signed(data_input) >>> num_shifts;

endmodule 