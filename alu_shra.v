module alu_shra (
	input wire [31:0] data_input,
	input wire [31:0] num_shifts,
	output wire [31:0] data_output
);
	wire msb = data_input[31];
	wire [31:0] shifted <= data_input >> num_shifts;
	assign data_output [31:0] = 
	
	always@(data_input)
	begin
		variable i;
      for(i = 31; i > num_shifts; i = i - 1)
      begin
            data_output[i] = msb;
		end
   end

endmodule 