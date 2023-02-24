`timescale 1ns / 10ps
module datapath(
	// Input Control Signals
	input wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	input wire HIin, LOin, PCin, IRin, Zin, Yin, MARin, MDRin, Read,
	// Output Control Signals
	input wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input wire HIout, LOout, PCout, Zhighout, Zlowout, MDRout, InPortout, Cout,
	// Data Signals
	input wire [4:0] alu_instruction,
	input wire [31:0] Mdatain,

	// Output Signals - not currently used but will eventually replace the other wires so they can be displayed
	output wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, IR, BusMuxOut,
	output wire [63:0] Z_out,

	// CPU signals
	input clock, clear
);

/* WIRES TO CONNECT REGISTER TO BUS */
wire [31:0] BusMuxIn_Zhigh, BusMuxIn_Zlow, BusMuxIn_MDR, BusMuxIn_InPort, C_sign_extended;

/* WIRES TO CONNECT BUS AND ALU */
wire [31:0] A_alu, B_alu, Z_hi_alu, Z_lo_alu;

/* REGISTERS */
// General Purpose
reg32 R0_reg (.clr(clear), .clk(clock), .en(R0in), .D(BusMuxOut), .Q(R0));
reg32 R1_reg (.clr(clear), .clk(clock), .en(R1in), .D(BusMuxOut), .Q(R1));
reg32 R2_reg (.clr(clear), .clk(clock), .en(R2in), .D(BusMuxOut), .Q(R2));
reg32 R3_reg (.clr(clear), .clk(clock), .en(R3in), .D(BusMuxOut), .Q(R3));
reg32 R4_reg (.clr(clear), .clk(clock), .en(R4in), .D(BusMuxOut), .Q(R4));
reg32 R5_reg (.clr(clear), .clk(clock), .en(R5in), .D(BusMuxOut), .Q(R5));
reg32 R6_reg (.clr(clear), .clk(clock), .en(R6in), .D(BusMuxOut), .Q(R6));
reg32 R7_reg (.clr(clear), .clk(clock), .en(R7in), .D(BusMuxOut), .Q(R7));
reg32 R8_reg (.clr(clear), .clk(clock), .en(R8in), .D(BusMuxOut), .Q(R8));
reg32 R9_reg (.clr(clear), .clk(clock), .en(R9in), .D(BusMuxOut), .Q(R9));
reg32 R10_reg (.clr(clear), .clk(clock), .en(R10in), .D(BusMuxOut), .Q(R10));
reg32 R11_reg (.clr(clear), .clk(clock), .en(R11in), .D(BusMuxOut), .Q(R11));
reg32 R12_reg (.clr(clear), .clk(clock), .en(R12in), .D(BusMuxOut), .Q(R12));
reg32 R13_reg (.clr(clear), .clk(clock), .en(R13in), .D(BusMuxOut), .Q(R13));
reg32 R14_reg (.clr(clear), .clk(clock), .en(R14in), .D(BusMuxOut), .Q(R14));
reg32 R15_reg (.clr(clear), .clk(clock), .en(R15in), .D(BusMuxOut), .Q(R15));
// Others
reg32 PC_reg (.clr(clear), .clk(clock), .en(PCin), .D(BusMuxOut), .Q(PC));
reg32 IR_reg (.clr(clear), .clk(clock), .en(IRin), .D(BusMuxOut), .Q(IR));
reg32 Y_reg (.clr(clear), .clk(clock), .en(Yin), .D(BusMuxOut), .Q(A_alu));
reg32 Zhigh_reg	(.clr(clear), .clk(clock), .en(Zin), .D(Z_hi_alu), .Q(BusMuxIn_Zhigh));
reg32 Zlow_reg (.clr(clear), .clk(clock), .en(Zin), .D(Z_lo_alu), .Q(BusMuxIn_Zlow)); 
reg32 MAR_reg (.clr(clear), .clk(clock), .en(MARin), .D(BusMuxOut), .Q()); // Q should go to memory chip?
reg32 HI_reg (.clr(clear), .clk(clock), .en(HIin), .D(BusMuxOut), .Q(HI));
reg32 LO_reg (.clr(clear), .clk(clock), .en(LOin), .D(BusMuxOut), .Q(LO));
// MDR Register
reg32_mdr MDR_reg (
	.BusMuxOut(BusMuxOut), 
	.Mdatain(Mdatain),
	.read(Read),
	.clear(clear),
	.clock(clock),
	.MDRin(MDRin),
	.MDR_out(BusMuxIn_MDR)
);

/* BUS */
bus cpu_bus(
	// Encoder Inputs
	.R0out(R0out), .R1out(R1out), .R2out(R2out), .R3out(R3out), .R4out(R4out), .R5out(R5out), .R6out(R6out), .R7out(R7out),
	.R8out(R8out), .R9out(R9out), .R10out(R10out), .R11out(R11out), .R12out(R12out), .R13out(R13out), .R14out(R14out), .R15out(R15out),
	.HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout), .PCout(PCout), .MDRout(MDRout), .InPortout(InPortout), .Cout(Cout),
	// Multiplexer Inputs
	.BusMuxIn_R0(R0), .BusMuxIn_R1(R1), .BusMuxIn_R2(R2), .BusMuxIn_R3(R3), .BusMuxIn_R4(R4), .BusMuxIn_R5(R5),
	.BusMuxIn_R6(R6), .BusMuxIn_R7(R7), .BusMuxIn_R8(R8), .BusMuxIn_R9(R9), .BusMuxIn_R10(R10), .BusMuxIn_R11(R11), 
	.BusMuxIn_R12(R12), .BusMuxIn_R13(R13), .BusMuxIn_R14(R14), .BusMuxIn_R15(R15), .BusMuxIn_HI(HI), .BusMuxIn_LO(LO),
	.BusMuxIn_Zhigh(BusMuxIn_Zhigh), .BusMuxIn_Zlow(BusMuxIn_Zlow), .BusMuxIn_PC(PC), .BusMuxIn_MDR(BusMuxIn_MDR), .BusMuxIn_InPort(BusMuxIn_InPort), .C_sign_extended(C_sign_extended),
	// Bus Output
	.BusMuxOut(BusMuxOut)
);

alu cpu_alu(
	.instruction(alu_instruction),
	.B_in(BusMuxOut),
	.Y_in(A_alu),
	.Z_hi(Z_hi_alu),
	.Z_lo(Z_lo_alu)
);
endmodule