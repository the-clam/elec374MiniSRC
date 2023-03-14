module memory_ram(
	input wire clk, read, write,
	input wire [8:0] address_in,
	input wire [31:0] data_input,
	output reg [31:0] data_output
);
	reg [8:0] current_address; // Hold incoming MAR data.
	reg [31:0] ram_data [511:0]; // Actual RAM.
	initial $readmemh("empty_ram.mif", ram_data); // Preload RAM data with file.
	always@(address_in) current_address [8:0] <= address_in [8:0]; // MAR always updates RAM address_in.
	always@(posedge clk) // Synchronous operations.
	begin
		if(write) ram_data [current_address] [31:0] <= data_input [31:0]; // Write data if write signal.
		if(read) data_output [31:0] <= ram_data [current_address] [31:0]; // Output data if read signal.
		else data_output [31:0] <= 32'hXXXXXXXX; // If no read signal, unknown data from RAM.
	end
endmodule