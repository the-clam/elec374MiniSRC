`timescale 1 ns/10 ps
module enc_2_to_1_tb;
	reg [31:0] mux_input_0;
	reg [31:0] mux_input_1;
	reg mux_sel;
	wire [31:0] mux_out;
	
	enc_2_to_1 enc_2_to_1_instance(
		.mux_input_0(mux_input_0), 
		.mux_input_1(mux_input_1), 
		.mux_sel(mux_sel), 
		.mux_out(mux_out)
	);
	
	initial
		begin
			mux_input_0 <= 32'd15;
			mux_input_1 <= 32'd240;
			#100;
			mux_sel = 0;
			#100;
			mux_sel = 1;
		end	
endmodule

