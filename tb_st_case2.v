`timescale 1ns / 10ps
module tb_st_case2;
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

parameter 
Default = 5'b00000, R4Load = 5'b00001, T0 = 5'b00010, T1 = 5'b00011, T2 = 5'b00100, T3 = 5'b00101,
    T4 = 5'b00110, T5 = 5'b00111, T6 = 5'b01000, Pause = 5'b01001, Check0 = 5'b01010, Check1 = 5'b01011,
    Check2 = 5'b01100, Check3 = 5'b01101, Check4  = 5'b01110, Check5 = 5'b01111, Check6 = 5'b10000,
    Check7 = 5'b10001;
reg [4:0] Present_state = Default;

always@(posedge clk) 
begin
	case (Present_state)
		Default : #40 Present_state = R4Load;
        R4Load : #30 Present_state = T0;
		T0 : #30 Present_state = T1;
		T1 : #30 Present_state = T2;
		T2 : #30 Present_state = T3;
		T3 : #30 Present_state = T4;
		T4 : #30 Present_state = T5;
        T5 : #30 Present_state = T6;
        T6 : begin #30 Present_state = 5'bXXXXX; #40 Present_state = Check0; end
        Check0 : #30 Present_state = Check1;
        Check1 : #30 Present_state = Check2;
        Check2 : #30 Present_state = Check3;
        Check3 : #30 Present_state = Check4;
        Check4 : #30 Present_state = Check5;
        Check5 : #30 Present_state = Check6;
        Check6 : #30 Present_state = Check7;
        Check7 : #30 Present_state = 5'bXXXXX;
	endcase
end

always@(Present_state)
begin
	case(Present_state)
        Default: begin
            PC_in <= 0; IR_in <= 0; Y_in <= 0; Z_in <= 0; HI_in <= 0; LO_in <= 0;  MAR_in <= 0; 
            MDR_in <= 0; OutPort_in <= 0; PC_out <= 0; Zhigh_out <= 0; Zlow_out <= 0; HI_out <= 0; 
            LO_out <= 0; MDR_out <= 0; InPort_out <= 0; C_out <= 0; Read <= 0; Write <= 0; Gra <= 0;
            Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0; alu_instruction_bits <= 0;
        end
        R4Load: begin // Load $67 into R4
            #0; InPort_Data_In <= 32'h67; InPort_out <= 1; RX_in_man <= 16'b0000000000010000;
            #40; InPort_Data_In <= 32'hX; InPort_out <= 0; RX_in_man <= 16'b0;
        end
        T0: begin // T0-T2: Instruction Fetch from 0x0, Increment PC
            #0; PC_out <= 1; MAR_in <= 1; IncPC <= 1; Z_in <= 1;
            #40; PC_out <= 0; MAR_in <= 0; IncPC <= 0; Z_in <= 0;
        end
        T1: begin // Instruction is st $90(R4), R4 or 12200090
            #0; Zlow_out <= 1; PC_in <= 1; Read <= 1; MDR_in <= 1;
            #40; Zlow_out <= 0; PC_in <= 0; Read <= 0; MDR_in <= 0;
        end
        T2: begin
            #0; MDR_out <= 1; IR_in <= 1;
            #40; MDR_out <= 0; IR_in <= 0; 
        end
        T3: begin // T3-T4: Calculate effective address (Rb + Const)
            #0; Grb <= 1; BAout <= 1; Y_in <= 1;
            #40; Grb <= 0; BAout <= 0; Y_in <= 0;
        end
        T4: begin
            #0; C_out <= 1; alu_instruction_bits <= 5'b00011; Z_in <= 1;
            #40; C_out <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        T5: begin // Provide effective address as memory address (0xF7)
            #0; Zlow_out <= 1; MAR_in <= 1;
            #40; Zlow_out <= 0; MAR_in <= 0;
        end
        T6: begin // Write value 0x67 to memory addr 0xF7.
            #0; Gra <= 1; Rout <= 1; MDR_in <= 1; Write <= 1;
            #40; Gra <= 0; Rout <= 0; MDR_in <= 0; Write <= 0;
        end
        
        ///////////////////////////////////////////////////
        // LOAD THE STORED NUMBER TO R0 FOR VERIFICATION //
        ///////////////////////////////////////////////////

        Check0: begin // T0-T2: Instruction Fetch from 0x1, Increment PC
            #0; PC_out <= 1; MAR_in <= 1; IncPC <= 1; Z_in <= 1;
            #40; PC_out <= 0; MAR_in <= 0; IncPC <= 0; Z_in <= 0;
        end
        Check1: begin // Instruction is ld R0, $F7 or 000000F7
            #0; Zlow_out <= 1; PC_in <= 1; Read <= 1; MDR_in <= 1;
            #40; Zlow_out <= 0; PC_in <= 0; Read <= 0; MDR_in <= 0;
        end
        Check2: begin
            #0; MDR_out <= 1; IR_in <= 1;
            #40; MDR_out <= 0; IR_in <= 0;  
        end
        Check3: begin // Check3-Check4: Calculate effective address (0xF7)
            #0; Grb <= 1; BAout <= 1; Y_in <= 1;
            #40; Grb <= 0; BAout <= 0; Y_in <= 0;
        end
        Check4: begin
            #0; C_out <= 1; alu_instruction_bits <= 5'b00011; Z_in <= 1;
            #40; C_out <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        Check5: begin // Provide effective address as 0xF7.
            #0; Zlow_out <= 1; MAR_in <= 1;
            #40; Zlow_out <= 0; MAR_in <= 0;
        end
        Check6: begin // Read value from memory (should be 0x67).
            #0; Read <= 1; MDR_in <= 1;
            #40; Read <= 0; MDR_in <= 0;
        end
        Check7: begin // Store value into R0 (0x67).
            #0; MDR_out <= 1; Gra <= 1; Rin <= 1;
            #40; MDR_out <= 0; Gra <= 0; Rin <= 0;
        end
    endcase
end
endmodule