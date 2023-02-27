`timescale 1 ns/10 ps
module mux_2_to_1(
	// mux inputs to select from
	input wire [31:0] mux_input_0, mux_input_1,
	// mux select signal
	input wire mux_sel,
	// mux output
	output reg [31:0] mux_out
);
	always@(*)
	begin
		if(mux_sel == 1) mux_out [31:0] <= mux_input_1 [31:0];
		if(mux_sel == 0) mux_out [31:0] <= mux_input_0 [31:0];
	end
endmodule