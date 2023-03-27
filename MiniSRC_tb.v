`timescale 1ns / 10ps
module MiniSRC_tb;
    // System Input/Outputs
    reg clk = 0;
    reg reset = 1;
    reg stop = 1;
    wire run;
    
	 // Input/Output Ports (Optional)
    reg [31:0] InPort_Data_In = 8'b10001000;
    wire [31:0] Outport_Data_Out;
	 
    // Seven Segment Displays
    wire [7:0] upper_seg_out;
    wire [7:0] lower_seg_out;

    datapath MiniSRC(
        // System Inputs/Outputs
        .clk(clk), .reset(reset), .stop(stop), .run(run),
		  // Input/Output Ports (Optional)
        .InPort_Data_In(InPort_Data_In), .Outport_Data_Out(Outport_Data_Out),
		// Seven Segment Displays
		.upper_seg_out(upper_seg_out),
		.lower_seg_out(lower_seg_out)
    );

    initial begin
        clk = 1;
        forever begin clk = ~clk; #10; end
    end
endmodule