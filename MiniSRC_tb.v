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

    // Input/Output Ports
    reg [31:0] InPort_Data_In = 32'b10001000;
    reg [31:0] Outport_Data_Out;

    // Seven Segment Displays
    wire [7:0] upper_seg_out;
    wire [7:0] lower_seg_out;
    
    // Present state (optional)
    wire [5:0] present_state;

    datapath MiniSRC(
        // System Inputs/Outputs
        .clk(clk), .reset(reset), .stop(stop), .run(run), .clr(clr),
        // Register Data Signals (Required)
        .PC_Data(PC_Data), .IR_Data(IR_Data), .MAR_Data(MAR_Data), .MDR_Data(MDR_Data), .R0_Data(R0_Data),
        .R1_Data(R1_Data), .R2_Data(R2_Data), .R3_Data(R3_Data), .R4_Data(R4_Data), .R5_Data(R5_Data),
        .R6_Data(R6_Data), .R7_Data(R7_Data), .R8_Data(R8_Data), .R9_Data(R9_Data), .R10_Data(R10_Data),
        .R11_Data(R11_Data), .R12_Data(R12_Data), .R13_Data(R13_Data), .R14_Data(R14_Data),
        .R15_Data(R15_Data), .HI_Data(HI_Data), .LO_Data(LO_Data),
        // Input/Output Ports
        .InPort_Data_In(InPort_Data_In), .Outport_Data_Out(Outport_Data_Out),
        // Present state (optional)
        .present_state(present_state)
    );

    // seven_seg_out (.display(lower_seg_out), .clk(clk), .data(Outport_Data_Out[3:0]));
    // seven_seg_out upper_seg(.display(upper_seg_out), .clk(clk), .data(Outport_Data_Out[3:0]));

    initial begin
        clk = 1;
        forever begin clk = ~clk; #10; end
    end
endmodule