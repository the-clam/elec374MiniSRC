`timescale 1ns / 10ps
module mux_2_to_1(
	input wire [31:0] mux_input_0, mux_input_1, // mux inputs to select from
	input wire mux_sel, // mux select signal
	output reg [31:0] mux_out // mux output
);
	always@(*)
	begin 
		case(mux_sel)
			1'b0 : mux_out [31:0] <= mux_input_0 [31:0];
			1'b1 : mux_out [31:0] <= mux_input_1 [31:0];
		endcase
	end
endmodule