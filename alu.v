`timescale 1 ns / 10 ps
module alu(
	input wire [4:0] instruction,
	input wire [31:0] A_in,
	input wire [31:0] B_in,
	output wire [31:0] Z_high,
	output wire [31:0] Z_low
);

   // Wires to carry data out from ALU modules.
   wire [31:0] add_out, and_out, neg_out, not_out, or_out, rol_out, ror_out, shl_out, shr_out,
   		shra_out, sub_out;
   wire [63:0] mul_out, div_out;
   wire add_cout, sub_cout;
   reg [63:0] C_result;

   // Initialize ALU modules.
   alu_add add_instance(.A(A_in), .B(B_in), .C_in(1'b0), .S(add_out), .C_out(add_cout));
   alu_and and_instance(.A(A_in), .B(B_in), .C(and_out));
   alu_div div_instance(.A(A_in), .B(B_in), .Q(div_out[31:0]), .R(div_out[63:32]));
   alu_mul mul_instance(.A(A_in), .B(B_in), .P(mul_out));
   alu_neg neg_instance(.data_input(B_in), .data_output(neg_out));
   alu_not not_instance(.data_input(B_in), .data_output(not_out));
   alu_or or_instance(.A(A_in), .B(B_in), .C(or_out));
   alu_rol rol_instance(.data_input(A_in), .num_rotates(B_in), .data_output(rol_out));
   alu_ror ror_instance(.data_input(A_in), .num_rotates(B_in), .data_output(ror_out));
   alu_shl shl_instance(.data_input(A_in), .num_shifts(B_in), .data_output(shl_out));
   alu_shr shr_instance(.data_input(A_in), .num_shifts(B_in), .data_output(shr_out));
   alu_shra shra_instance(.data_input(A_in), .num_shifts(B_in), .data_output(shra_out));
   alu_sub sub_instance(.A(A_in), .B(B_in), .C_in(1'b0), .S(sub_out), .C_out(sub_cout));
   
   // Instruction decoding
	always@(*)
   begin
		case(instruction)
			5'b00011 : begin // add
					C_result[31:0] <= add_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b00100 : begin // sub
					C_result[31:0] <= sub_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b00101 : begin // and
					C_result[31:0] <= and_out[31:0]; C_result[63:32] <= 32'd0;
            	end
			5'b00110 : begin // or
					C_result[31:0] <= or_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b00111 : begin // shr
					C_result[31:0] <= shr_out[31:0]; C_result[63:32] <= 32'd0;
            	end
			5'b01000 : begin // shra
					C_result[31:0] <= shra_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01001 : begin // shl
					C_result[31:0] <= shl_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01010 : begin // ror
					C_result[31:0] <= ror_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01011 : begin // rol 
					C_result[31:0] <= rol_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01100 : begin // addi 
					C_result[31:0] <= add_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01101 : begin // andi
					C_result[31:0] <= and_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01110 : begin // ori
					C_result[31:0] <= or_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b01111 : begin // mul
					C_result[63:0] <= mul_out[63:0]; 
				end
			5'b10000 : begin // div 
					C_result[63:0] <= div_out[63:0];
				end
			5'b10001 : begin // neg
					C_result[31:0] <= neg_out[31:0]; C_result[63:32] <= 32'd0;
				end
			5'b10010 : begin // not 
					C_result[31:0] <= not_out[31:0]; C_result[63:32] <= 32'd0;
				end
			default : begin
					C_result [63:0] <= 64'd0;
				end
		endcase
	end
	assign Z_high = C_result[63:32]; assign Z_low = C_result[31:0];
endmodule