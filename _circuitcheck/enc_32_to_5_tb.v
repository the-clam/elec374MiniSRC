`timescale 1 ns/10 ps
module enc_32_to_5_tb;
	reg [31:0] enc_input;
	wire [4:0] enc_output;
	
	enc_32_to_5 enc_32_to_5_instance(
		.enc_input(enc_input),
		.enc_output(enc_output)
	);
	
	initial
		begin
			enc_input <= 32'h00000001;
			#10;
			enc_input <= 32'h00000002;
			#10;
			enc_input <= 32'h00000004;
			#10;
			enc_input <= 32'h00000008;
			#10;
			enc_input <= 32'h00000010;
			#10;
			enc_input <= 32'h00000020;
			#10;
			enc_input <= 32'h00000040;
			#10;
			enc_input <= 32'h00000080;
			#10;
			enc_input <= 32'h00000100;
			#10;
			enc_input <= 32'h00000200;
			#10;
			enc_input <= 32'h00000400;
			#10;
			enc_input <= 32'h00000800;
			#10;
			enc_input <= 32'h00001000;
			#10;
			enc_input <= 32'h00002000;
			#10;
			enc_input <= 32'h00004000;
			#10;
			enc_input <= 32'h00008000;
			#10;
			enc_input <= 32'h00010000;
			#10;
			enc_input <= 32'h00020000;
			#10;
			enc_input <= 32'h00040000;
			#10;
			enc_input <= 32'h00080000;
			#10;
			enc_input <= 32'h00100000;
			#10;
			enc_input <= 32'h00200000;
			#10;
			enc_input <= 32'h00400000;
			#10;
			enc_input <= 32'h00800000;
			#10;
			enc_input <= 32'h01000000;
			#10;
			enc_input <= 32'h02000000;
			#10;
			enc_input <= 32'h04000000;
			#10;
			enc_input <= 32'h08000000;
			#10;
			enc_input <= 32'h10000000;
			#10;
			enc_input <= 32'h20000000;
			#10;
			enc_input <= 32'h40000000;
			#10;
			enc_input <= 32'h80000000;
			#10;	
		end	
endmodule