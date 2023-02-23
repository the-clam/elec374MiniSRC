`timescale 1ns / 10ps
module alu_and (
	input wire [31:0] A,
	input wire [31:0] B,
	output reg [31:0] C
);
	
	integer i;
	
	always@(*)
	begin
		for(i = 0; i < 32; i = i + 1) begin
			C[i] <= A[i] & B[i];
		end
	end

endmodule