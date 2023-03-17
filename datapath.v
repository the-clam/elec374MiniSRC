module datapath(
    // System Inputs
    input wire clk,
    input wire reset, // external reset button to start from beginning
    input wire stop, // external stop, same action as halt instruction
    input wire [31:0] InPort_Data_In,
    output wire [31:0] Outport_Data_Out,
    output wire run, // indicates whether program is running or not
    output wire clr, // signal from control unit to indicate clearing to rest of Mini SRC

    // Bus Register Input Controls
    output wire [15:0] RX_in, // receives input from select and encode
    output wire PC_in, IR_in, Y_in, Z_in, HI_in, LO_in, MAR_in, MDR_in, OutPort_in, IncPC,
    // Bus Register Output Controls
    output wire [15:0] RX_out, // receives input from select and encode
    output wire PC_out, Zhigh_out, Zlow_out, HI_out, LO_out, MDR_out, InPort_out, C_out,
    // Data Signals for Bus, ALU, and Registers
    output wire [31:0] Bus_Data, ALUHigh_Data, ALULow_Data, R0_Data, R1_Data, R2_Data, R3_Data, R4_Data, 
        R5_Data, R6_Data, R7_Data, R8_Data, R9_Data, R10_Data, R11_Data, R12_Data, R13_Data, R14_Data,
        R15_Data, PC_Data, IR_Data, Y_Data, Zhigh_Data, Zlow_Data, HI_Data, LO_Data, MAR_Data, MDR_Data,
        InPort_Data, C_sign_extended_Data, Mdatain,
    // Signals to RAM/MDR
    output wire Read, Write,
    // Select and Encode Logic Signals
    output wire Gra, Grb, Grc, Rin, Rout, BAout,
    // Signals for CON FF Logic
    output wire CON_out, CON_in,
    // instruction bits for alu
    output wire [4:0] alu_instruction_bits,
    // manual input enable for registers
    output wire [15:0] RX_in_man
);
/* REGISTERS */
reg32_baout R0_reg (
    .clr(clr), .clk(clk), .en(RX_in[0]|RX_in_man[0]),
    .BAout(BAout), .D(Bus_Data), .Q(R0_Data)
);
reg32 R1_reg (.clr(clr), .clk(clk), .en(RX_in[1]|RX_in_man[1]), .D(Bus_Data), .Q(R1_Data));
reg32 R2_reg (.clr(clr), .clk(clk), .en(RX_in[2]|RX_in_man[2]), .D(Bus_Data), .Q(R2_Data));
reg32 R3_reg (.clr(clr), .clk(clk), .en(RX_in[3]|RX_in_man[3]), .D(Bus_Data), .Q(R3_Data));
reg32 R4_reg (.clr(clr), .clk(clk), .en(RX_in[4]|RX_in_man[4]), .D(Bus_Data), .Q(R4_Data));
reg32 R5_reg (.clr(clr), .clk(clk), .en(RX_in[5]|RX_in_man[5]), .D(Bus_Data), .Q(R5_Data));
reg32 R6_reg (.clr(clr), .clk(clk), .en(RX_in[6]|RX_in_man[6]), .D(Bus_Data), .Q(R6_Data));
reg32 R7_reg (.clr(clr), .clk(clk), .en(RX_in[7]|RX_in_man[7]), .D(Bus_Data), .Q(R7_Data));
reg32 R8_reg (.clr(clr), .clk(clk), .en(RX_in[8]|RX_in_man[8]), .D(Bus_Data), .Q(R8_Data));
reg32 R9_reg (.clr(clr), .clk(clk), .en(RX_in[9]|RX_in_man[9]), .D(Bus_Data), .Q(R9_Data));
reg32 R10_reg (.clr(clr), .clk(clk), .en(RX_in[10]|RX_in_man[10]), .D(Bus_Data), .Q(R10_Data));
reg32 R11_reg (.clr(clr), .clk(clk), .en(RX_in[11]|RX_in_man[11]), .D(Bus_Data), .Q(R11_Data));
reg32 R12_reg (.clr(clr), .clk(clk), .en(RX_in[12]|RX_in_man[12]), .D(Bus_Data), .Q(R12_Data));
reg32 R13_reg (.clr(clr), .clk(clk), .en(RX_in[13]|RX_in_man[13]), .D(Bus_Data), .Q(R13_Data));
reg32 R14_reg (.clr(clr), .clk(clk), .en(RX_in[14]|RX_in_man[14]), .D(Bus_Data), .Q(R14_Data));
reg32 R15_reg (.clr(clr), .clk(clk), .en(RX_in[15]|RX_in_man[15]), .D(Bus_Data), .Q(R15_Data));
reg32 PC_reg (.clr(clr), .clk(clk), .en(PC_in), .D(Bus_Data), .Q(PC_Data));
reg32 IR_reg (.clr(clr), .clk(clk), .en(IR_in), .D(Bus_Data), .Q(IR_Data));
reg32 Y_reg (.clr(clr), .clk(clk), .en(Y_in), .D(Bus_Data), .Q(Y_Data));
reg32 Zhigh_reg (.clr(clr), .clk(clk), .en(Z_in), .D(ALUHigh_Data), .Q(Zhigh_Data));
reg32 Zlow_reg (.clr(clr), .clk(clk), .en(Z_in), .D(ALULow_Data), .Q(Zlow_Data));
reg32 MAR_reg (.clr(clr), .clk(clk), .en(MAR_in), .D(Bus_Data), .Q(MAR_Data));
reg32 HI_reg (.clr(clr), .clk(clk), .en(HI_in), .D(Bus_Data), .Q(HI_Data));
reg32 LO_reg (.clr(clr), .clk(clk), .en(LO_in), .D(Bus_Data), .Q(LO_Data));
// MDR Reg
reg32_mdr MDR_reg (
    .clr(clr), .clk(clk), .en(MDR_in), 
    .MDMuxIn0(Bus_Data), .MDMuxIn1(Mdatain), .MDMux_sel(Read), .Q(MDR_Data)
);
/* INPUT/OUTPUT PORTS */
reg32 InPort (.clr(clr), .clk(clk), .en(1'b1), .D(InPort_Data_In), .Q(InPort_Data));
reg32 OutPort (.clr(clr), .clk(clk), .en(OutPort_in), .D(Bus_Data), .Q(Outport_Data_Out));
/* BUS */
bus the_bus(
    // Out Signals
    .R0out(RX_out[0]), .R1out(RX_out[1]), .R2out(RX_out[2]), .R3out(RX_out[3]), .R4out(RX_out[4]),
    .R5out(RX_out[5]), .R6out(RX_out[6]), .R7out(RX_out[7]), .R8out(RX_out[8]), .R9out(RX_out[9]),
    .R10out(RX_out[10]), .R11out(RX_out[11]), .R12out(RX_out[12]), .R13out(RX_out[13]), 
    .R14out(RX_out[14]), .R15out(RX_out[15]), .HIout(HI_out), .LOout(LO_out),
    .Zhighout(Zhigh_out), .Zlowout(Zlow_out), .PCout(PC_out), .MDRout(MDR_out),
    .InPortout(InPort_out), .Cout(C_out),
    // Mux In
    .BusMuxIn_R0(R0_Data), .BusMuxIn_R1(R1_Data), .BusMuxIn_R2(R2_Data), .BusMuxIn_R3(R3_Data), 
    .BusMuxIn_R4(R4_Data), .BusMuxIn_R5(R5_Data), .BusMuxIn_R6(R6_Data), .BusMuxIn_R7(R7_Data),
    .BusMuxIn_R8(R8_Data), .BusMuxIn_R9(R9_Data), .BusMuxIn_R10(R10_Data), .BusMuxIn_R11(R11_Data),
    .BusMuxIn_R12(R12_Data), .BusMuxIn_R13(R13_Data), .BusMuxIn_R14(R14_Data), .BusMuxIn_R15(R15_Data),
    .BusMuxIn_HI(HI_Data), .BusMuxIn_LO(LO_Data), .BusMuxIn_Zhigh(Zhigh_Data), .BusMuxIn_Zlow(Zlow_Data),
    .BusMuxIn_PC(PC_Data), .BusMuxIn_MDR(MDR_Data), .BusMuxIn_InPort(InPort_Data),
    .C_sign_extended(C_sign_extended_Data), .BusMuxOut(Bus_Data)
);
/* ALU */
alu the_alu(
    .alu_instruction_bits(alu_instruction_bits), .A_in(Y_Data), .B_in(Bus_Data), .IncPC(IncPC), 
	 .Z_high(ALUHigh_Data), .Z_low(ALULow_Data)
);
/* RAM */
memory_ram the_ram(
    .clk(clk), .read(Read), .write(Write), .address_in(MAR_Data), 
    .data_input(MDR_Data), .data_output(Mdatain)
);
/* SELECT & ENCODE LOGIC MODULE */
select_encode the_select_encode(
    .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout),
	.IR_Data(IR_Data), .C_sign_extended(C_sign_extended_Data), .RXin(RX_in), .RXout(RX_out)
);
/* CON FF LOGIC */
con_ff_logic the_con_ff_logic(
    .CON_in(CON_in), .clr(clr), .IR_Data_In(IR_Data), .Bus_Data_In(Bus_Data), .CON_out(CON_out)
);
/* CONTROL UNIT */
control_unit the_control_unit(
    // Inputs
    .clk(clk), .reset(reset), .stop(stop), .CON_FF(CON_out),
    .IR_Data(IR_Data),
    // Outputs
    .run(run), .clr(clr),
    .Rout(Rout), .PC_out(PC_out), .MDR_out(MDR_out), .Zhigh_out(Zhigh_out), .Zlow_out(Zlow_out),
        .HI_out(HI_out), .LO_out(LO_out), .InPort_out(InPort_out), .C_out(C_out),
    .Rin(Rin), .HI_in(HI_in), .LO_in(LO_in), .PC_in(PC_in), .IR_in(IR_in), .Y_in(Y_in), .Z_in(Z_in),
        .MAR_in(MAR_in), .MDR_in(MDR_in), .OutPort_in(OutPort_in),
    .RX_in_man(RX_in_man),
    .alu_instruction_bits(alu_instruction_bits),
    .IncPC(IncPC),
    .Read(Read), .Write(Write),
    .Gra(Gra), .Grb(Grb), .Grc(Grc), .BAout(BAout),
    .CON_in(CON_in)
);
endmodule