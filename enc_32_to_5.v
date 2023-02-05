`timescale 1ns / 10ps
module enc_32_to_5(
    input wire [31:0] enc_input,
    output reg [4:0] enc_output
);
	always@(*)
	begin
		case(enc_input)
			32'h00000001 : enc_output <= 5'd0;
			32'h00000002 : enc_output <= 5'd1;
			32'h00000004 : enc_output <= 5'd2;
			32'h00000008 : enc_output <= 5'd3;
			32'h00000010 : enc_output <= 5'd4;
			32'h00000020 : enc_output <= 5'd5;
			32'h00000040 : enc_output <= 5'd6;
			32'h00000080 : enc_output <= 5'd7;
			32'h00000100 : enc_output <= 5'd8;
			32'h00000200 : enc_output <= 5'd9;
			32'h00000400 : enc_output <= 5'd10;
			32'h00000800 : enc_output <= 5'd11;
			32'h00001000 : enc_output <= 5'd12;
			32'h00002000 : enc_output <= 5'd13;
			32'h00004000 : enc_output <= 5'd14;
			32'h00008000 : enc_output <= 5'd15;
			32'h00010000 : enc_output <= 5'd16;
			32'h00020000 : enc_output <= 5'd17;
			32'h00040000 : enc_output <= 5'd18;
			32'h00080000 : enc_output <= 5'd19;
			32'h00100000 : enc_output <= 5'd20;
			32'h00200000 : enc_output <= 5'd21;
			32'h00400000 : enc_output <= 5'd22;
			32'h00800000 : enc_output <= 5'd23;
			32'h01000000 : enc_output <= 5'd24;
			32'h02000000 : enc_output <= 5'd25;
			32'h04000000 : enc_output <= 5'd26;
			32'h08000000 : enc_output <= 5'd27;
			32'h10000000 : enc_output <= 5'd28;
			32'h20000000 : enc_output <= 5'd29;
			32'h40000000 : enc_output <= 5'd30;
			32'h80000000 : enc_output <= 5'd31;
			default : enc_output <= 0;
		endcase
	end
endmodule
			

