`timescale 1ns / 10ps
module cla_16_bits(
	input wire [15:0] A,
   input wire [15:0] B, 
   input wire C_in, 
   output wire [15:0] S, 
   output wire C_out
);

	wire C_out1;
   wire C_out2;
   wire C_out3;
	
	cla_4_bits cla_4_bits_1(.A(A[3:0]), .B(B[3:0]), .C_in(C_in), .S(S[3:0]), .C_out(C_out1));
   cla_4_bits cla_4_bits_2(.A(A[7:4]), .B(B[7:4]), .C_in(C_out1), .S(S[7:4]), .C_out(C_out2));		
   cla_4_bits cla_4_bits_3(.A(A[11:8]), .B(B[11:8]), .C_in(C_out2), .S(S[11:8]), .C_out(C_out3));
   cla_4_bits cla_4_bits_4(.A(A[15:12]), .B(B[15:12]), .C_in(C_out3), .S(S[15:12]), .C_out(C_out));

endmodule