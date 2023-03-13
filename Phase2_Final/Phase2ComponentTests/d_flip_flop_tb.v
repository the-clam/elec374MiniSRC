`timescale 1ns / 10ps
module d_flip_flop_tb;
    reg clk, clr, D;
    wire Q, notQ;

    d_flip_flop d_flip_flop_instance(.clk(clk), .clr(clr), .D(D), .Q(Q), .notQ(notQ));

    initial
    begin
        clk = 0; D = 1; clr = 0; #5; clk = 1; #5;
        clk = 0; D = 0; clr = 0; #5; clk = 1; #5;
		clk = 0; D = 1; clr = 0; #5; clk = 1; #5;
        clk = 0; D = 1; clr = 1; #5; clk = 1; #5;
    end
endmodule