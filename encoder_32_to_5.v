module encoder_32_to_5(
	input wire [31:0] EncoderInput,
	output reg [4:0] EncoderOutput	
);

always@(*)
		  if(EncoderInput == 32'h00000001) EncoderOutput [4:0] <= 5'b00000;
	else if(EncoderInput == 32'h00000002) EncoderOutput [4:0] <= 5'b00001; 
	else if(EncoderInput == 32'h00000004) EncoderOutput [4:0] <= 5'b00010;
	else if(EncoderInput == 32'h00000008) EncoderOutput [4:0] <= 5'b00011;
	else if(EncoderInput == 32'h00000010) EncoderOutput [4:0] <= 5'b00100;
	else if(EncoderInput == 32'h00000020) EncoderOutput [4:0] <= 5'b00101;
	else if(EncoderInput == 32'h00000040) EncoderOutput [4:0] <= 5'b00110;
	else if(EncoderInput == 32'h00000080) EncoderOutput [4:0] <= 5'b00111;
	else if(EncoderInput == 32'h00000100) EncoderOutput [4:0] <= 5'b01000;
	else if(EncoderInput == 32'h00000200) EncoderOutput [4:0] <= 5'b01001;
	else if(EncoderInput == 32'h00000400) EncoderOutput [4:0] <= 5'b01010;
	else if(EncoderInput == 32'h00000800) EncoderOutput [4:0] <= 5'b01011;
	else if(EncoderInput == 32'h00001000) EncoderOutput [4:0] <= 5'b01100;
	else if(EncoderInput == 32'h00002000) EncoderOutput [4:0] <= 5'b01101;
	else if(EncoderInput == 32'h00004000) EncoderOutput [4:0] <= 5'b01110;
	else if(EncoderInput == 32'h00008000) EncoderOutput [4:0] <= 5'b01111;
	else if(EncoderInput == 32'h00010000) EncoderOutput [4:0] <= 5'b10000;
	else if(EncoderInput == 32'h00020000) EncoderOutput [4:0] <= 5'b10001;
	else if(EncoderInput == 32'h00040000) EncoderOutput [4:0] <= 5'b10010;
	else if(EncoderInput == 32'h00080000) EncoderOutput [4:0] <= 5'b10011;
	else if(EncoderInput == 32'h00100000) EncoderOutput [4:0] <= 5'b10100;
	else if(EncoderInput == 32'h00200000) EncoderOutput [4:0] <= 5'b10101;
	else if(EncoderInput == 32'h00400000) EncoderOutput [4:0] <= 5'b10110;
	else if(EncoderInput == 32'h00800000) EncoderOutput [4:0] <= 5'b10111;
	else if(EncoderInput == 32'h01000000) EncoderOutput [4:0] <= 5'b11000;
	else if(EncoderInput == 32'h02000000) EncoderOutput [4:0] <= 5'b11001;
	else if(EncoderInput == 32'h04000000) EncoderOutput [4:0] <= 5'b11010;
	else if(EncoderInput == 32'h08000000) EncoderOutput [4:0] <= 5'b11011;
	else if(EncoderInput == 32'h10000000) EncoderOutput [4:0] <= 5'b11100;
	else if(EncoderInput == 32'h20000000) EncoderOutput [4:0] <= 5'b11101;
	else if(EncoderInput == 32'h40000000) EncoderOutput [4:0] <= 5'b11110;
	else if(EncoderInput == 32'h80000000) EncoderOutput [4:0] <= 5'b11111;
endmodule
