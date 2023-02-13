`timescale 1ns / 10ps
module alu_add_tb;
	reg [31:0] A;
	reg [31:0] B;
	reg  C_in;
	wire [31:0] S;
	wire C_out;
	
	alu_add alu_add_instance(
		.A(A), .B(B), .C_in(C_in), .S(S), .C_out(C_out)
	);
	
	initial
		begin
			A <= 32'd10;
			B <= 32'd13;
			C_in <= 0;
			#25;
			A <= 32'd9999;
			B <= 32'd1;
			C_in <= 0;
			#25;			
		end
	
endmodule