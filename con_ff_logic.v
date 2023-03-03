`timescale 1ns / 10ps
module con_ff_logic(
	input wire CON_in, // assuming is a clock?
	input wire [31:0] IR_Data_In,
	input wire [31:0] Bus_Data_In,
	output wire CON_out
);
	wire bus_nor;
	reg and_1, and_2, and_3, and_4;
	assign bus_nor = !(|IR_Data_In);
	wire [3:0] dec_output;
	
	dec_2_to_4 dec_2_to_4_instance(.dec_input(IR_Data_In[20:19]), .dec_output(dec_output));

	always@(posedge CON_in)
	begin // changes when CON_in clock
		and_1 = dec_output[0] & bus_nor;
		and_2 = dec_output[1] & (!bus_nor);
		and_3 = dec_output[2] & (!(Bus_Data_In[31]));
		and_4 = dec_output[3] & Bus_Data_In[31];
	end
	assign CON_out = and_1 | and_2 | and_3 | and_4; // Persistent output
	
endmodule