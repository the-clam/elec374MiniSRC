`timescale 1ns / 10ps
module reg32 (
    input wire clr, clk, en,
    input wire [31:0] D,
    output reg [31:0] Q
);
	initial Q = 0;
	always@(posedge clk)
	begin
		if(en) Q[31:0] <= D[31:0];
		if(clr) Q[31:0] <= 32'b0;
	end
endmodule