module inc_pc (
	input wire [31:0] pc_input, output wire [31:0] pc_output
);
	assign pc_output = pc_input + 1;
endmodule