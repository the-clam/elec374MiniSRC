`timescale 1ns / 10ps
module alu_div_tb;
	reg [31:0] A;
	reg [31:0] B;
	wire [31:0] Q;
	wire [31:0] R;
	
	alu_div alu_div_instance(
		.A(A), .B(B), .Q(Q), .R(R)
	);
	
	initial
		begin
			A <= 32'hE;
			B <= 32'h5;
			#10;
			A <= 32'h28;
			B <= 32'hA;
			#10;
			A <= 32'h4D2;
			B <= 32'hFFFFFF84;
			#10;
			A <= 32'hFC;
			B <= 32'hFFFFFFFC;
			#10;
			A <= 32'hFFFFFFF2;
			B <= 32'h5;
			#10;
			A <= 32'hFFFFFFD8;
			B <= 32'hA;
			#10;
			A <= 32'hFFFFFB2E;
			B <= 32'hFFFFFF84;
			#10;
			A <= 32'hFFFFFF04;
			B <= 32'hFFFFFFFC;
			#10;
			A <= 32'h498DA3A9;
			B <= 32'hF0;
			#10;
			A <= 32'h495F6268;
			B <= 32'h14;
			#10;
			A <= 32'hCB127124;
			B <= 32'hFFFFFF38;
			#10;
			A <= 32'h89727FC0;
			B <= 32'hFFFFFFD8;
			#10;
			A <= 32'hF11BE834;
			B <= 32'hCAD;
			#10;
			A <= 32'hE246E2B8;
			B <= 32'h28;
			#10;
			A <= 32'hC29F8168;
			B <= 32'hECDF8033;
			#10;
			A <= 32'hF2269F49;
			B <= 32'hFFFFFEDB;
		
			
			
						
		end
	
endmodule