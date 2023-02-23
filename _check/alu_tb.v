`timescale 1 ns / 10 ps
module alu_tb;
   reg [4:0] instruction;
   reg [31:0] B_in;
   reg [31:0] Y_in;
   wire [63:0] C_result;
	wire [31:0] Z_hi;
	wire [31:0] Z_lo;

   alu alu_instance(
		.instruction(instruction),
		.B_in(B_in),
		.Y_in(Y_in),
		.C_result(C_result),
		.Z_hi(Z_hi),
		.Z_lo(Z_lo)
   );

   initial
        begin
            
            Y_in = 32'd240;
            B_in = 32'd3;
            #10;
            instruction = 5'b00011; // add 241 + 3
            #10;
            instruction = 5'b00100; // sub 241 - 3
            #10; 
            instruction = 5'b00101; // and
            #10; 
            instruction = 5'b00110; // or
            #10; 
            instruction = 5'b00111; // shr
            #10; 
            instruction = 5'b01000; // shra
            #10; 
            instruction = 5'b01001; // shl
            #10; 
            instruction = 5'b01010; // ror
            #10; 
            instruction = 5'b01011; // rol
            #10; 
            instruction = 5'b01111; // mul
            #10; 
            instruction = 5'b10000; // div
            #10; 
            instruction = 5'b10001; // neg
            #10; 
            instruction = 5'b10010; // not            
        end
endmodule