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
			A <= 32'hFFFFFFFE;
			B <= 32'hFFFFFFEC;
			#10;
			A <= 32'hF0;
			B <= 32'hFFFFFFDF;
			#10;
			A <= 32'hFFFFFE5C;
			B <= 32'h14;
			#10;
			A <= 32'h100000;
			B <= 32'h200;
			#10;
			
			
		end
	
endmodule