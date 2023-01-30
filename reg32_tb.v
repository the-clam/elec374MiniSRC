`timescale 1ns / 10ps
module reg32_tb;
	
	reg clk, clr, en;
	reg [31:0] reg_in;
	wire [31:0] reg_out;
	
	reg32 reg32_instance(clk, clr, en, reg_in, reg_out);
	
	initial
		begin
			clk <= 1;
			clr <= 0;
			en <= 1;
			
			reg_in <= 32'd8;

		end	
endmodule