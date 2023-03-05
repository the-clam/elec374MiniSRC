`timescale 1ns / 10ps
module template_tb;
    // CPU Signals
    reg clk = 0; reg clr = 0;
    // Bus Register Input Controls
    reg [15:0] RX_in;
    reg PC_in, IR_in, Y_in, Z_in, HI_in, LO_in, MAR_in, MDR_in, Read, OutPort_in,
    // Bus Register Output Controls
    reg [15:0] RX_out;
    reg PC_out, Zhigh_out, Zlow_out, HI_out, LO_out, MDR_out, InPort_out, C_out,
    // Data Signals for Bus, ALU, and Registers
    wire [31:0] Bus_Data, ALUHigh_Data, ALULow_Data, R0_Data, R1_Data, R2_Data, R3_Data, R4_Data, R5_Data,
        R6_Data, R7_Data, R8_Data, R9_Data, R10_Data, R11_Data, R12_Data, R13_Data, R14_Data, R15_Data,
        PC_Data, IR_Data, Y_Data, Zhigh_Data, Zlow_Data, HI_Data, LO_Data, MAR_Data, MDR_Data, InPort_Data,
        C_sign_extended_Data, Mdatain,
    // Signals to RAM
    reg RAM_write,
    // Select and Encode Logic Signals
    reg Gra, Grb, Grc, Rin, Rout, BAout,
    // Signals from CON FF Logic
    output wire CON_out,

datapath DUT(
    .clk(clk), .clr(clr), .RX_in(RX_in), .PC_in(PC_in), .IR_in(IR_in), .Y_in(Y_in), .Z_in(Z_in),
    .HI_in(HI_in), .LO_in(LO_in), .MAR_in(MAR_in), .MDR_in(MDR_in), .Read(Read), .OutPort_in(OutPort_in),
    .RX_out(RX_out), .PC_out(PC_out), .Zhigh_out(Zhigh_out), .Zlow_out(Zlow_out), .HI_out(HI_out),
    .LO_out(LO_out), .MDR_out(MDR_out), .InPort_out(InPort_out), .C_out(C_out), .Bus_Data(Bus_Data),
    .ALUHigh_Data(ALUHigh_Data), .ALULow_Data(ALULow_Data), .R0_Data(R0_Data), .R1_Data(R1_Data),
    .R2_Data(R2_Data), .R3_Data(R3_Data), .R4_Data(R4_Data), .R5_Data(R5_Data), .R6_Data(R6_Data),
    .R7_Data(R7_Data), .R8_Data(R8_Data), .R9_Data(R9_Data), .R10_Data(R10_Data), .R11_Data(R11_Data),
    .R12_Data(R12_Data), .R13_Data(R13_Data), .R14_Data(R14_Data), .R15_Data(R15_Data), .PC_Data(PC_Data),
    .IR_Data(IR_Data), .Y_Data(Y_Data), .Zhigh_Data(Zhigh_Data), .Zlow_Data(Zlow_Data), .HI_Data(HI_Data),
    .LO_Data(LO_Data), .MAR_Data(MAR_Data), .MDR_Data(MDR_Data), .InPort_Data(InPort_Data),
    .C_sign_extended_Data(C_sign_extended_Data), .Mdatain(Mdatain), .RAM_write(RAM_write),
    .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), .CON_out(CON_out),
);

initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end

parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
    Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000,
    T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101; T7 = 4'b1110
reg [3:0] Present_state = Default;

always @(posedge clk) // finite state machine; if clock rising-edge
begin
	case (Present_state)
		Default : #35 Present_state = Reg_load1a;
		Reg_load1a : #35 Present_state = Reg_load1b;
		Reg_load1b : #35 Present_state = Reg_load2a;
		Reg_load2a : #35 Present_state = Reg_load2b;
		Reg_load2b : #35 Present_state = Reg_load3a;
		Reg_load3a : #35 Present_state = Reg_load3b;
		Reg_load3b : #35 Present_state = T0;
		T0 : #35 Present_state = T1;
		T1 : #35 Present_state = T2;
		T2 : #35 Present_state = T3;
		T3 : #35 Present_state = T4;
		T4 : #35 Present_state = T5;
        T5 : #35 Present_state = T6;
        T6 : #35 Present_state = T7;
	endcase
end



always @(Present_state)
begin
	case(Present_state)
        Default: begin
                RX_in <= 16'h0000; PC_in <= 0; IR_in <= 0; Y_in <= 0; Z_in <= 0; HI_in <= 0; LO_in <= 0; 
                MAR_in <= 0; MDR_in <= 0; Read <= 0; OutPort_in <= 0; RX_out <= 16'h0000; PC_out <= 0;
                Zhigh_out <= 0; Zlow_out <= 0; HI_out <= 0; LO_out <= 0; MDR_out <= 0; InPort_out <= 0;
                C_out <= 0; RAM_write <= 0; Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
            end

//////////////////////////////////////////////////////
// UP TO HERE SHOULD BE GENERIC FOR ALL TESTBENCHES //
//////////////////////////////////////////////////////


        Reg_load1a: begin
                Mdatain_tb <= 32'hFA92;
                Read_tb = 0; MDR_in_tb = 0; 
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0; 
            end
        Reg_load1b: begin
                #10 MDR_out_tb <= 1; R4_in_tb <= 1;
                #15 MDR_out_tb <= 0; R4_in_tb <= 0;
            end
        Reg_load2a: begin
                Mdatain_tb <= 32'hFF;
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0;
            end
        Reg_load2b: begin
                #10 MDR_out_tb <= 1; R5_in_tb <= 1;
                #15 MDR_out_tb <= 0; R5_in_tb <= 0;
            end
        Reg_load3a: begin
                Mdatain_tb <= 32'h595;
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0;
            end
        Reg_load3b: begin
                #10 MDR_out_tb <= 1; R0_in_tb <= 1;
                #15 MDR_out_tb <= 0; R0_in_tb <= 0;
            end
        T0: begin
                #10 PC_out_tb <= 1; MAR_in_tb <= 1; Z_in_tb <= 1;
                #15 PC_out_tb <= 0; MAR_in_tb <= 0; Z_in_tb <= 0;
            end
        T1: begin
                #10 Zlow_out_tb <= 1; PC_in_tb <= 1; Read_tb <= 1; MDR_in_tb <= 1;
                Mdatain_tb <= 32'h18228000;
                #15 Zlow_out_tb <= 0; PC_in_tb <= 0; Read_tb <= 0; MDR_in_tb <= 0;
            end
        T2: begin
                #10 MDR_out_tb <= 1; IR_in_tb <= 1;
                #15 MDR_out_tb <= 0; IR_in_tb <= 0;
            end
        T3: begin
                #10 R4_out_tb <= 1; Y_in_tb <= 1;
                #15 R4_out_tb <= 0; Y_in_tb <= 0;
            end
        T4: begin
                #10 R5_out_tb <= 1; instruction_bits_tb <= IR_Data_tb[31:27]; Z_in_tb <= 1;
                #15 R5_out_tb <= 0; instruction_bits_tb <= 5'b0; Z_in_tb <= 0;
            end
        T5: begin
                #10 Zlow_out_tb <= 1; R0_in_tb <= 1;
                #15 Zlow_out_tb <= 0; R0_in_tb <= 0;
            end
    endcase
end
endmodule