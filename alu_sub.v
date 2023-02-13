`timescale 1ns / 10ps
module alu_sub(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire C_in,
    output wire [31:0] S,
    output wire C_out 
);
	// do A - B = A + (-B) -> 2's complement on B
	wire [31:0] two_comp;
	alu_neg alu_neg_instance(.data_input(B), .data_output(two_comp));
	alu_add alu_add_instance(.A(A), .B(two_comp), .C_in(0), .S(S), .C_out(C_out));

endmodule