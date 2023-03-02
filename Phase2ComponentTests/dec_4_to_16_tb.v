`timescale 1ns / 10ps
module dec_4_to_16_tb;
	reg [3:0] dec_input;
 	wire [15:0] dec_output;

	dec_4_to_16 dec_4_to_16_instance(.dec_input(dec_input), .dec_output(dec_output));

	initial
	begin
		dec_input = 4'd00; #10;
		dec_input = 4'd01; #10;
		dec_input = 4'd02; #10;
		dec_input = 4'd03; #10;
		dec_input = 4'd04; #10;
		dec_input = 4'd05; #10;
		dec_input = 4'd06; #10;
		dec_input = 4'd07; #10;
		dec_input = 4'd08; #10;
		dec_input = 4'd09; #10;
		dec_input = 4'd10; #10;
		dec_input = 4'd11; #10;
		dec_input = 4'd12; #10;
		dec_input = 4'd13; #10;
		dec_input = 4'd14; #10;
		dec_input = 4'd15; #10;
	end

endmodule