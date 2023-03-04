`timescale 1ns / 10ps
module dec_2_to_4(
    input wire [1:0] dec_input,
    output reg [3:0] dec_output
);
    always@(*)
    begin
        case(dec_input)
            2'b00 : dec_output = 4'b0001; 2'b01 : dec_output = 4'b0010;
            2'b10 : dec_output = 4'b0100; 2'b11 : dec_output = 4'b1000;
        endcase
    end
endmodule