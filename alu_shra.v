module alu_shra (
	input wire [31:0] input_data,
	input wire [31:0] num_shifts,
	output wire [31:0] output_data
);
	wire msb = input_data[31];
	wire [31:0] shifted <= input_data >> num_shifts;
	assign output_data [31:0] = 
	
	always@(input_data)
	begin
		variable i;
      for(i = 31; i > num_shifts; i = i - 1)
      begin
            output_data[i] = msb;
		end
   end

endmodule 