`timescale 1ns / 10ps
module datapath(
    // CPU Signals
    input clk,
    input clr,
    
    // Register Input Controls
    input wire R0_in, R1_in, R2_in, R3_in, R4_in, R5_in, 
    input wire R6_in, R7_in, R8_in, R9_in, R10_in,
    input wire R11_in, R12_in, R13_in, R14_in, R15_in,
    input wire PC_in, IR_in,
    input wire Y_in,
    input wire Z_in,
    input wire MAR_in, MDR_in,
    input wire HI_in, LO_in,
    input wire Read,

    // Bus Select Controls
    input wire R0_out, R1_out, R2_out, R3_out, R4_out, R5_out,
    input wire R6_out, R7_out, R8_out, R9_out, R10_out,
    input wire R11_out, R12_out, R13_out, R14_out, R15_out,
    input wire HI_out, LO_out,
    input wire Zhigh_out, Zlow_out,
    input wire PC_out,
    input wire MDR_out,
    input wire InPort_out,
    input wire C_out,

    // ALU opcode
    input wire [4:0] alu_instruction,
    
    // Data Signals
    output wire [31:0] Bus_Data, // Current active data in bus.
    output wire [31:0] ALUHigh_Data, ALULow_Data, // Data coming out from ALU -> Z regs.
    output wire [31:0] R0_Data, R1_Data, R2_Data, R3_Data, R4_Data, R5_Data,
    output wire [31:0] R6_Data, R7_Data, R8_Data, R9_Data, R10_Data,
    output wire [31:0] R11_Data, R12_Data, R13_Data, R14_Data, R15_Data,
    output wire [31:0] PC_Data, IR_Data,
    output wire [31:0] Y_Data, // Wire to carry data from temp reg Y to ALU input A.
    output wire [31:0] Zhigh_Data, Zlow_Data,
    output wire [31:0] MAR_Data, MDR_Data,
    output wire [31:0] HI_Data, LO_Data,
    output wire [31:0] InPort_Data,
    output wire [31:0] C_sign_extended_Data,
    input wire [31:0] Mdatain
);

/* REGISTERS */
reg32 R0_reg (.clr(clr), .clk(clk), .en(R0_in), .D(Bus_Data), .Q(R0_Data));
reg32 R1_reg (.clr(clr), .clk(clk), .en(R1_in), .D(Bus_Data), .Q(R1_Data));
reg32 R2_reg (.clr(clr), .clk(clk), .en(R2_in), .D(Bus_Data), .Q(R2_Data));
reg32 R3_reg (.clr(clr), .clk(clk), .en(R3_in), .D(Bus_Data), .Q(R3_Data));
reg32 R4_reg (.clr(clr), .clk(clk), .en(R4_in), .D(Bus_Data), .Q(R4_Data));
reg32 R5_reg (.clr(clr), .clk(clk), .en(R5_in), .D(Bus_Data), .Q(R5_Data));
reg32 R6_reg (.clr(clr), .clk(clk), .en(R6_in), .D(Bus_Data), .Q(R6_Data));
reg32 R7_reg (.clr(clr), .clk(clk), .en(R7_in), .D(Bus_Data), .Q(R7_Data));
reg32 R8_reg (.clr(clr), .clk(clk), .en(R8_in), .D(Bus_Data), .Q(R8_Data));
reg32 R9_reg (.clr(clr), .clk(clk), .en(R9_in), .D(Bus_Data), .Q(R9_Data));
reg32 R10_reg (.clr(clr), .clk(clk), .en(R10_in), .D(Bus_Data), .Q(R10_Data));
reg32 R11_reg (.clr(clr), .clk(clk), .en(R11_in), .D(Bus_Data), .Q(R11_Data));
reg32 R12_reg (.clr(clr), .clk(clk), .en(R12_in), .D(Bus_Data), .Q(R12_Data));
reg32 R13_reg (.clr(clr), .clk(clk), .en(R13_in), .D(Bus_Data), .Q(R13_Data));
reg32 R14_reg (.clr(clr), .clk(clk), .en(R14_in), .D(Bus_Data), .Q(R14_Data));
reg32 R15_reg (.clr(clr), .clk(clk), .en(R15_in), .D(Bus_Data), .Q(R15_Data));
reg32 PC_reg (.clr(clr), .clk(clk), .en(PC_in), .D(Bus_Data), .Q(PC_Data));
reg32 IR_reg (.clr(clr), .clk(clk), .en(IR_in), .D(Bus_Data), .Q(IR_Data));
reg32 Y_reg (.clr(clr), .clk(clk), .en(Y_in), .D(Bus_Data), .Q(Y_Data));
reg32 Zhigh_reg (.clr(clr), .clk(clk), .en(Z_in), .D(ALUHigh_Data), .Q(Zhigh_Data));
reg32 Zlow_reg (.clr(clr), .clk(clk), .en(Z_in), .D(ALULow_Data), .Q(Zlow_Data));
reg32 MAR_reg (.clr(clr), .clk(clk), .en(MAR_in), .D(Bus_Data), .Q(MAR_Data)); // Data to be sent to memory unit eventually, leave output blank because there's no "output" to plug into.
reg32 HI_reg (.clr(clr), .clk(clk), .en(HI_in), .D(Bus_Data), .Q(HI_Data));
reg32 LO_reg (.clr(clr), .clk(clk), .en(LO_in), .D(Bus_Data), .Q(LO_Data));
reg32_mdr MDR_reg (.clr(clr), .clk(clk), .en(MDR_in), .MDMuxIn0(Bus_Data), .MDMuxIn1(Mdatain), .MDMux_sel(Read), .Q(MDR_Data));

/* BUS */
bus the_bus(
    // Out Signals
    .R0out(R0_out), .R1out(R1_out), .R2out(R2_out), .R3out(R3_out), .R4out(R4_out), .R5out(R5_out),
    .R6out(R6_out), .R7out(R7_out), .R8out(R8_out), .R9out(R9_out), .R10out(R10_out), .R11out(R11_out),
    .R12out(R12_out), .R13out(R13_out), .R14out(R14_out), .R15out(R15_out),
    .HIout(HI_out), .LOout(LO_out),
    .Zhighout(Zhigh_out), .Zlowout(Zlow_out),
    .PCout(PC_out),
    .MDRout(MDR_out),
    .InPortout(InPort_out),
    .Cout(C_out),
    // Mux In
    .BusMuxIn_R0(R0_Data), .BusMuxIn_R1(R1_Data), .BusMuxIn_R2(R2_Data), .BusMuxIn_R3(R3_Data), .BusMuxIn_R4(R4_Data), .BusMuxIn_R5(R5_Data),
    .BusMuxIn_R6(R6_Data), .BusMuxIn_R7(R7_Data), .BusMuxIn_R8(R8_Data), .BusMuxIn_R9(R9_Data), .BusMuxIn_R10(R10_Data), .BusMuxIn_R11(R11_Data),
    .BusMuxIn_R12(R12_Data), .BusMuxIn_R13(R13_Data), .BusMuxIn_R14(R14_Data), .BusMuxIn_R15(R15_Data),
    .BusMuxIn_HI(HI_Data), .BusMuxIn_LO(LO_Data),
    .BusMuxIn_Zhigh(Zhigh_Data), .BusMuxIn_Zlow(Zlow_Data),
    .BusMuxIn_PC(PC_Data),
    .BusMuxIn_MDR(MDR_Data),
    .BusMuxIn_InPort(InPort_Data),
    .C_sign_extended(C_sign_extended_Data),
    // Bus Output 
    .BusMuxOut(Bus_Data)
);

/* ALU */
alu the_alu(
    .instruction(alu_instruction),
    .A_in(Y_Data), .B_in(Bus_Data),
    .Z_high(ALUHigh_Data), .Z_low(ALULow_Data)
);

endmodule