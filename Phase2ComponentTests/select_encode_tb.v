`timescale 1ns / 10ps
module select_encode_tb;
    reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg [31:0] IR_Data;
	wire [31:0] C_sign_extended;
	wire [15:0] RXin, RXout;

    select_encode select_encode_instance(
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout),
        .IR_Data(IR_Data), .C_sign_extended(C_sign_extended),
        .RXin(RXin), .RXout(RXout)
    );

    initial
    begin
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
	    IR_Data = 32'b0;
        
        IR_Data = 32'b10101011010111001100000011001011; #10;
        Grb = 1;
        Rin = 1;
        #10;
        Grb = 0;
        Rin = 0;

        Gra = 1;
        Rout = 1;
        #10;
        Gra = 0;
        Rout = 0;
        
        BAout = 1;
        #10;
        BAout = 0;
    end

endmodule