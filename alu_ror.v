module alu_ror (
	input wire [31:0] input_data,
	input wire [4:0] num_rotates, 
	output reg [31:0] output_data
);
	
	always@(*) 
	begin
		case(num_rotates)
			5'b00001 : output_data <= {input_data [0], input_data [31:1]};
			5'b00010 : output_data <= {input_data [1:0], input_data [31:2]};
			5'b00011 : output_data <= {input_data [2:0], input_data [31:3]};
			5'b00100 : output_data <= {input_data [3:0], input_data [31:4]};
			5'b00101 : output_data <= {input_data [4:0], input_data [31:5]};
			5'b00110 : output_data <= {input_data [5:0], input_data [31:6]};
			5'b00111 : output_data <= {input_data [6:0], input_data [31:7]};
			5'b01000 : output_data <= {input_data [7:0], input_data [31:8]};
			5'b01001 : output_data <= {input_data [8:0], input_data [31:9]};
			5'b01010 : output_data <= {input_data [9:0], input_data [31:10]};
			5'b01011 : output_data <= {input_data [10:0], input_data [31:11]};
			5'b01100 : output_data <= {input_data [11:0], input_data [31:12]};
			5'b01101 : output_data <= {input_data [12:0], input_data [31:13]};
			5'b01110 : output_data <= {input_data [13:0], input_data [31:14]};
			5'b01111 : output_data <= {input_data [14:0], input_data [31:15]};
			5'b10000 : output_data <= {input_data [15:0], input_data [31:16]};
			5'b10001 : output_data <= {input_data [16:0], input_data [31:17]};
			5'b10010 : output_data <= {input_data [17:0], input_data [31:18]};
			5'b10011 : output_data <= {input_data [18:0], input_data [31:19]};
			5'b10100 : output_data <= {input_data [19:0], input_data [31:20]};
			5'b10101 : output_data <= {input_data [20:0], input_data [31:21]};
			5'b10110 : output_data <= {input_data [21:0], input_data [31:22]};
			5'b10111 : output_data <= {input_data [22:0], input_data [31:23]};
			5'b11000 : output_data <= {input_data [23:0], input_data [31:24]};
			5'b11001 : output_data <= {input_data [24:0], input_data [31:25]};
			5'b11010 : output_data <= {input_data [25:0], input_data [31:26]};
			5'b11011 : output_data <= {input_data [26:0], input_data [31:27]};
			5'b11100 : output_data <= {input_data [27:0], input_data [31:28]};
			5'b11101 : output_data <= {input_data [28:0], input_data [31:29]};
			5'b11110 : output_data <= {input_data [29:0], input_data [31:30]};
			5'b11111 : output_data <= {input_data [30:0], input_data [31]};
			default : output_data <= input_data;
		endcase
	end   
endmodule 