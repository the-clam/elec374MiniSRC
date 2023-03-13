`timescale 1ns / 10 ps
module con_ff_logic_tb;
    reg clk, clr;
	reg [31:0] IR_Data_In;
	reg [31:0] Bus_Data_In;
	wire CON_out;
    
    con_ff_logic con_ff_logic_instance( 
        .CON_in(clk), .CON_out(CON_out), .clr(clr), .IR_Data_In(IR_Data_In), .Bus_Data_In(Bus_Data_In)
    );

    initial
    begin
        IR_Data_In = 32'b00000000000_00_0000000000000000000; Bus_Data_In = 32'h00000000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_00_0000000000000000000; Bus_Data_In = 32'h0000FFFF; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_00_0000000000000000000; Bus_Data_In = 32'hFFFF0000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_01_0000000000000000000; Bus_Data_In = 32'h00000000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_01_0000000000000000000; Bus_Data_In = 32'h0000FFFF; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_01_0000000000000000000; Bus_Data_In = 32'hFFFF0000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_10_0000000000000000000; Bus_Data_In = 32'h00000000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_10_0000000000000000000; Bus_Data_In = 32'h0000FFFF; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_10_0000000000000000000; Bus_Data_In = 32'hFFFF0000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_11_0000000000000000000; Bus_Data_In = 32'h00000000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_11_0000000000000000000; Bus_Data_In = 32'h0000FFFF; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
        IR_Data_In = 32'b00000000000_11_0000000000000000000; Bus_Data_In = 32'hFFFF0000; #10; clk = 1; #10; clk = 0;
        clr = 1; #10; clk = 1; #10; clk = 0; clr = 0; #10;
    end
endmodule

    
