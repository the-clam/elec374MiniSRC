`timescale 1 ns/10 ps
module bus_tb;
	// bus device select
	reg [31:0] bus_select;
	// bus inputs
	reg [31:0] BusMuxIn_R0;
	reg [31:0] BusMuxIn_R1;
	reg [31:0] BusMuxIn_R2;
	reg [31:0] BusMuxIn_R3;
	reg [31:0] BusMuxIn_R4;
	reg [31:0] BusMuxIn_R5;
	reg [31:0] BusMuxIn_R6;
	reg [31:0] BusMuxIn_R7;
	reg [31:0] BusMuxIn_R8;
	reg [31:0] BusMuxIn_R9;
	reg [31:0] BusMuxIn_R10;
	reg [31:0] BusMuxIn_R11;
	reg [31:0] BusMuxIn_R12;
	reg [31:0] BusMuxIn_R13;
	reg [31:0] BusMuxIn_R14;
	reg [31:0] BusMuxIn_R15;
	reg [31:0] BusMuxIn_HI;
	reg [31:0] BusMuxIn_LO;
	reg [31:0] BusMuxIn_Zhigh;
	reg [31:0] BusMuxIn_Zlow;
	reg [31:0] BusMuxIn_PC;
	reg [31:0] BusMuxIn_MDR;
	reg [31:0] BusMuxIn_InPort;
	reg [31:0] C_sign_extended;
	// bus output
	wire [31:0] BusMuxOut;

	bus bus_instance(
		.bus_enc_input(bus_select),
		.BusMuxIn_R0(BusMuxIn_R0),
		.BusMuxIn_R1(BusMuxIn_R1),
		.BusMuxIn_R2(BusMuxIn_R2),
		.BusMuxIn_R3(BusMuxIn_R3),
		.BusMuxIn_R4(BusMuxIn_R4),
		.BusMuxIn_R5(BusMuxIn_R5),
		.BusMuxIn_R6(BusMuxIn_R6),
		.BusMuxIn_R7(BusMuxIn_R7),
		.BusMuxIn_R8(BusMuxIn_R8),
		.BusMuxIn_R9(BusMuxIn_R9),
		.BusMuxIn_R10(BusMuxIn_R10),
		.BusMuxIn_R11(BusMuxIn_R11),
		.BusMuxIn_R12(BusMuxIn_R12),
		.BusMuxIn_R13(BusMuxIn_R13),
		.BusMuxIn_R14(BusMuxIn_R14),
		.BusMuxIn_R15(BusMuxIn_R15),
		.BusMuxIn_HI(BusMuxIn_HI),
		.BusMuxIn_LO(BusMuxIn_LO),
		.BusMuxIn_Zhigh(BusMuxIn_Zhigh),
		.BusMuxIn_Zlow(BusMuxIn_Zlow),
		.BusMuxIn_PC(BusMuxIn_PC),
		.BusMuxIn_MDR(BusMuxIn_MDR),
		.BusMuxIn_InPort(BusMuxIn_InPort),
		.C_sign_extended(C_sign_extended),
		.BusMuxOut(BusMuxOut)
	);

	initial
		begin
			// assign values to registers/inputs
			BusMuxIn_R0 <= 32'd2;
			BusMuxIn_R1 <= 32'd4;
			BusMuxIn_R2 <= 32'd6;
			BusMuxIn_R3 <= 32'd8;
			BusMuxIn_R4 <= 32'd10;
			BusMuxIn_R5 <= 32'd12;
			BusMuxIn_R6 <= 32'd14;
			BusMuxIn_R7 <= 32'd16;
			BusMuxIn_R8 <= 32'd18;
			BusMuxIn_R9 <= 32'd20;
			BusMuxIn_R10 <= 32'd22;
			BusMuxIn_R11 <= 32'd24;
			BusMuxIn_R12 <= 32'd26;
			BusMuxIn_R13 <= 32'd28;
			BusMuxIn_R14 <= 32'd30;
			BusMuxIn_R15 <= 32'd32;
			BusMuxIn_HI <= 32'd34;
			BusMuxIn_LO <= 32'd36;
			BusMuxIn_Zhigh <= 32'd38;
			BusMuxIn_Zlow <= 32'd40;
			BusMuxIn_PC <= 32'd42;
			BusMuxIn_MDR <= 32'd44;
			BusMuxIn_InPort <= 32'd46;
			C_sign_extended <= 32'd48;
			// loop through all input selects
			bus_select <= 32'h00000001;
			#10;
			bus_select <= 32'h00000002;
			#10;
			bus_select <= 32'h00000004;
			#10;
			bus_select <= 32'h00000008;
			#10;
			bus_select <= 32'h00000010;
			#10;
			bus_select <= 32'h00000020;
			#10;
			bus_select <= 32'h00000040;
			#10;
			bus_select <= 32'h00000080;
			#10;
			bus_select <= 32'h00000100;
			#10;
			bus_select <= 32'h00000200;
			#10;
			bus_select <= 32'h00000400;
			#10;
			bus_select <= 32'h00000800;
			#10;
			bus_select <= 32'h00001000;
			#10;
			bus_select <= 32'h00002000;
			#10;
			bus_select <= 32'h00004000;
			#10;
			bus_select <= 32'h00008000;
			#10;
			bus_select <= 32'h00010000;
			#10;
			bus_select <= 32'h00020000;
			#10;
			bus_select <= 32'h00040000;
			#10;
			bus_select <= 32'h00080000;
			#10;
			bus_select <= 32'h00100000;
			#10;
			bus_select <= 32'h00200000;
			#10;
			bus_select <= 32'h00400000;
			#10;
			bus_select <= 32'h00800000;
			#10;
		end
endmodule