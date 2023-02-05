`timescale 1 ns/10 ps
module mux_32_to_1(
	// mux inputs
	input wire [31:0] mux_input_0,
	input wire [31:0] mux_input_1,
	input wire [31:0] mux_input_2,
	input wire [31:0] mux_input_3,
	input wire [31:0] mux_input_4,
	input wire [31:0] mux_input_5,
	input wire [31:0] mux_input_6,
	input wire [31:0] mux_input_7,
	input wire [31:0] mux_input_8,
	input wire [31:0] mux_input_9,
	input wire [31:0] mux_input_10,
	input wire [31:0] mux_input_11,
	input wire [31:0] mux_input_12,
	input wire [31:0] mux_input_13,
	input wire [31:0] mux_input_14,
	input wire [31:0] mux_input_15,
	input wire [31:0] mux_input_16,
	input wire [31:0] mux_input_17,
	input wire [31:0] mux_input_18,
	input wire [31:0] mux_input_19,
	input wire [31:0] mux_input_20,
	input wire [31:0] mux_input_21,
	input wire [31:0] mux_input_22,
	input wire [31:0] mux_input_23,
	input wire [31:0] mux_input_24,
	input wire [31:0] mux_input_25,
	input wire [31:0] mux_input_26,
	input wire [31:0] mux_input_27,
	input wire [31:0] mux_input_28,
	input wire [31:0] mux_input_29,
	input wire [31:0] mux_input_30,
	input wire [31:0] mux_input_31,
	// mux select signal
	input wire [4:0] mux_sel,
	// mux output
	output reg [31:0] mux_out
);

	always@(*)
	begin
		case(mux_sel)
			5'b00000 : mux_out [31:0] <= mux_input_0;
			5'b00001 : mux_out [31:0] <= mux_input_1;
			5'b00010 : mux_out [31:0] <= mux_input_2;
			5'b00011 : mux_out [31:0] <= mux_input_3;
			5'b00100 : mux_out [31:0] <= mux_input_4;
			5'b00101 : mux_out [31:0] <= mux_input_5;
			5'b00110 : mux_out [31:0] <= mux_input_6;
			5'b00111 : mux_out [31:0] <= mux_input_7;
			5'b01000 : mux_out [31:0] <= mux_input_8;
			5'b01001 : mux_out [31:0] <= mux_input_9;
			5'b01010 : mux_out [31:0] <= mux_input_10;
			5'b01011 : mux_out [31:0] <= mux_input_11;
			5'b01100 : mux_out [31:0] <= mux_input_12;
			5'b01101 : mux_out [31:0] <= mux_input_13;
			5'b01110 : mux_out [31:0] <= mux_input_14;
			5'b01111 : mux_out [31:0] <= mux_input_15;
			5'b10000 : mux_out [31:0] <= mux_input_16;
			5'b10001 : mux_out [31:0] <= mux_input_17;
			5'b10010 : mux_out [31:0] <= mux_input_18;
			5'b10011 : mux_out [31:0] <= mux_input_19;
			5'b10100 : mux_out [31:0] <= mux_input_20;
			5'b10101 : mux_out [31:0] <= mux_input_21;
			5'b10110 : mux_out [31:0] <= mux_input_22;
			5'b10111 : mux_out [31:0] <= mux_input_23;
			5'b11000 : mux_out [31:0] <= mux_input_24;
			5'b11001 : mux_out [31:0] <= mux_input_25;
			5'b11010 : mux_out [31:0] <= mux_input_26;
			5'b11011 : mux_out [31:0] <= mux_input_27;
			5'b11100 : mux_out [31:0] <= mux_input_28;
			5'b11101 : mux_out [31:0] <= mux_input_29;
			5'b11110 : mux_out [31:0] <= mux_input_30;
			5'b11111 : mux_out [31:0] <= mux_input_31;
			default : mux_out [31:0] <= 32'b0;
		endcase
	end
endmodule