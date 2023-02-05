`timescale 1 ns/10 ps
module bus_tb;
	// bus device select
	reg R0out;
	reg R1out;
	reg R2out;
	reg R3out;
	reg R4out;
	reg R5out;
	reg R6out;
	reg R7out;
	reg R8out;
	reg R9out;
	reg R10out;
	reg R11out;
	reg R12out;
	reg R13out;
	reg R14out;
	reg R15out;
	reg HIout;
	reg LOout;
	reg Zhighout;
	reg Zlowout;
	reg PCout;
	reg MDRout;
	reg InPortout;
	reg Cout;
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
		.R0out(R0out), 
		.R1out(R1out),
		.R2out(R2out),
		.R3out(R3out),
		.R4out(R4out),
		.R5out(R5out),
		.R6out(R6out),
		.R7out(R7out),
		.R8out(R8out),
		.R9out(R9out),
		.R10out(R10out),
		.R11out(R11out),
		.R12out(R12out),
		.R13out(R13out),
		.R14out(R14out),
		.R15out(R15out),
		.HIout(HIout),
		.LOout(LOout),
		.Zhighout(Zhighout),
		.Zlowout(Zlowout),
		.PCout(PCout),
		.MDRout(MDRout),
		.InPortout(InPortout),
		.Cout(Cout),
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
			R0out <= 0;
			R1out <= 0;
			R2out <= 0;
			R3out <= 0;
			R4out <= 0;
			R5out <= 0;
			R6out <= 0;
			R7out <= 0;
			R8out <= 0;
			R9out <= 0;
			R10out <= 0;
			R11out <= 0;
			R12out <= 0;
			R13out <= 0;
			R14out <= 0;
			R15out <= 0;
			HIout <= 0;
			LOout <= 0;
			Zhighout <= 0;
			Zlowout <= 0;
			PCout <= 0;
			MDRout <= 0;
			InPortout <= 0;
			Cout <= 0;
			// start testing
			R0out <= 1;
			#10;
			R0out <= 0;
			R1out <= 1;
			#10;
			R1out <= 0;
			R2out <= 1;
			#10;
			R2out <= 0;
			R3out <= 1;
			#10;
			R3out <= 0;
			R4out <= 1;
			#10;
			R4out <= 0;
			R5out <= 1;
			#10;
			R5out <= 0;
			R6out <= 1;
			#10;
			R6out <= 0;
			R7out <= 1;
			#10;
			R7out <= 0;
			R8out <= 1;
			#10;
			R8out <= 0;
			R9out <= 1;
			#10;
			R9out <= 0;
			R10out <= 1;
			#10;
			R10out <= 0;
			R11out <= 1;
			#10;
			R11out <= 0;
			R12out <= 1;
			#10;
			R12out <= 0;
			R13out <= 1;
			#10;
			R13out <= 0;
			R14out <= 1;
			#10;
			R14out <= 0;
			R15out <= 1;
			#10;
			R15out <= 0;
			HIout <= 1;
			#10;
			HIout <= 0;
			LOout <= 1;
			#10;
			LOout <= 0;
			Zhighout <= 1;
			#10;
			Zhighout <= 0;
			Zlowout <= 1;
			#10;
			Zlowout <= 0;
			PCout <= 1;
			#10;
			PCout <= 0;
			MDRout <= 1;
			#10;
			MDRout <= 0;
			InPortout <= 1;
			#10;
			InPortout <= 0;
			Cout <= 1;
			#10;
			Cout <= 0;
		end
endmodule