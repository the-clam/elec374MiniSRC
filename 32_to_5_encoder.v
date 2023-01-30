module 32_to_5_encoder(
	input clk;
	input [31:0] EncoderInput,
	output [4:0] EncoderOut	
);

always@(clk)
	if(EncoderInput == 32'h00000001) EncoderOut [4:0] <= 5'b00000;
	if(EncoderInput == 32'h00000002) EncoderOut [4:0] <= 5'b00001; 
	if(EncoderInput == 32'h00000004) EncoderOut [4:0] <= 5'b00010;
	if(EncoderInput == 32'h00000008) EncoderOut [4:0] <= 5'b00011;
	if(EncoderInput == 32'h00000010) EncoderOut [4:0] <= 5'b00100;
	if(EncoderInput == 32'h00000020) EncoderOut [4:0] <= 5'b00101;
	if(EncoderInput == 32'h00000040) EncoderOut [4:0] <= 5'b00110;
	if(EncoderInput == 32'h00000080) EncoderOut [4:0] <= 5'b00111;
	if(EncoderInput == 32'h00000100) EncoderOut [4:0] <= 5'b01000;
	if(EncoderInput == 32'h00000200) EncoderOut [4:0] <= 5'b01001;
	if(EncoderInput == 32'h00000400) EncoderOut [4:0] <= 5'b01010;
	if(EncoderInput == 32'h00000800) EncoderOut [4:0] <= 5'b01011;
	if(EncoderInput == 32'h00001000) EncoderOut [4:0] <= 5'b01100;
	if(EncoderInput == 32'h00002000) EncoderOut [4:0] <= 5'b01101;
	if(EncoderInput == 32'h00004000) EncoderOut [4:0] <= 5'b01110;
	if(EncoderInput == 32'h00008000) EncoderOut [4:0] <= 5'b01111;
	if(EncoderInput == 32'h00010000) EncoderOut [4:0] <= 5'b10000;
	if(EncoderInput == 32'h00020000) EncoderOut [4:0] <= 5'b10001;
	if(EncoderInput == 32'h00040000) EncoderOut [4:0] <= 5'b10010;
	if(EncoderInput == 32'h00080000) EncoderOut [4:0] <= 5'b10011;
	if(EncoderInput == 32'h00100000) EncoderOut [4:0] <= 5'b10100;
	if(EncoderInput == 32'h00200000) EncoderOut [4:0] <= 5'b10101;
	if(EncoderInput == 32'h00400000) EncoderOut [4:0] <= 5'b10110;
	if(EncoderInput == 32'h00800000) EncoderOut [4:0] <= 5'b10111;
	if(EncoderInput == 32'h01000000) EncoderOut [4:0] <= 5'b11000;
	if(EncoderInput == 32'h02000000) EncoderOut [4:0] <= 5'b11001;
	if(EncoderInput == 32'h04000000) EncoderOut [4:0] <= 5'b11010;
	if(EncoderInput == 32'h08000000) EncoderOut [4:0] <= 5'b11011;
	if(EncoderInput == 32'h00000000) EncoderOut [4:0] <= 5'b11100;
	if(EncoderInput == 32'h00000000) EncoderOut [4:0] <= 5'b11101;
	if(EncoderInput == 32'h00000000) EncoderOut [4:0] <= 5'b11110;
	if(EncoderInput == 32'h00000000) EncoderOut [4:0] <= 5'b11111;
endmodule
