`timescale 1ns / 10ps
module cla_32_bits(
   input wire [31:0] A, 
   input wire [31:0] B, 
   input wire C_in, 
   output wire [31:0] S, 
   output wire C_out
);

	wire C_out1;

   cla_16_bits cla_16_bits_1(
      .A(A[15:0]), .B(B[15:0]), .C_in(C_in),
      .S(S[15:0]),
      .C_out(C_out1)
   );
   
   cla_16_bits cla_16_bits_2(
      .A(A[31:16]), .B(B[31:16]), .C_in(C_out1),
      .S(S[31:16]),
      .C_out(C_out)
   );

endmodule