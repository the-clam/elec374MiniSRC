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
			A <= 32'h1F9;
			B <= 32'hF0;
			#10;
			A <= 32'h8B;
			B <= 32'hFFFFFF74;
			#10;
			A <= 32'hFFFFFB26;
			B <= 32'h8C;
			#10;
			A <= 32'hFFFFFF10;
			B <= 32'hFFFFFF7B;
			#10;
			
			A <= 32'h7B4DA;
			B <= 32'h5DEC;
			#10;
			A <= 32'h3AA4C;
			B <= 32'hFFFFC884;
			#10;
			A <= 32'hFFFF489E;
			B <= 32'h1483D;
			#10;
			A <= 32'hFFED13C4;
			B <= 32'hFFFFD0BA;
			#10;
		end
endmodule