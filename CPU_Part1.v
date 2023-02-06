`timescale 1ns / 10ps
module CPU_Part1(
	/* INPUTS */
	// enable signal for general purpose registers to accept data from BusMux
	input wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	// control signal for general purpose registers to output reg to bus
	input wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,

	// control signals for other bus elements
	input wire HIin, input wire HIout,
	input wire LOin, input wire LOout,
	input wire PCin, input wire PCout,
	// input wire IRin,
	input wire Zin, input wire Zhighout, input wire Zlowout,
	//// input wire Yin,
	//// input wire MARin,
	input wire MDRin, input wire MDRout,
	input wire Read,
	input wire [31:0] Mdatain,

	// other misc inputs
	input wire clr,
	input wire clk,
	input wire InPortin,
	input wire Cin,

	/* OUTPUTS */
	output reg [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, IR, BusMuxOut, Z
);

/* REGISTERS */
	// General Purpose
	reg32 R0_reg(.clr(clr), .clk(clk), .en(R0in), .D(BusMuxOut), .Q(BusMuxIn_R0));
	reg32 R1_reg(.clr(clr), .clk(clk), .en(R1in), .D(BusMuxOut), .Q(BusMuxIn_R1));
	reg32 R2_reg(.clr(clr), .clk(clk), .en(R2in), .D(BusMuxOut), .Q(BusMuxIn_R2));
	reg32 R3_reg(.clr(clr), .clk(clk), .en(R3in), .D(BusMuxOut), .Q(BusMuxIn_R3));
	reg32 R4_reg(.clr(clr), .clk(clk), .en(R4in), .D(BusMuxOut), .Q(BusMuxIn_R4));
	reg32 R5_reg(.clr(clr), .clk(clk), .en(R5in), .D(BusMuxOut), .Q(BusMuxIn_R5));
	reg32 R6_reg(.clr(clr), .clk(clk), .en(R6in), .D(BusMuxOut), .Q(BusMuxIn_R6));
	reg32 R7_reg(.clr(clr), .clk(clk), .en(R7in), .D(BusMuxOut), .Q(BusMuxIn_R7));
	reg32 R8_reg(.clr(clr), .clk(clk), .en(R8in), .D(BusMuxOut), .Q(BusMuxIn_R8));
	reg32 R9_reg(.clr(clr), .clk(clk), .en(R9in), .D(BusMuxOut), .Q(BusMuxIn_R9));
	reg32 R10_reg(.clr(clr), .clk(clk), .en(R10in), .D(BusMuxOut), .Q(BusMuxIn_R10));
	reg32 R11_reg(.clr(clr), .clk(clk), .en(R11in), .D(BusMuxOut), .Q(BusMuxIn_R11));
	reg32 R12_reg(.clr(clr), .clk(clk), .en(R12in), .D(BusMuxOut), .Q(BusMuxIn_R12));
	reg32 R13_reg(.clr(clr), .clk(clk), .en(R13in), .D(BusMuxOut), .Q(BusMuxIn_R13));
	reg32 R14_reg(.clr(clr), .clk(clk), .en(R14in), .D(BusMuxOut), .Q(BusMuxIn_R14));
	reg32 R15_reg(.clr(clr), .clk(clk), .en(R15in), .D(BusMuxOut), .Q(BusMuxIn_R15));
	// Other Registers
	reg32 HI_reg(.clr(clr), .clk(clk), .en(HIin), .D(BusMuxOut), .Q(BusMuxIn_HI));
	reg32 LO_reg(.clr(clr), .clk(clk), .en(LOin), .D(BusMuxOut), .Q(BusMuxIn_LO));
	//// reg32 Y(.clr(clr), .clk(clk), .en(Yin), .D(BusMuxOut), .Q(//ALU)
	reg32 Zhigh_reg(.clr(clr), .clk(clk), .en(Zin), .D(BusMuxOut), .Q(BusMuxIn_Zhigh));
	reg32 Zlo_reg(.clr(clr), .clk(clk), .en(Zin), .D(BusMuxOut), .Q(BusMuxIn_Zlow));
	reg32 PC_reg(.clr(clr), .clk(clk), .en(PCin), .D(BusMuxOut), .Q(BusMuxIn_PC));
	reg32_mdr MDR_reg(.BusMuxOut(BusMuxOut), .Mdatain(Mdatain), .read(Read), .clear(clr), .clock(clk), .MDRin(MDRin), .MDRout(BusMuxIn_MDR));
	reg32 InPort_reg(.clr(clr), .clk(clk), .en(InPortin), .D(BusMuxOut), .Q(BusMuxIn_InPort));
	reg32 C_reg(.clr(clr), .clk(clk), .en(Cin), .D(BusMuxOut), .Q(C_sign_extended));

bus cpu_bus(
	// Enable signals for each register to be inputted to the 32-to-5 encoder
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
	// Inputs to the 32-to-1 mux
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
	// bus output
	.BusMuxOut(BusMuxOut)

);

endmodule