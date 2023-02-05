`timescale 1ns / 10ps
module bus (
	// input to 32-to-5 encoder
   input wire [31:0] bus_enc_input,
   // input to 32-to-1 mux
	input wire [31:0] BusMuxIn_R0,
	input wire [31:0] BusMuxIn_R1,
	input wire [31:0] BusMuxIn_R2,
	input wire [31:0] BusMuxIn_R3,
	input wire [31:0] BusMuxIn_R4,
	input wire [31:0] BusMuxIn_R5,
	input wire [31:0] BusMuxIn_R6,
	input wire [31:0] BusMuxIn_R7,
	input wire [31:0] BusMuxIn_R8,
	input wire [31:0] BusMuxIn_R9,
	input wire [31:0] BusMuxIn_R10,
	input wire [31:0] BusMuxIn_R11,
	input wire [31:0] BusMuxIn_R12,
	input wire [31:0] BusMuxIn_R13,
	input wire [31:0] BusMuxIn_R14,
	input wire [31:0] BusMuxIn_R15,
	input wire [31:0] BusMuxIn_HI,
	input wire [31:0] BusMuxIn_LO,
	input wire [31:0] BusMuxIn_Zhigh,
	input wire [31:0] BusMuxIn_Zlow,
	input wire [31:0] BusMuxIn_PC,
	input wire [31:0] BusMuxIn_MDR,
	input wire [31:0] BusMuxIn_InPort,
	input wire [31:0] C_sign_extended,
	// bus output
	output wire [31:0] BusMuxOut	
);

   // intermediate output from 32-to-5 encoder, to be put into 32-to-1 mux
   wire [4:0] bus_enc_output;

   enc_32_to_5 bus_encoder(
		.enc_input(bus_enc_input),
		.enc_output(bus_enc_output)
	);
	 
	mux_32_to_1 bus_mux(
		.mux_sel(bus_enc_output),
        .mux_input_0(BusMuxIn_R0),
        .mux_input_1(BusMuxIn_R1),
        .mux_input_2(BusMuxIn_R2),
        .mux_input_3(BusMuxIn_R3),
        .mux_input_4(BusMuxIn_R4),
        .mux_input_5(BusMuxIn_R5),
        .mux_input_6(BusMuxIn_R6),
        .mux_input_7(BusMuxIn_R7),
        .mux_input_8(BusMuxIn_R8),
        .mux_input_9(BusMuxIn_R9),
        .mux_input_10(BusMuxIn_R10),
        .mux_input_11(BusMuxIn_R11),
        .mux_input_12(BusMuxIn_R12),
        .mux_input_13(BusMuxIn_R13),
        .mux_input_14(BusMuxIn_R14),
        .mux_input_15(BusMuxIn_R15),
        .mux_input_16(BusMuxIn_HI),
        .mux_input_17(BusMuxIn_LO),
        .mux_input_18(BusMuxIn_Zhigh),
        .mux_input_19(BusMuxIn_Zlow),
        .mux_input_20(BusMuxIn_PC),
        .mux_input_21(BusMuxIn_MDR),
        .mux_input_22(BusMuxIn_InPort),
        .mux_input_23(C_sign_extended),
        .mux_out(BusMuxOut)
	);


endmodule
			

