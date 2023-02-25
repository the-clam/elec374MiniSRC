`timescale 1ns / 10ps
module reg32_mdr(
	input wire [31:0] MDMuxIn0,
	input wire [31:0] MDMuxIn1,
	input wire MDMux_sel,
	input wire clr,
	input wire clk,
	input wire en,
	output wire [31:0] Q
);
	
	// intermediate data from MDR mux to be inputted to the register
	wire [31:0] MDR_mux_output;

	mux_2_to_1 MDR_mux(
		.mux_input_0(MDMuxIn0),
		.mux_input_1(MDMuxIn1),
		.mux_sel(MDMux_sel),
		.mux_out(MDR_mux_output)
	);
	
	reg32 MDR_reg(
		.clr(clr),
		.clk(clk),
		.en(en),
		.D(MDR_mux_output),
		.Q(Q)
	);
endmodule
