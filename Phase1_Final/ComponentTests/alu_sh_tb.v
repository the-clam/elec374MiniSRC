`timescale 1 ns/10 ps
module alu_sh_tb;
    reg [31:0] sh_input;
    reg [31:0] num_shifts;
    wire [31:0] shl_output;
    wire [31:0] shr_output;
	 wire [31:0] shra_output;
    
    alu_shl alu_shl_instance(
        .data_input(sh_input),
        .num_shifts(num_shifts),
        .data_output(shl_output)
    );

    alu_shr alu_shr_instance(
        .data_input(sh_input),
        .num_shifts(num_shifts),
        .data_output(shr_output)
    );
	 
	 alu_shra alu_shra_instance(
        .data_input(sh_input),
        .num_shifts(num_shifts),
        .data_output(shra_output)
    );

    initial
		begin
        
        sh_input <= 32'h80000003;

      num_shifts <= 32'b00000;
		#10;
		num_shifts <= 32'b00001;
		#10;
		num_shifts <= 32'b00010;
		#10;
		num_shifts <= 32'b00011;
		#10;
		num_shifts <= 32'b00100;
		#10;
		num_shifts <= 32'b00101;
		#10;
		num_shifts <= 32'b00110;
		#10;
		num_shifts <= 32'b00111;
		#10;
		num_shifts <= 32'b01000;
		#10;
		num_shifts <= 32'b01001;
		#10;
		num_shifts <= 32'b01010;
		#10;
		num_shifts <= 32'b01011;
		#10;
		num_shifts <= 32'b01100;
		#10;
		num_shifts <= 32'b01101;
		#10;
		num_shifts <= 32'b01110;
		#10;
		num_shifts <= 32'b01111;
		#10;
		num_shifts <= 32'b10000;
		#10;
		num_shifts <= 32'b10001;
		#10;
		num_shifts <= 32'b10010;
		#10;
		num_shifts <= 32'b10011;
		#10;
		num_shifts <= 32'b10100;
		#10;
		num_shifts <= 32'b10101;
		#10;
		num_shifts <= 32'b10110;
		#10;
		num_shifts <= 32'b10111;
		#10;
		num_shifts <= 32'b11000;
		#10;
		num_shifts <= 32'b11001;
		#10;
		num_shifts <= 32'b11010;
		#10;
		num_shifts <= 32'b11011;
		#10;
		num_shifts <= 32'b11100;
		#10;
		num_shifts <= 32'b11101;
		#10;
		num_shifts <= 32'b11110;
		#10;
		num_shifts <= 32'b11111;
		#10;
        end

endmodule