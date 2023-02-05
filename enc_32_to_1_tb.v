`timescale 1 ns/10 ps
module enc_32_to_1_tb;
	reg [31:0] mux_input_0;
	reg [31:0] mux_input_1;
	reg [31:0] mux_input_2;
	reg [31:0] mux_input_3;
	reg [31:0] mux_input_4;
	reg [31:0] mux_input_5;
	reg [31:0] mux_input_6;
	reg [31:0] mux_input_7;
	reg [31:0] mux_input_8;
	reg [31:0] mux_input_9;
	reg [31:0] mux_input_10;
	reg [31:0] mux_input_11;
	reg [31:0] mux_input_12;
	reg [31:0] mux_input_13;
	reg [31:0] mux_input_14;
	reg [31:0] mux_input_15;
	reg [31:0] mux_input_16;
	reg [31:0] mux_input_17;
	reg [31:0] mux_input_18;
	reg [31:0] mux_input_19;
	reg [31:0] mux_input_20;
	reg [31:0] mux_input_21;
	reg [31:0] mux_input_22;
	reg [31:0] mux_input_23;
	reg [31:0] mux_input_24;
	reg [31:0] mux_input_25;
	reg [31:0] mux_input_26;
	reg [31:0] mux_input_27;
	reg [31:0] mux_input_28;
	reg [31:0] mux_input_29;
	reg [31:0] mux_input_30;
	reg [31:0] mux_input_31;
	reg [4:0] mux_sel;
	wire [31:0] mux_out;
	
	enc_32_to_1 enc_32_to_1_instance(
		.mux_input_0(mux_input_0),
		.mux_input_1(mux_input_1),
		.mux_input_2(mux_input_2),
		.mux_input_3(mux_input_3),
		.mux_input_4(mux_input_4),
		.mux_input_5(mux_input_5),
		.mux_input_6(mux_input_6),
		.mux_input_7(mux_input_7),
		.mux_input_8(mux_input_8),
		.mux_input_9(mux_input_9),
		.mux_input_10(mux_input_10),
		.mux_input_11(mux_input_11),
		.mux_input_12(mux_input_12),
		.mux_input_13(mux_input_13),
		.mux_input_14(mux_input_14),
		.mux_input_15(mux_input_15),
		.mux_input_16(mux_input_16),
		.mux_input_17(mux_input_17),
		.mux_input_18(mux_input_18),
		.mux_input_19(mux_input_19),
		.mux_input_20(mux_input_20),
		.mux_input_21(mux_input_21),
		.mux_input_22(mux_input_22),
		.mux_input_23(mux_input_23),
		.mux_input_24(mux_input_24),
		.mux_input_25(mux_input_25),
		.mux_input_26(mux_input_26),
		.mux_input_27(mux_input_27),
		.mux_input_28(mux_input_28),
		.mux_input_29(mux_input_29),
		.mux_input_30(mux_input_30),
		.mux_input_31(mux_input_31),
		.mux_sel(mux_sel), 
		.mux_out(mux_out)
	);
	
	integer i;
	
	initial
		begin
			mux_input_0 <= 32'd2;
			mux_input_1 <= 32'd4;
			mux_input_2 <= 32'd6;
			mux_input_3 <= 32'd8;
			mux_input_4 <= 32'd10;
			mux_input_5 <= 32'd12;
			mux_input_6 <= 32'd14;
			mux_input_7 <= 32'd16;
			mux_input_8 <= 32'd18;
			mux_input_9 <= 32'd20;
			mux_input_10 <= 32'd22;
			mux_input_11 <= 32'd24;
			mux_input_12 <= 32'd26;
			mux_input_13 <= 32'd28;
			mux_input_14 <= 32'd30;
			mux_input_15 <= 32'd32;
			mux_input_16 <= 32'd34;
			mux_input_17 <= 32'd36;
			mux_input_18 <= 32'd38;
			mux_input_19 <= 32'd40;
			mux_input_20 <= 32'd42;
			mux_input_21 <= 32'd44;
			mux_input_22 <= 32'd46;
			mux_input_23 <= 32'd48;
			mux_input_24 <= 32'd50;
			mux_input_25 <= 32'd52;
			mux_input_26 <= 32'd54;
			mux_input_27 <= 32'd56;
			mux_input_28 <= 32'd58;
			mux_input_29 <= 32'd60;
			mux_input_30 <= 32'd62;
			mux_input_31 <= 32'd64;

			for(i = 0; i < 32; i = i + 1) begin
				mux_sel = i;
				#10;
			end		
		end	
endmodule




































