module reg32(
	input wire clk, clr, en,
	input wire [31:0] D,
	output reg [31:0] Q
);

	initial Q = 0;
	always@(posedge clk)
	begin
		if(en)
		begin
			Q[31:0]<= D[31:0];
		end
		if(clr)
		begin
			Q[31:0]<= 32'b0;
		end
	end
endmodule
