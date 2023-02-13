`timescale 1 ns/10 ps
module alu(
    input wire [4:0] instruction,
    input wire [31:0] A_in,
    input wire [31:0] B_in,
    input wire [31:0] Y_in,
    output reg [63:0] C_result
);

    // Wires to carry data out from ALU modules.
    wire [31:0] add_out, and_out, neg_out, not_out, or_out, rol_out, ror_out, shl_out, shr_out, shra_out, sub_out; // IncPC_out
    wire [63:0] mul_out, div_out
    wire add_cout, sub_cout;
    // Initialize ALU modules.
    alu_add add_instance(.A(Y_in), .B(B_in), .C_in(1'b0), .S(add_out) .C_out(add_cout));
    alu_and and_instance(.A(Y_in), .B(B_in), .C(and_out));
    // alu_div div_instance();
    // alu_mul mul_instance();
    alu_neg neg_instance(.input_data(B_in), .output_data(neg_out));
    alu_not not_instance(.input_data(B_in), .output_data(not_out));
    alu_or 	or_instance(.A(Y_in), .B(B_in), .C(or_out));
    alu_rol rol_instance(.input_data(Y_in), .num_rotates(B_in), .output_data(rol_out));
    alu_ror ror_instance(.input_data(Y_in), .num_rotates(B_in), .output_data(ror_out));
    alu_shl shl_instance(.input_data(Y_in), .num_shifts(B_in), .output_data(shl_out));
    alu_shr shr_instance(.input_data(Y_in), .num_shifts(B_in), .output_data(shr_out));
    // alu_shra shra_instance();
    alu_sub sub_instance(.A(Y_in), .B(B_in), .C_in(1'b0), .S(sub_out) .C_out(sub_cout));
    // PC Increment


    // Instruction decoding
    always@(*)
    begin
        case(instruction)
            5'b00001 : 
                begin // add
                    C_result[31:0] <= add_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b00010 : 
                begin
                    
                end
            5'b00011 : 
                begin
                    
                end
            5'b00100 : 
                begin // sub
                    C_result[31:0] <= sub_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b00101 : 
                begin
                    
                end
            5'b00110 : 
                begin // or 
                    C_result[31:0] <= or_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b00111 : 
                begin // shr
                    C_result[31:0] <= shr_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01000 : 
                begin // shra
                    C_result[31:0] <= shra_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01001 : 
                begin // shl
                    C_result[31:0] <= shl_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01010 : 
                begin // ror
                    C_result[31:0] <= ror_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01011 : 
                begin // rol
                    C_result[31:0] <= rol_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01100 : 
                begin // addi
                    C_result[31:0] <= add_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01101 : 
                begin // andi
                    C_result[31:0] <= and_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01110 : 
                begin // ori
                    C_result[31:0] <= or_out[31:0];
                    C_result[63:32] <= 32'd0;
                end
            5'b01111 : 
                begin // mul
                    C_result[63:0] <= mul_out[63:0];
                end
            5'b10000 : 
                begin // div
                    C_result[63:0] <= div_out[63:0];
                end
            5'b10001 : 
                begin
                    C_reg[31:0] <= neg_out[31:0];
					C_reg[63:32] <= 32'd0;
                end
            5'b10010 : 
                begin
                    C_reg[31:0] <= not_out[31:0];
					C_reg[63:32] <= 32'd0;
                end
            5'b10011 : 
                begin
                    
                end
            5'b10100 : 
                begin
                    
                end
            5'b10101 : 
                begin
                    
                end
            5'b10110 : 
                begin
                    
                end
            5'b10111 : 
                begin
                    
                end
            5'b11000 : 
                begin
                    
                end
            5'b11001 : 
                begin
                    
                end
            5'b11010 : 
                begin
                    
                end
            5'b11011 : 
                begin
                    
                end
            5'b11100 : 
                begin
                    
                end
            5'b11101 : 
                begin
                    
                end
            5'b11110 : 
                begin
                    
                end
            5'b11111 : 
                begin
                    
                end
            default :
                begin
                    C_result [63:0] <= 64'd0;
                end
        endcase
    end


endmodule
