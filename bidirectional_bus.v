module bidirectional_bus(
	// input from encoder (to choose multiplexer output)
	input wire [31:0] encoder_in_tobus,
	// input to multiplexer (encoder chooses)
	input wire [31:0] BusMuxIn_R0_tobus,
	input wire [31:0] BusMuxIn_R1_tobus,
	input wire [31:0] BusMuxIn_R2_tobus,
	input wire [31:0] BusMuxIn_R3_tobus,
	input wire [31:0] BusMuxIn_R4_tobus,
	input wire [31:0] BusMuxIn_R5_tobus,
	input wire [31:0] BusMuxIn_R6_tobus,
	input wire [31:0] BusMuxIn_R7_tobus,
	input wire [31:0] BusMuxIn_R8_tobus,
	input wire [31:0] BusMuxIn_R9_tobus,
	input wire [31:0] BusMuxIn_R10_tobus,
	input wire [31:0] BusMuxIn_R11_tobus,
	input wire [31:0] BusMuxIn_R12_tobus,
	input wire [31:0] BusMuxIn_R13_tobus,
	input wire [31:0] BusMuxIn_R14_tobus,
	input wire [31:0] BusMuxIn_R15_tobus,
	input wire [31:0] BusMuxIn_HI_tobus,
	input wire [31:0] BuxMuxIn_LO_tobus,
	input wire [31:0] BuxMuxIn_Zhigh_tobus,
	input wire [31:0] BuxMuxIn_Zlow_tobus,
	input wire [31:0] BuxMuxIn_PC_tobus,
	input wire [31:0] BuxMuxIn_MDR_tobus,
	input wire [31:0] BuxMuxIn_InPort_tobus,
	input wire [31:0] C_sign_extended_tobus,
	// output
	output reg [31:0] BusMuxOut_frombus
);

	// intermediary between the encoder and the mux
	wire [4:0] encoder_out_tomux;
	
	encoder_32_to_5 bus_encoder(
		.EncoderInput(encoder_in_tobus),
		.EncoderOutput(encoder_out_tomux)
	);
	
	mux_32_to_1 bus_mux(
		.mux_select(encoder_out_tomux),
		.BusMuxIn_R0(BusMuxIn_R0_tobus),
		.BusMuxIn_R1(BusMuxIn_R1_tobus),
		.BusMuxIn_R2(BusMuxIn_R2_tobus),
		.BusMuxIn_R3(BusMuxIn_R3_tobus),
		.BusMuxIn_R4(BusMuxIn_R4_tobus),
		.BusMuxIn_R5(BusMuxIn_R5_tobus),
		.BusMuxIn_R6(BusMuxIn_R6_tobus),
		.BusMuxIn_R7(BusMuxIn_R7_tobus),
		.BusMuxIn_R8(BusMuxIn_R8_tobus),
		.BusMuxIn_R9(BusMuxIn_R9_tobus),
		.BusMuxIn_R10(BusMuxIn_R10_tobus),
		.BusMuxIn_R11(BusMuxIn_R11_tobus),
		.BusMuxIn_R12(BusMuxIn_R12_tobus),
		.BusMuxIn_R13(BusMuxIn_R13_tobus),
		.BusMuxIn_R14(BusMuxIn_R14_tobus),
		.BusMuxIn_R15(BusMuxIn_R15_tobus),
		.BusMuxIn_HI(BusMuxIn_HI_tobus),
		.BuxMuxIn_LO(BuxMuxIn_LO_tobus),
		.BuxMuxIn_Zhigh(BuxMuxIn_Zhigh_tobus),
		.BuxMuxIn_Zlow(BuxMuxIn_Zlow_tobus),
		.BuxMuxIn_PC(BuxMuxIn_PC_tobus),
		.BuxMuxIn_MDR(BuxMuxIn_MDR_tobus),
		.BuxMuxIn_InPort(BuxMuxIn_InPort_tobus),
		.C_sign_extended(C_sign_extended_tobus),
		.BusMuxOut(BusMuxOut_frombus)
	);
	
endmodule