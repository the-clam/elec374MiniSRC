`timescale 1 ns/10 ps
module reg32_baout_tb;
	reg clock;
	reg clear;
	reg enable;
	reg BAout;
	reg [31:0] reg_in;
	wire [31:0] reg_out;
	
	reg32_baout testreg(.clk(clock), .clr(clear), .en(enable), .BAout(BAout), .D(reg_in), .Q(reg_out));
	
	initial
		begin
			clock <= 0;
			// clock cycle 1 - 0ns
				// should have reg_out output 0
				reg_in <= 32'h0001;
				enable <= 0;
				clear <= 0;
				BAout <= 1;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 2 - 50ns
				// should have reg_out output 0
				reg_in <= 32'h0001;
				enable <= 1;
				clear <= 0;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 3 - 100ns
				// should have reg_out output 0
				reg_in <= 32'h0001;
				enable <= 1;
				clear <= 1;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 4 - 150ns
				// should have reg_out output 0
				reg_in <= 32'h0010;
				enable <= 1;
				clear <= 0;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 5 - 200ns
				// should have reg_out output 10
				reg_in <= 32'h0100;
				enable <= 0;
				clear <= 0;
				BAout <= 0;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 6 - 250ns
				// should have reg_out output 100
				enable <= 1;
				clear <= 0;
			#10;
			clock <= 1;
			#10;
			clock <= 0;
			// clock cycle 7 - 200ns
				// should have reg_out output 0
				reg_in <= 32'h0100;
				enable <= 0;
				clear <= 1;
			#10;
			clock <= 1;
			#10;
			clock <= 0;				
		end	
endmodule

