`timescale 1ns / 10ps
module alu_or_tb;
    reg [31:0] A_in;
    reg [31:0] B_in;
    wire [31:0] C_out;

    alu_or alu_or_instance(.A(A_in), .B(B_in), .C(C_out));

    initial
        begin
            // @0 ns = FFFFFFFF & 00000000 = FFFFFFFF
            A_in <= 32'hFFFFFFFF;
            B_in <= 32'h00000000;
            #25;
            // @25ns = F0F0F0F0 & 00000000 = F0F0F0F0
            A_in <= 32'h00000000;
            B_in <= 32'hF0F0F0F0;
            #25;
            // @50ns = FFFF0000 & 0000FFFF = FFFFFFFF
            A_in <= 32'hFFFF0000;
            B_in <= 32'h0000FFFF;
            #25;
            // @75ns = FFFF0000 & 0F0F0000 = FFFF0000
            A_in <= 32'hFFFF0000;
            B_in <= 32'h0F0F0000;
            #25;
				// @100ns = FFFFFFFF & FFFFFFFF = FFFFFFFF
            A_in <= 32'hFFFFFFFF;
            B_in <= 32'hFFFFFFFF;
            #25;
            // @125ns = F0F00000 & 0FFF000F = FFFF000F
            A_in <= 32'hF0F00000;
            B_in <= 32'h0FFF000F;
            #25;
        end
endmodule