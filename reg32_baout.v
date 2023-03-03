`timescale 1ns / 10ps
module reg32_baout(
    input wire clr, clk, en, BAout,
    input wire [31:0] D,
    output wire [31:0] Q
);
    wire [31:0] Reg_Data;
    reg32 R0_reg (.clr(clr), .clk(clk), .en(en), .D(D), .Q(Reg_Data));
    assign Q = {32{!BAout}} & Reg_Data;
endmodule