`timescale 1ns / 10ps
module alu_mul_tb;
	reg [31:0] A;
	reg [31:0] B;
	wire [31:0] P;
	
	alu_mul alu_mul_instance(
		.A(A), .B(B), .P(P)
	);
	
	initial
		begin
			A <= 32'd10;
			B <= 32'd13;
			#10;
			A <= 32'd9999;
			B <= 32'd1;
			#10;
			A <= 32'hFFFFFFF6;
			B <= 32'h10;
			#10;
			A <= 32'hFFFFFFF6;
			B <= 32'hFFFFFFF6;
			#10;
			
			
		end
	
endmodule