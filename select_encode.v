`timescale 1ns / 10ps
module select_encode(
	input wire Gra, Grb, Grc, Rin, Rout, BAout,
	input wire [31:0] IR_Data,
	output wire [31:0] C_sign_extended,
	output wire [15:0] RXin, RXout
);
	wire [3:0] Ra_sel, Rb_sel, Rc_sel; // and with IR bits for reg inputs
	wire [3:0] dec_input; 
	wire [15:0] dec_output; 
	
	dec_4_to_16 dec_4_to_16_instance(.dec_input(dec_input), .dec_output(dec_output));
	
	// Instruction bits & with Gra/b/c signal
	assign Ra_sel = IR_Data [26:23] & {4{Gra}};
	assign Rb_sel = IR_Data [22:19] & {4{Grb}};
	assign Rc_sel = IR_Data [18:15] & {4{Grc}};
	assign dec_input = Ra_sel | Rb_sel | Rc_sel;
		
	// OUTPUT LOGIC
	assign RXin = dec_output & {16{Rin}}; 
	assign RXout = dec_output & {{16{Rout}} | {16{BAout}}}; 
	assign C_sign_extended = {{13{IR_Data[18]}}, {IR_Data[18:0]}}; // Sign extend C [18:0] using MSB
endmodule