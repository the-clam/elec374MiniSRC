`timescale 1ns / 10ps
module bus (
	// select signals
	input wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out,
	input wire R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input wire HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,
	// 32 bit input to 32-to-1 mux
	input wire [31:0] BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5,
	input wire [31:0] BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10,
	input wire [31:0] BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15,
	input wire [31:0] BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_Zhigh, BusMuxIn_Zlow,
	input wire [31:0] BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_InPort, C_sign_extended,
	// bus output
	output wire [31:0] BusMuxOut	
);
	// input to 32-to-5 encoder, output is based on input select signal
	reg [31:0] bus_enc_input;
   	// intermediate output from 32-to-5 encoder, to be put into 32-to-1 mux
   	wire [4:0] bus_enc_output;
	// connect encoder in signal to bus
   	enc_32_to_5 bus_encoder(.enc_input(bus_enc_input), .enc_output(bus_enc_output));
	// bus instantiation
	mux_32_to_1 bus_mux(
		.mux_sel(bus_enc_output), .mux_input_0(BusMuxIn_R0), .mux_input_1(BusMuxIn_R1),
		.mux_input_2(BusMuxIn_R2), .mux_input_3(BusMuxIn_R3), .mux_input_4(BusMuxIn_R4),
		.mux_input_5(BusMuxIn_R5), .mux_input_6(BusMuxIn_R6), .mux_input_7(BusMuxIn_R7),
		.mux_input_8(BusMuxIn_R8), .mux_input_9(BusMuxIn_R9), .mux_input_10(BusMuxIn_R10),
		.mux_input_11(BusMuxIn_R11), .mux_input_12(BusMuxIn_R12), .mux_input_13(BusMuxIn_R13),
		.mux_input_14(BusMuxIn_R14), .mux_input_15(BusMuxIn_R15), .mux_input_16(BusMuxIn_HI),
		.mux_input_17(BusMuxIn_LO), .mux_input_18(BusMuxIn_Zhigh), .mux_input_19(BusMuxIn_Zlow),
		.mux_input_20(BusMuxIn_PC), .mux_input_21(BusMuxIn_MDR), .mux_input_22(BusMuxIn_InPort), 
		.mux_input_23(C_sign_extended), .mux_out(BusMuxOut)
	);
	always@(*)
	begin
		if(R0out) bus_enc_input <= 32'h00000001; else if(R1out) bus_enc_input <= 32'h00000002;
		else if(R2out) bus_enc_input <= 32'h00000004; else if(R3out) bus_enc_input <= 32'h00000008;
		else if(R4out) bus_enc_input <= 32'h00000010; else if(R5out) bus_enc_input <= 32'h00000020;
		else if(R6out) bus_enc_input <= 32'h00000040; else if(R7out) bus_enc_input <= 32'h00000080;
		else if(R8out) bus_enc_input <= 32'h00000100; else if(R9out) bus_enc_input <= 32'h00000200;
		else if(R10out) bus_enc_input <= 32'h00000400; else if(R11out) bus_enc_input <= 32'h00000800;
		else if(R12out) bus_enc_input <= 32'h00001000; else if(R13out) bus_enc_input <= 32'h00002000;
		else if(R14out) bus_enc_input <= 32'h00004000; else if(R15out) bus_enc_input <= 32'h00008000;
		else if(HIout) bus_enc_input <= 32'h00010000; else if(LOout) bus_enc_input <= 32'h00020000;
		else if(Zhighout) bus_enc_input <= 32'h00040000; else if(Zlowout) bus_enc_input <= 32'h00080000;
		else if(PCout) bus_enc_input <= 32'h00100000; else if(MDRout) bus_enc_input <= 32'h00200000;
		else if(InPortout) bus_enc_input <= 32'h00400000; else if(Cout) bus_enc_input <= 32'h00800000;
		else bus_enc_input <= 32'hX;
	end
endmodule