`timescale 1 ns/10 ps
module alu_ro_tb;
	reg [31:0] ro_input;
   reg [4:0] num_rotates;
   wire [31:0] rol_output;
   wire [31:0] ror_output;
	
	alu_rol alu_rol_instance(
		.input_data(ro_input),
		.num_rotates(num_rotates),
		.output_data(rol_output)
	);
	
	alu_ror alu_ror_instance(
		.input_data(ro_input),
		.num_rotates(num_rotates),
		.output_data(ror_output)		
	);

	initial
		begin
        
        ro_input <= 32'b11;

      	num_rotates <= 32'b00000;
		#10;
		num_rotates <= 32'b00001;
		#10;
		num_rotates <= 32'b00010;
		#10;
		num_rotates <= 32'b00011;
		#10;
		num_rotates <= 32'b00100;
		#10;
		num_rotates <= 32'b00101;
		#10;
		num_rotates <= 32'b00110;
		#10;
		num_rotates <= 32'b00111;
		#10;
		num_rotates <= 32'b01000;
		#10;
		num_rotates <= 32'b01001;
		#10;
		num_rotates <= 32'b01010;
		#10;
		num_rotates <= 32'b01011;
		#10;
		num_rotates <= 32'b01100;
		#10;
		num_rotates <= 32'b01101;
		#10;
		num_rotates <= 32'b01110;
		#10;
		num_rotates <= 32'b01111;
		#10;
		num_rotates <= 32'b10000;
		#10;
		num_rotates <= 32'b10001;
		#10;
		num_rotates <= 32'b10010;
		#10;
		num_rotates <= 32'b10011;
		#10;
		num_rotates <= 32'b10100;
		#10;
		num_rotates <= 32'b10101;
		#10;
		num_rotates <= 32'b10110;
		#10;
		num_rotates <= 32'b10111;
		#10;
		num_rotates <= 32'b11000;
		#10;
		num_rotates <= 32'b11001;
		#10;
		num_rotates <= 32'b11010;
		#10;
		num_rotates <= 32'b11011;
		#10;
		num_rotates <= 32'b11100;
		#10;
		num_rotates <= 32'b11101;
		#10;
		num_rotates <= 32'b11110;
		#10;
		num_rotates <= 32'b11111;
		#10;
        end

endmodule