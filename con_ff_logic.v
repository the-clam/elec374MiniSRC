`timescale 1ns / 10ps
module con_ff_logic(
	input wire CON_in, clr,// assuming CON_in is clock signal for the DFF
	input wire [31:0] IR_Data_In,
	input wire [31:0] Bus_Data_In,
	output wire CON_out
);
	// Internal signals.
	wire bus_is_zero, bus_is_neg, and_0, and_1, and_2, and_3, FF_or;
	wire [3:0] dec_output;
	// NOR and NOT gates in CON FF logic.
	assign bus_is_zero = !(|Bus_Data_In);
	assign bus_is_neg = Bus_Data_In[31];
	// Decoder for and gate inputs
	dec_2_to_4 dec_2_to_4_instance(.dec_input(IR_Data_In[20:19]), .dec_output(dec_output));
	// And Gates within CON FF.
	assign and_0 = dec_output[0] & bus_is_zero;
	assign and_1 = dec_output[1] & !bus_is_zero;
	assign and_2 = dec_output[2] & !bus_is_neg;
	assign and_3 = dec_output[3] & bus_is_neg;
	// Or all and gates outputs together.
	assign FF_or = and_0 | and_1 | and_2 | and_3;
	// Connect or output do D flipflop to make it synchronous.
	d_flip_flop con_d_flip_flop(.clk(CON_in), .clr(clr), .D(FF_or), .Q(CON_out));
endmodule