module control_unit(
    // Control Unit Inputs
    input wire clk, reset, stop, CON_FF, interrupts,
    input wire [31:0] IR_Data,
    // Control Unit Outputs
    output reg run, clr,
    // Bus Reg Out Controls
    output reg Rout, PC_out, MDR_out, Zhigh_out, Zlow_out, HI_out, LO_out, InPort_out, C_out,
    // Bus Reg In Controls
    output reg Rin, HI_in, LO_in, PC_in, IR_in, Y_in, Z_in, MAR_in, MDR_in, OutPort_in,
    // ALU Controls
    output reg [4:0] alu_instruction_bits,
    output reg IncPC,
    // Memory Controls
    output reg Read, Write,
    // Select and Encode
    output reg Gra, Grb, Grc, BAout,
    // ConFF Enable
    output reg CON_in
);

// Declare states - // est need 64 @ max? so use 6 bit present state
parameter
    reset_state : 6'b000000,
    state01 : 6'b000001,
    state02 : 6'b000010,
    state03 : 6'b000011,
    state04 : 6'b000100,
    state05 : 6'b000101,
    state06 : 6'b000110,
    state07 : 6'b000111,
    state08 : 6'b001000,
    state09 : 6'b001001,
    state10 : 6'b001010,
    state11 : 6'b001011,
    state12 : 6'b001100,
    state13 : 6'b001101,
    state14 : 6'b001110,
    state15 : 6'b001111,
    state16 : 6'b010000,
    state17 : 6'b010001,
    state18 : 6'b010010,
    state19 : 6'b010011,
    state20 : 6'b010100,
    state21 : 6'b010101,
    state22 : 6'b010110,
    state23 : 6'b010111,
    state24 : 6'b011000,
    state25 : 6'b011001,
    state26 : 6'b011010,
    state27 : 6'b011011,
    state28 : 6'b011100,
    state29 : 6'b011101,
    state30 : 6'b011110,
    state31 : 6'b011111,
    state32 : 6'b100000,
    state33 : 6'b100001,
    state34 : 6'b100010,
    state35 : 6'b100011,
    state36 : 6'b100100,
    state37 : 6'b100101,
    state38 : 6'b100110,
    state39 : 6'b100111,
    state40 : 6'b101000,
    state41 : 6'b101001,
    state42 : 6'b101010,
    state43 : 6'b101011,
    state44 : 6'b101100,
    state45 : 6'b101101,
    state46 : 6'b101110,
    state47 : 6'b101111,
    state48 : 6'b110000,
    state49 : 6'b110001,
    state50 : 6'b110010,
    state51 : 6'b110011,
    state52 : 6'b110100,
    state53 : 6'b110101,
    state54 : 6'b110110,
    state55 : 6'b110111,
    state56 : 6'b111000,
    state57 : 6'b111001,
    state58 : 6'b111010,
    state59 : 6'b111011,
    state60 : 6'b111100,
    state61 : 6'b111101,
    state62 : 6'b111110,
    state63 : 6'b111111;

// Hold current state of control seqeuence, initialize to reset state.
reg [5:0] present_state = reset_state;

// FSM - changes on state or reset edge.
always@(posedge clk, posedge reset)
begin
    if(reset == 1)
        present_state = reset_state;
    else
        case(present_state)

        endcase
end

// FSM state actions.
always@(present_state)
begin
    case(present_state)

    endcase
end 

    
endmodule