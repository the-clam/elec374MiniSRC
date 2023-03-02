`timescale 1ns / 10ps
module memory_ram_tb;
	reg clk, read, write;
	reg [8:0] address_in;
	reg [31:0] data_input;
	wire [31:0] data_output;

	memory_ram memory_ram_instance(
		.clk(clk), .read(read), .write(write), .address_in(address_in), 
		.data_input(data_input), .data_output(data_output)
	);

	initial 
	begin
		// Initial Conditions
		read <= 0; write <= 0; clk = 0; address_in <= 8'b0; data_input <= 31'b0; 
		// Write two Values
		address_in <= 8'd5;
		data_input <= 32'b1000101;
		write <= 1;
		#5;
		clk = ~clk;
		#5;
		clk = ~clk;
		write <= 0;
		#10;

		address_in <= 8'd10;
		data_input <= 32'd420;
		write <= 1;
		#5;
		clk = ~clk;
		#5;
		clk = ~clk;
		write <= 0;
		#10;

		// Read first value
		address_in <= 8'd5;
		read <= 1;
		#5;
		clk = ~clk;
		#5;
		clk = ~clk;
		read <= 0;
		#10;
	end
endmodule