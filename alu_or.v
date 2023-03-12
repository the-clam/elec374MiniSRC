module alu_or (
	input wire [31:0] A, B,
	output reg [31:0] C
);
	integer i;
	always@(*) for(i = 0; i < 32; i = i + 1) C[i] <= A[i] | B[i];
endmodule