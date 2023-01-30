module reg32(
	input clk, clr, en,
	input [31:0] D,
	output [31:0] Q
);

	initial Q = 0;
	always@(posedge clk)
	begin
		if(clk)
			Q[31:0]<= D[31:0];
		if(clr)
			Q[31:0]<= 32'b0;
	end
endmodule
