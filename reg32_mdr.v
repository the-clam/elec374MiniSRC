`timescale 1ns / 10ps
module reg32_mdr(
	input wire [31:0] BusMuxOut,
	input wire [31:0] Mdatain,
	input wire read,
	input wire clear,
	input wire clock,
	input wire MDRin,
	output wire [31:0] MDR_out
);
	
	// intermediate data from MDR mux to be inputted to the register
	wire [31:0] MDR_mux_output;

	mux_2_to_1 MDR_mux(
		.mux_input_0(BusMuxOut),
		.mux_input_1(Mdatain),
		.mux_sel(read),
		.mux_out(MDR_mux_output)
	);
	
	reg32 MDR_reg(
		.clr(clear),
		.clk(clock),
		.en(MDRin),
		.D(MDR_mux_output),
		.Q(MDR_out)
	);
endmodule
