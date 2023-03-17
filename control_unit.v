`timescale 1ns / 10ps
module control_unit(
    // Control Unit Inputs
    input wire clk, reset, stop, CON_FF,
    input wire [31:0] IR_Data,
    // Control Unit Outputs
    output reg run, clr,
    // Bus Reg Out Controls
    output reg Rout, PC_out, MDR_out, Zhigh_out, Zlow_out, HI_out, LO_out, InPort_out, C_out,
    // Bus Reg In Controls
    output reg Rin, HI_in, LO_in, PC_in, IR_in, Y_in, Z_in, MAR_in, MDR_in, OutPort_in,
    output reg [15:0] RX_in_man,
    // ALU Controls
    output reg [4:0] alu_instruction_bits,
    output reg IncPC,
    // Memory Controls
    output reg Read, Write,
    // Select and Encode
    output reg Gra, Grb, Grc, BAout,
    // ConFF Enable
    output reg CON_in,
    // Current State
    output reg [5:0] present_state
);

// Declare states - // est need 64 @ max? so use 6 bit present state
parameter
    reset_state = 6'b000000, Fetch0 = 6'b000001, Fetch1 = 6'b000010, Fetch2 = 6'b000011, 
    MemAccess3 = 6'b000100, MemAccess4 = 6'b000101, MemAccess5 = 6'b000110, ldi5 = 6'b000111,
    ld6 = 6'b001000, ld7 = 6'b001001, st6 = 6'b001010, ThreeParam3 = 6'b001011, 
    ThreeParamReg4 = 6'b001100, ThreeParamImm4 = 6'b001101, ThreeParam5 = 6'b001110,
    TwoParamLong3 = 6'b001111, TwoParamLong4 = 6'b010000, TwoParamLong5 = 6'b010001,
    TwoParamLong6 = 6'b010010, TwoParamShort3 = 6'b010011, TwoParamShort4 = 6'b010100, 
    Branch3 = 6'b010101, Branch4 = 6'b010110, Branch5 = 6'b010111, Branch6 = 6'b011000,
    JumpReg3 = 6'b011001, JumpAndLink3 = 6'b011010, JumpAndLink4 = 6'b011011, InPort3 = 6'b011100,
    OutPort3 = 6'b011101, MoveFromHI3 = 6'b011110, MoveFromLO3 = 6'b011111, 
    Nop3 = 6'b100000, Halt3 = 6'b100001;
initial present_state = reset_state; // Initialize current state.

// FSM state changes on input.
always@(posedge clk, posedge reset, posedge stop)
begin
    if(reset == 1)
        present_state = reset_state;
    else if(stop == 1)
        present_state = Halt3;
    else if (run == 1)
        case(present_state)
            reset_state : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            Fetch0 : #30 present_state = Fetch1;
            Fetch1 : #30 present_state = Fetch2;
            Fetch2 : #30
                begin
                    case(IR_Data[31:27])
                        // MemAccess -> ld, st, ldi
                        5'b00000, 5'b00001, 5'b00010 : present_state = MemAccess3;
                        // ALU operators -> add, sub, and, or, shr, shra, shl, ror, rol, addi, andi, ori
                        5'b00011, 5'b00100, 5'b00101, 5'b00110, 5'b00111, 5'b01000, 5'b01001, 5'b01010,
                        5'b01011, 5'b01100, 5'b01101, 5'b01110 : present_state = ThreeParam3;
                        // ALU operators -> mul, div
                        5'b01111, 5'b10000 : present_state = TwoParamLong3;
                        // ALU operators -> neg, not
                        5'b10001, 5'b10010 : present_state = TwoParamShort3;
                        // Branch operators -> brzr, brnz, brpl, brmi
                        5'b10011 : present_state = Branch3;
                        // Special operators
                        5'b10100 : present_state = JumpReg3; // jr
                        5'b10101 : present_state = JumpAndLink3; // jal
                        5'b10110 : present_state = InPort3; // in
                        5'b10111 : present_state = OutPort3; // out
                        5'b11000 : present_state = MoveFromHI3; // mfhi
                        5'b11001 : present_state = MoveFromLO3; // mflo
                        5'b11010 : present_state = Nop3; // nop
                        5'b11011 : present_state = Halt3; // halt
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
            ldi5 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            ld6 : #30 present_state = ld7;
            ld7: begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            st6 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            
            // ALU - 3 register
            ThreeParam3 : #30
                begin
                    case(IR_Data[31:27])
                        5'b00011, 5'b00100, 5'b00101, 5'b00110, 5'b00111, 5'b01000, 5'b01001, 5'b01010,
                        5'b01011 : present_state = ThreeParamReg4; // for Ra, Rb, Rc
                        5'b01100, 5'b01101, 5'b01110 : present_state = ThreeParamImm4; // For Ra, Rb, C
                    endcase
                end
            ThreeParamReg4, ThreeParamImm4 : #30 present_state = ThreeParam5;
            ThreeParam5 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end

            // ALU - 2 registers, 64 bit result
            TwoParamLong3 : #30 present_state = TwoParamLong4;
            TwoParamLong4 : #30 present_state = TwoParamLong5;
            TwoParamLong5 : #30 present_state = TwoParamLong6;
            TwoParamLong6 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end

            // ALU - 2 register, 32 bits result
            TwoParamShort3 : #30 present_state = TwoParamShort4;
            TwoParamShort4 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end

            // Branches
            Branch3 : #30 present_state = Branch4;
            Branch4 : #30 present_state = Branch5;
            Branch5 : #30 present_state = Branch6;
            Branch6 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end

            // Special Instructions
            JumpReg3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            JumpAndLink3 : #30 present_state = JumpAndLink4;
            JumpAndLink4 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            InPort3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            OutPort3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            MoveFromHI3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            MoveFromLO3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            Nop3 : begin #30 present_state = 6'bXXXXXX; #40 present_state = Fetch0; end
            Halt3 : #30 present_state = 6'bXXXXXX; 
        endcase
end

// FSM state actions.
always@(present_state)
begin
    case(present_state)
        reset_state: begin
            #0; Rout <= 0; PC_out <= 0; MDR_out <= 0; Zhigh_out <= 0; Zlow_out <= 0; HI_out <= 0; 
            LO_out <= 0; InPort_out <= 0; C_out <= 0; Rin <= 0; HI_in <= 0; LO_in <= 0; PC_in <= 0; 
            IR_in <= 0; Y_in <= 0; Z_in <= 0; MAR_in <= 0; MDR_in <= 0; OutPort_in <= 0; 
            alu_instruction_bits <= 0; IncPC <= 0; Read <= 0; Write <= 0; Gra <= 0; Grb <= 0; Grc <= 0;
            BAout <= 0; CON_in <= 0; clr <= 1;
            #35; clr <= 0; run <= 1;
        end
        
        // Instruction Load
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
        
        // Memory Instructions
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
            #0; Gra <= 1; Rout <= 1; MDR_in <= 1; Write <= 1;
            #40; Gra <= 0; Rout <= 0; MDR_in <= 0; Write <= 0;
        end

        // ALU Instructions - 3 Ra, Rb, Rc, or Ra, Rb, C
        ThreeParam3: begin
            #0; Grb <= 1; Rout <= 1; Y_in <= 1;
            #40; Grb <= 0; Rout <= 0; Y_in <= 0;
        end
        ThreeParamReg4: begin
            #0; Grc <= 1; Rout <= 1; alu_instruction_bits <= IR_Data[31:27]; Z_in <= 1;
            #40; Grc <= 0; Rout <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        ThreeParamImm4: begin
            #0; C_out <= 1; Z_in <= 1;
                case(IR_Data[31:27])
                    5'b01100 : alu_instruction_bits <= 5'b00011;
                    5'b01101 : alu_instruction_bits <= 5'b00101;
                    5'b01110 : alu_instruction_bits <= 5'b00110;
                endcase
            #40; C_out <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        ThreeParam5: begin
            #0; Zlow_out <= 1; Gra <= 1; Rin <= 1;
            #40; Zlow_out <= 0; Gra <= 0; Rin <= 0;
        end

        // ALU - 2 register, 64 bits result
        TwoParamLong3 : begin
            #0; Gra <= 1; Rout <= 1; Y_in <= 1;
            #40; Gra <= 0; Rout <= 0; Y_in <= 0;
        end
        TwoParamLong4 : begin
            #0; Grb <= 1; Rout <= 1; alu_instruction_bits <= IR_Data[31:27]; Z_in <= 1;
            #40; Grb <= 0; Rout <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        TwoParamLong5 : begin
            #0; Zlow_out <= 1; LO_in <= 1;
            #40; Zlow_out <= 0; LO_in <= 0;
        end
        TwoParamLong6 : begin
            #0; Zhigh_out <= 1; HI_in <= 1;
            #40; Zhigh_out <= 0; HI_in <= 0;
        end

        // ALU - 2 register, 32 bits result
        TwoParamShort3 : begin
            #0; Grb <= 1; Rout <= 1; alu_instruction_bits <= IR_Data[31:27]; Z_in <= 1;
            #40; Grb <= 0; Rout <= 0; alu_instruction_bits <= IR_Data[31:27]; Z_in <= 0;
        end
        TwoParamShort4 : begin
            #0; Zlow_out <= 1; Gra <= 1; Rin <= 1;
            #40; Zlow_out <= 0; Gra <= 0; Rin <= 0;
        end

        // Branches
        Branch3: begin
            #0; Gra <= 1; Rout <= 1; 
            #20; CON_in <= 1;
            #15; Gra <= 0; Rout <= 0; CON_in <= 0;
        end
        Branch4: begin
            #0; PC_out <= 1; Y_in <= 1;
            #40; PC_out <= 0; Y_in <= 0;
        end
        Branch5: begin
            #0; C_out <= 1; alu_instruction_bits <= 5'b00011; Z_in <= 1;
            #40; C_out <= 0; alu_instruction_bits <= 0; Z_in <= 0;
        end
        Branch6: begin
            #0; Zlow_out <= 1; if(CON_FF) PC_in <= 1;
            #40; Zlow_out <= 0; PC_in <= 0;
        end

        // Special Instructions
        JumpReg3: begin
            #0; Gra <= 1; Rout <= 1; PC_in <= 1;
            #40; Gra <= 0; Rout <= 0; PC_in <= 0;
        end
        JumpAndLink3: begin
            #0; PC_out <= 1; RX_in_man <= 16'b1000000000000000;
            #40; PC_out <= 0; RX_in_man <= 16'b0;
        end
        JumpAndLink4: begin
            #0; Gra <= 1; Rout <= 1; PC_in <= 1;
            #40; Gra <= 0; Rout <= 0; PC_in <= 0;
        end
        InPort3: begin
            #0; Gra <= 1; Rin <= 1; InPort_out <= 1;
            #40; Gra <= 0; Rin <= 0; InPort_out <= 0;
        end
        OutPort3: begin
            #0; Gra <= 1; Rout <= 1; OutPort_in <= 1;
            #40; Gra <= 0; Rout <= 0; OutPort_in <= 0;
        end
        MoveFromHI3: begin
            #0; Gra <= 1; Rin <= 1; HI_out <= 1;
            #40; Gra <= 0; Rin <= 0; HI_out <= 0;
        end
        MoveFromLO3: begin
            #0; Gra <= 1; Rin <= 1; LO_out <= 1;
            #40; Gra <= 0; Rin <= 0; LO_out <= 0;
        end
        Nop3: begin
            // Do nothing
        end
        Halt3: begin
            #40 run <= 0;
        end
    endcase
end    
endmodule