`timescale 1ns / 10ps
module MiniSRC_tb;
    // System Input/Outputs
    reg clk = 0;
    reg reset = 0;
    reg stop = 0;
    wire run, clr;
    // Required Register Data Signals
    wire [31:0] PC_Data, IR_Data, MAR_Data, MDR_Data, R0_Data, R1_Data, R2_Data, R3_Data, R4_Data,
        R5_Data, R6_Data, R7_Data, R8_Data, R9_Data, R10_Data, R11_Data, R12_Data, R13_Data, R14_Data,
        R15_Data, HI_Data, LO_Data;
    // Input/Output Ports (Optional)
    reg [31:0] InPort_Data_In = 8'b10001000;
    wire [31:0] Outport_Data_Out;

	 // Present State
    wire [5:0] present_state;
	 
    // Seven Segment Displays
    wire [7:0] upper_seg_out;
    wire [7:0] lower_seg_out;

    // // Other Data Signals (optional, uncomment to show)
    // wire [31:0] Bus_Data, ALUHigh_Data, ALULow_Data, Y_Data, Zhigh_Data, Zlow_Data, InPort_Data,
    //     C_sign_extended_Data, Mdatain;
    // // Register Input Signals (optional)
    // wire [15:0] RX_in;
    // wire PC_in, IR_in, Y_in, Z_in, HI_in, LO_in, MAR_in, MDR_in, OutPort_in, IncPC;
    // // Register Output Signals (optional)
    // wire [15:0] RX_out;
    // wire PC_out, Zhigh_out, Zlow_out, HI_out, LO_out, MDR_out, InPort_out, C_out;
    // // Signals to RAM/MDR (optional)
    // wire Read, Write;
    // // Select and Encode Logic Signals (optional)
    // wire Gra, Grb, Grc, Rin, Rout, BAout;
    // // Signals for CON FF Logic (optional)
    // wire CON_out, CON_in;
    // // Instruction bits for ALU (optional)
    // wire [4:0] alu_instruction_bits;
    // // Manual Input Enable for Registers (optional)
    // wire [15:0] RX_in_man;
    
    datapath MiniSRC(
        // System Inputs/Outputs
        .clk(clk), .reset(reset), .stop(stop), .run(run), .clr(clr),
        
		  // Register Data Signals (Required)
        .PC_Data(PC_Data), .IR_Data(IR_Data), .MAR_Data(MAR_Data), .MDR_Data(MDR_Data), .R0_Data(R0_Data),
        .R1_Data(R1_Data), .R2_Data(R2_Data), .R3_Data(R3_Data), .R4_Data(R4_Data), .R5_Data(R5_Data),
        .R6_Data(R6_Data), .R7_Data(R7_Data), .R8_Data(R8_Data), .R9_Data(R9_Data), .R10_Data(R10_Data),
        .R11_Data(R11_Data), .R12_Data(R12_Data), .R13_Data(R13_Data), .R14_Data(R14_Data),
        .R15_Data(R15_Data), .HI_Data(HI_Data), .LO_Data(LO_Data),
        
		  // Input/Output Ports (Optional)
        .InPort_Data_In(InPort_Data_In), .Outport_Data_Out(Outport_Data_Out),
		  
		  // Present State
        .present_state(present_state),
		  
		// Seven Segment Displays
		.upper_seg_out(upper_seg_out),
		.lower_seg_out(lower_seg_out)

        // // Other Data Signals (optional, uncomment to show)
        // .Bus_Data(Bus_Data), .ALUHigh_Data(ALUHigh_Data), .ALULow_Data(ALULow_Data),  .Y_Data(Y_Data), 
        // .Zhigh_Data(Zhigh_Data), .Zlow_Data(Zlow_Data), .InPort_Data(InPort_Data), 
        // .C_sign_extended_Data(C_sign_extended_Data), .Mdatain(Mdatain),
        // // Register Inputs (optional)
        // .RX_in(RX_in), .PC_in(PC_in), .IR_in(IR_in), .Y_in(Y_in), .Z_in(Z_in), .HI_in(HI_in), 
        // .LO_in(LO_in), .MAR_in(MAR_in), .MDR_in(MDR_in), .OutPort_in(OutPort_in), .IncPC(IncPC),
        // // Register Outputs (optional)
        // .RX_out(RX_out), .PC_out(PC_out), .Zhigh_out(Zhigh_out), .Zlow_out(Zlow_out), .HI_out(HI_out),
        // .LO_out(LO_out), .MDR_out(MDR_out), .InPort_out(InPort_out), .C_out(C_out),
        // // Signals to RAM/MDR (optional)
        // .Read(Read), .Write(Write),
        // // Select and Encode Logic Signals (optional)
        // .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout),
        // // Signals for CON FF Logic (optional)
        // .CON_out(CON_out), .CON_in(CON_in),
        // // Instruction bits for ALU (optional)
        // .alu_instruction_bits(alu_instruction_bits),
        // // Manual Input Enable for Registers (optional)
        // .RX_in_man(RX_in_man),
    );

    initial begin
        clk = 1;
        forever begin clk = ~clk; #10; end
    end
endmodule