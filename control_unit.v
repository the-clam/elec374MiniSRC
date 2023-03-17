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
    // Reset State
    reset_state = 6'b000000,
    // Common Fetch Instructions
    Fetch0 = 6'b000001, Fetch1 = 6'b000010, Fetch2 = 6'b000011,
    // Loading/Storing - ldi, ld, st
    MemAccess3 = 6'b000100, MemAccess4 = 6'b000101, MemAccess5 = 6'b000110,
    ldi5 = 6'b000111, ld6 = 6'b001000, st6 = 6'b001001, ld7 = 6'b001010,
    // ALU
    state11 = 6'b001011,
    state12 = 6'b001100,
    state13 = 6'b001101,
    state14 = 6'b001110,
    state15 = 6'b001111,
    state16 = 6'b010000,
    state17 = 6'b010001,
    state18 = 6'b010010,
    state19 = 6'b010011,
    state20 = 6'b010100,
    state21 = 6'b010101,
    state22 = 6'b010110,
    state23 = 6'b010111,
    state24 = 6'b011000,
    state25 = 6'b011001,
    state26 = 6'b011010,
    state27 = 6'b011011,
    state28 = 6'b011100,
    state29 = 6'b011101,
    state30 = 6'b011110,
    state31 = 6'b011111;

// Hold current state of control seqeuence, initialize to reset state.
reg [5:0] present_state = reset_state;

// FSM - changes on state or reset edge.
always@(posedge clk, posedge reset)
begin
    if(reset == 1)
        present_state = reset_state;
    else
        case(present_state)
            reset_state : #40 present_state = Fetch0;
            Fetch0 : #30 present_state = Fetch1;
            Fetch1 : #30 present_state = Fetch2;
            Fetch2 : #30
                begin
                    case(IR_Data[31:27])
                        // MemAccess -> ld, st, ldi
                        5'b00000, 5'b00001, 5'b00010 : present_state = MemAccess3;
                    endcase
                end

            // Memory Access
            MemAccess3 : #30 present_state = MemAccess4;
            MemAccess4 : #30
                begin
                    case(IR_Data[31:27])
                        5'b00000, 5'b00010 : present_state = MemAccess5; // ld/st
                        5'b00001 : present_state = ldi5; // ldi
                    endcase
                end
            MemAccess5 : #30
                begin
                    case(IR_Data[31:27])
                        5'b00000 : present_state = ld6; //ld
                        5'b00010 : present_state = st6; //st
                    endcase
                end
            ldi5 : #30 present_state = Fetch0;
            ld6 : #30 present_state = ld7;
            ld7: #30 present_state = Fetch0;
            st6 : #30 present_state = Fetch0;
            
            // ALU

        endcase
end

// FSM state actions.
always@(present_state)
begin
    case(present_state)
        reset_state: begin
            Rout <= 0; PC_out <= 0; MDR_out <= 0; Zhigh_out <= 0; Zlow_out <= 0; HI_out <= 0; LO_out <= 0;
            InPort_out <= 0; C_out <= 0; Rin <= 0; HI_in <= 0; LO_in <= 0; PC_in <= 0; IR_in <= 0; 
            Y_in <= 0; Z_in <= 0; MAR_in <= 0; MDR_in <= 0; OutPort_in <= 0; alu_instruction_bits <= 0;
            IncPC <= 0; Read <= 0; Write <= 0; Gra <= 0; Grb <= 0; Grc <= 0; BAout <= 0; CON_in <= 0;
        end
        Fetch0: begin
            #0; PC_out <= 1; MAR_in <= 1; IncPC <= 1; Z_in <= 1;
            #40; PC_out <= 0; MAR_in <= 0; IncPC <= 0; Z_in <= 0;
        end
        Fetch1: begin
            #0; Zlow_out <= 1; PC_in <= 1; Read <= 1; MDR_in <= 1;
            #40; Zlow_out <= 0; PC_in <= 0; Read <= 0; MDR_in <= 0;
        end
        Fetch2: begin
            #0; MDR_out <= 1; IR_in <= 1;
            #40; MDR_out <= 0; IR_in <= 0;
        end
        MemAccess3: begin
            #0; Grb <= 1; BAout <= 1; Y_in <= 1;
            #40; Grb <= 0; BAout <= 0; Y_in <= 0;
        end
        MemAccess4: begin
            #0; C_out <= 1; alu_instruction_bits <= 5'b00011; Z_in <= 1;
            #40; C_out <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        MemAccess5: begin
            #0; Zlow_out <= 1; MAR_in <= 1;
            #40; Zlow_out <= 0; MAR_in <= 0;
        end
        ldi5: begin
            #0; Zlow_out <= 1; Gra <= 1; Rin <= 1;
            #40; Zlow_out <= 0; Gra <= 0; Rin <= 0;
        end
        ld6: begin
            #0; Read <= 1; MDR_in <= 1;
            #40; Read <= 0; MDR_in <= 0;
        end
        ld7: begin
            #0; MDR_out <= 1; Gra <= 1; Rin <= 1;
            #40; MDR_out <= 0; Gra <= 0; Rin <= 0;
        end
        st6: begin
            #0; Read <= 1; MDR_in <= 1;
            #40; Read <= 0; MDR_in <= 0;
        end
    endcase
end    
endmodule