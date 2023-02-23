module alu_rol (
	input wire [31:0] data_input,
	input wire [4:0] num_rotates, 
	output reg [31:0] data_output
);

	always@(*) 
	begin
		case(num_rotates)
			5'b00001 : data_output <= {data_input [30:0], data_input [31]};
			5'b00010 : data_output <= {data_input [29:0], data_input [31:30]};
			5'b00011 : data_output <= {data_input [28:0], data_input [31:29]};
			5'b00100 : data_output <= {data_input [27:0], data_input [31:28]};
			5'b00101 : data_output <= {data_input [26:0], data_input [31:27]};
			5'b00110 : data_output <= {data_input [25:0], data_input [31:26]};
			5'b00111 : data_output <= {data_input [24:0], data_input [31:25]};
			5'b01000 : data_output <= {data_input [23:0], data_input [31:24]};
			5'b01001 : data_output <= {data_input [22:0], data_input [31:23]};
			5'b01010 : data_output <= {data_input [21:0], data_input [31:22]};
			5'b01011 : data_output <= {data_input [20:0], data_input [31:21]};
			5'b01100 : data_output <= {data_input [19:0], data_input [31:20]};
			5'b01101 : data_output <= {data_input [18:0], data_input [31:19]};
			5'b01110 : data_output <= {data_input [17:0], data_input [31:18]};
			5'b01111 : data_output <= {data_input [16:0], data_input [31:17]};
			5'b10000 : data_output <= {data_input [15:0], data_input [31:16]};
			5'b10001 : data_output <= {data_input [14:0], data_input [31:15]};
			5'b10010 : data_output <= {data_input [13:0], data_input [31:14]};
			5'b10011 : data_output <= {data_input [12:0], data_input [31:13]};
			5'b10100 : data_output <= {data_input [11:0], data_input [31:12]};
			5'b10101 : data_output <= {data_input [10:0], data_input [31:11]};
			5'b10110 : data_output <= {data_input [9:0], data_input [31:10]};
			5'b10111 : data_output <= {data_input [8:0], data_input [31:9]};
			5'b11000 : data_output <= {data_input [7:0], data_input [31:8]};
			5'b11001 : data_output <= {data_input [6:0], data_input [31:7]};
			5'b11010 : data_output <= {data_input [5:0], data_input [31:6]};
			5'b11011 : data_output <= {data_input [4:0], data_input [31:5]};
			5'b11100 : data_output <= {data_input [3:0], data_input [31:4]};
			5'b11101 : data_output <= {data_input [2:0], data_input [31:3]};
			5'b11110 : data_output <= {data_input [1:0], data_input [31:2]};
			5'b11111 : data_output <= {data_input [0], data_input [31:1]};
			default: data_output <= data_input;
		endcase
	end   
endmodule 