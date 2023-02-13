`timescale 1ns / 10ps
module alu_mul(
	input wire [31:0] A, // multiplicand
   input wire [31:0] B, // multiplier
	output wire [63:0] P // product
);

   integer i; // used to loop thru all 32 bits
   integer booth_mul; //


   always@(*)
      begin
         for(i = 0; i < 32; i = i + 1)
         begin
            
         end 
      end

endmodule
