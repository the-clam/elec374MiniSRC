`timescale 1ns / 10ps
module alu_rol (
	input wire [31:0] data_input, num_rotates, 
	output reg [31:0] data_output
);
	integer rotates;
	always@(*) 
	begin
		rotates = num_rotates % 32;
		case(rotates)
			32'b00001 : data_output <= {data_input [30:0], data_input [31]};
			32'b00010 : data_output <= {data_input [29:0], data_input [31:30]};
			32'b00011 : data_output <= {data_input [28:0], data_input [31:29]};
			32'b00100 : data_output <= {data_input [27:0], data_input [31:28]};
			32'b00101 : data_output <= {data_input [26:0], data_input [31:27]};
			32'b00110 : data_output <= {data_input [25:0], data_input [31:26]};
			32'b00111 : data_output <= {data_input [24:0], data_input [31:25]};
			32'b01000 : data_output <= {data_input [23:0], data_input [31:24]};
			32'b01001 : data_output <= {data_input [22:0], data_input [31:23]};
			32'b01010 : data_output <= {data_input [21:0], data_input [31:22]};
			32'b01011 : data_output <= {data_input [20:0], data_input [31:21]};
			32'b01100 : data_output <= {data_input [19:0], data_input [31:20]};
			32'b01101 : data_output <= {data_input [18:0], data_input [31:19]};
			32'b01110 : data_output <= {data_input [17:0], data_input [31:18]};
			32'b01111 : data_output <= {data_input [16:0], data_input [31:17]};
			32'b10000 : data_output <= {data_input [15:0], data_input [31:16]};
			32'b10001 : data_output <= {data_input [14:0], data_input [31:15]};
			32'b10010 : data_output <= {data_input [13:0], data_input [31:14]};
			32'b10011 : data_output <= {data_input [12:0], data_input [31:13]};
			32'b10100 : data_output <= {data_input [11:0], data_input [31:12]};
			32'b10101 : data_output <= {data_input [10:0], data_input [31:11]};
			32'b10110 : data_output <= {data_input [9:0], data_input [31:10]};
			32'b10111 : data_output <= {data_input [8:0], data_input [31:9]};
			32'b11000 : data_output <= {data_input [7:0], data_input [31:8]};
			32'b11001 : data_output <= {data_input [6:0], data_input [31:7]};
			32'b11010 : data_output <= {data_input [5:0], data_input [31:6]};
			32'b11011 : data_output <= {data_input [4:0], data_input [31:5]};
			32'b11100 : data_output <= {data_input [3:0], data_input [31:4]};
			32'b11101 : data_output <= {data_input [2:0], data_input [31:3]};
			32'b11110 : data_output <= {data_input [1:0], data_input [31:2]};
			32'b11111 : data_output <= {data_input [0], data_input [31:1]};
			default : data_output <= data_input;
		endcase
	end   
endmodule 