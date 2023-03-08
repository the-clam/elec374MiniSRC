`timescale 1ns / 10ps
module tb_brpl_true;
    // CPU Signals
    reg clk = 0; reg clr = 0;
    // Bus Register Input Controls
    wire [15:0] RX_in;
    reg PC_in, IR_in, Y_in, Z_in, HI_in, LO_in, MAR_in, MDR_in, OutPort_in, IncPC;
    // Bus Register Output Controls
    wire [15:0] RX_out;
    reg PC_out, Zhigh_out, Zlow_out, HI_out, LO_out, MDR_out, InPort_out, C_out;
    
    // Signals to RAM
    reg Read, Write;
    // Select and Encode Logic Signals
    reg Gra, Grb, Grc, Rin, Rout, BAout;
    // Signals from CON FF Logic
    wire CON_out;
    // instruction bits for alu
    reg [4:0] alu_instruction_bits;
	// input/output ports
    reg [31:0] InPort_Data_In;
    wire [31:0] Outport_Data_Out;
    // input for registers
    reg [15:0] RX_in_man, RX_out_man;

    // Data Signals for Bus, ALU, and Registers
    wire [31:0] Bus_Data, ALUHigh_Data, ALULow_Data, R0_Data, R1_Data, R2_Data, R3_Data, R4_Data, R5_Data,
        R6_Data, R7_Data, R8_Data, R9_Data, R10_Data, R11_Data, R12_Data, R13_Data, R14_Data, R15_Data,
        PC_Data, IR_Data, Y_Data, Zhigh_Data, Zlow_Data, HI_Data, LO_Data, MAR_Data, MDR_Data, 
        InPort_Data, C_sign_extended_Data, Mdatain;

datapath DUT(
    .clk(clk), .clr(clr), .RX_in(RX_in), .PC_in(PC_in), .IR_in(IR_in), .Y_in(Y_in), .Z_in(Z_in),
    .HI_in(HI_in), .LO_in(LO_in), .MAR_in(MAR_in), .MDR_in(MDR_in), .Read(Read), .OutPort_in(OutPort_in),
    .IncPC(IncPC), .RX_out(RX_out), .PC_out(PC_out), .Zhigh_out(Zhigh_out), .Zlow_out(Zlow_out), 
    .HI_out(HI_out), .LO_out(LO_out), .MDR_out(MDR_out), .InPort_out(InPort_out), .C_out(C_out), 
    .Bus_Data(Bus_Data), .ALUHigh_Data(ALUHigh_Data), .ALULow_Data(ALULow_Data), .R0_Data(R0_Data), 
    .R1_Data(R1_Data), .R2_Data(R2_Data), .R3_Data(R3_Data), .R4_Data(R4_Data), .R5_Data(R5_Data), 
    .R6_Data(R6_Data), .R7_Data(R7_Data), .R8_Data(R8_Data), .R9_Data(R9_Data), .R10_Data(R10_Data), 
    .R11_Data(R11_Data), .R12_Data(R12_Data), .R13_Data(R13_Data), .R14_Data(R14_Data), 
    .R15_Data(R15_Data), .HI_Data(HI_Data), .PC_Data(PC_Data), .IR_Data(IR_Data), .Y_Data(Y_Data),
    .Zhigh_Data(Zhigh_Data), .Zlow_Data(Zlow_Data), .LO_Data(LO_Data), .MAR_Data(MAR_Data),
    .MDR_Data(MDR_Data), .InPort_Data(InPort_Data), .C_sign_extended_Data(C_sign_extended_Data), 
    .Mdatain(Mdatain), .Write(Write), .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), 
    .BAout(BAout), .CON_out(CON_out), .alu_instruction_bits(alu_instruction_bits),
    .InPort_Data_In(InPort_Data_In), .Outport_Data_Out(Outport_Data_Out),
    .RX_in_man(RX_in_man), .RX_out_man(RX_out_man)
);

initial
begin
    clk = 1;
    forever begin clk = ~clk; #10; end
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////













endmodule