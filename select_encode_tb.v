`timescale 1ns / 10ps
module select_encode_tb;
    reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg [31:0] IR_Data;
	wire [31:0] C_sign_extended;
	wire [15:0] RXin, RXout;
	
	wire [3:0] Ra_sel, Rb_sel, Rc_sel; // and with IR bits for reg inputs

    select_encode select_encode_instance(
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout),
        .IR_Data(IR_Data), .C_sign_extended(C_sign_extended),
        .RXin(RXin), .RXout(RXout),
        .Ra_sel(Ra_sel), .Rb_sel(Rb_sel), .Rc_sel(Rc_sel)
    );

    initial
    begin
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
	    IR_Data = 32'b0;
        
        IR_Data = 32'b10101_0110_1011_1001_100000011001011; #10;
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