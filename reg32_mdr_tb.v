`timescale 1ns / 10ps
module reg32_mdr_tb;
	reg [31:0] BusMuxOut;
	reg [31:0] Mdatain;
	reg read;
	reg clear;
	reg clock;
	reg MDRin;
	wire [31:0] MDR_out;

	reg32_mdr reg32_mdr_instance(
		.BusMuxOut(BusMuxOut),
		.Mdatain(Mdatain),
		.read(read),
		.clear(clear),
		.clock(clock),
		.MDRin(MDRin),
		.MDR_out(MDR_out)
	);
	
	initial
		begin
			BusMuxOut <= 32'b1000101;
			Mdatain <= 32'b110100100;
			read <= 0;
			clear <= 0;
			clock <= 0;
			MDRin <= 0;
			
			// cycle 1 (0)
			clock <= 1;
			#10;
			clock <= 0;
			#10;
			// cycle 2 (1000101)
			read <= 0;
			MDRin <= 1;
			clock <= 1;
			#10;
			clock <= 0;
			#10;
			// cycle 3 (0)
			read <= 0;
			MDRin <= 0;
			clear <= 1;
			clock <= 1;
			#10;
			clear <= 0;
			clock <= 0;
			#10;
			// cycle 4 (0)
			read <= 1;
			MDRin <= 0;
			clock <= 1;
			#10;
			clock <= 0;
			#10;
			// cycle 5 (110100100)
			MDRin <= 1;
			clock <= 1;
			#10;
			clock <= 0;
			#10;
		end	
endmodule