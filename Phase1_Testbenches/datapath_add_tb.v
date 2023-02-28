`timescale 1ns / 10ps
module datapath_add_tb;
    // Register Data
    wire [31:0] Bus_Data_tb, R0_Data_tb, R4_Data_tb, R5_Data_tb, PC_Data_tb, IR_Data_tb, MAR_Data_tb,
        MDR_Data_tb, Y_Data_tb, Zhigh_Data_tb, Zlow_Data_tb;
    // CPU Signals
    reg clk = 0; reg clr = 0;
    // Testbench signals.
    reg R0_in_tb, R4_in_tb, R4_out_tb, R5_in_tb, R5_out_tb, PC_in_tb, PC_out_tb, IR_in_tb, MAR_in_tb,
        Read_tb, MDR_in_tb, MDR_out_tb, Y_in_tb, Z_in_tb, Zlow_out_tb;
    reg [4:0] instruction_bits_tb;
    reg [31:0] Mdatain_tb;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
        Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110,
        T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
    reg [3:0] Present_state = Default;

datapath DUT(
    // Register Data
    .Bus_Data(Bus_Data_tb), .R0_Data(R0_Data_tb), .R4_Data(R4_Data_tb), .R5_Data(R5_Data_tb),
    .PC_Data(PC_Data_tb), .IR_Data(IR_Data_tb), .MAR_Data(MAR_Data_tb), .MDR_Data(MDR_Data_tb),
    .Y_Data(Y_Data_tb), .Zhigh_Data(Zhigh_Data_tb), .Zlow_Data(Zlow_Data_tb),
    // CPU Signals
    .clk(clk), .clr(clr),
    // Subset of register input signals.
    .R0_in(R0_in_tb), .R4_in(R4_in_tb), .R5_in(R5_in_tb), .PC_in(PC_in_tb), .IR_in(IR_in_tb),
    .MAR_in(MAR_in_tb), .MDR_in(MDR_in_tb), .Y_in(Y_in_tb), .Z_in(Z_in_tb), .Read(Read_tb),
    // Subset of Bus select controls
    .R4_out(R4_out_tb), .R5_out(R5_out_tb), .PC_out(PC_out_tb), 
    .Zlow_out(Zlow_out_tb), .MDR_out(MDR_out_tb),
    // Data Signals
    .alu_instruction(instruction_bits_tb), .Mdatain(Mdatain_tb)
);

initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end

always @(posedge clk) // finite state machine; if clock rising-edge
begin
	case (Present_state)
		Default : #35 Present_state = Reg_load1a;
		Reg_load1a : #35 Present_state = Reg_load1b;
		Reg_load1b : #35 Present_state = Reg_load2a;
		Reg_load2a : #35 Present_state = Reg_load2b;
		Reg_load2b : #35 Present_state = Reg_load3a;
		Reg_load3a : #35 Present_state = Reg_load3b;
		Reg_load3b : #35 Present_state = T0;
		T0 : #35 Present_state = T1;
		T1 : #35 Present_state = T2;
		T2 : #35 Present_state = T3;
		T3 : #35 Present_state = T4;
		T4 : #35 Present_state = T5;
	endcase
end

always @(Present_state) // do the required job in each state
begin
	case(Present_state)
        Default: begin // Initial conditions for all parameters.
                Mdatain_tb <= 32'h00000000;
                R0_in_tb <= 0; R4_in_tb <= 0; R5_in_tb <= 0; R4_out_tb <= 0; R5_out_tb <= 0;
                PC_in_tb <= 0; PC_out_tb <= 0; Z_in_tb <= 0; Zlow_out_tb <= 0; MDR_in_tb <= 0;
                MDR_out_tb <= 0; MAR_in_tb <= 0; IR_in_tb <= 0; Y_in_tb <= 0; Read_tb <= 0;
                instruction_bits_tb <= 5'b0;            
            end
        Reg_load1a: begin // Load 0xFA92 into MDR.
                Mdatain_tb <= 32'hFA92;
                Read_tb = 0; MDR_in_tb = 0; 
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0; 
            end
        Reg_load1b: begin // Initialize R4 with 0xFA92 from MDR.
                #10 MDR_out_tb <= 1; R4_in_tb <= 1;
                #15 MDR_out_tb <= 0; R4_in_tb <= 0;
            end
        Reg_load2a: begin // Load 0xFF into MDR.
                Mdatain_tb <= 32'hFF;
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0;
            end
        Reg_load2b: begin // Initialize R5 with 0xFF from MDR.
                #10 MDR_out_tb <= 1; R5_in_tb <= 1;
                #15 MDR_out_tb <= 0; R5_in_tb <= 0;
            end
        Reg_load3a: begin // Load 0x595 into MDR.
                Mdatain_tb <= 32'h595;
                #10 Read_tb <= 1; MDR_in_tb <= 1;
                #15 Read_tb <= 0; MDR_in_tb <= 0;
            end
        Reg_load3b: begin // Initialize R0 with 0x595 from MDR.
                #10 MDR_out_tb <= 1; R0_in_tb <= 1;
                #15 MDR_out_tb <= 0; R0_in_tb <= 0;
            end
        T0: begin // Get PC, send PC as instruction address to memory unit.
                #10 PC_out_tb <= 1; MAR_in_tb <= 1; Z_in_tb <= 1;
                #15 PC_out_tb <= 0; MAR_in_tb <= 0; Z_in_tb <= 0;
            end
        T1: begin // Load instruction into MDR.
                #10 Zlow_out_tb <= 1; PC_in_tb <= 1; Read_tb <= 1; MDR_in_tb <= 1;
                Mdatain_tb <= 32'h18228000; // opcode for add R0, R4, R5
                #15 Zlow_out_tb <= 0; PC_in_tb <= 0; Read_tb <= 0; MDR_in_tb <= 0;
            end
        T2: begin // Move instructions into instruction register.
                #10 MDR_out_tb <= 1; IR_in_tb <= 1;
                #15 MDR_out_tb <= 0; IR_in_tb <= 0;
            end
        T3: begin // Move contents of R4 (0xFA92) into Y register.
                #10 R4_out_tb <= 1; Y_in_tb <= 1;
                #15 R4_out_tb <= 0; Y_in_tb <= 0;
            end
        T4: begin   // Move contents of R5 (0xFF) into ALU, select appropriate ALU operation,
                    // store answer into Z register (expected answer: 0xFA92 ADD 0xFF = 0xFB91)
                #10 R5_out_tb <= 1; instruction_bits_tb <= IR_Data_tb[31:27]; Z_in_tb <= 1;
                #15 R5_out_tb <= 0; instruction_bits_tb <= 5'b0; Z_in_tb <= 0;
            end
        T5: begin // Move result from Z register into R0 (0xFB91).
                #10 Zlow_out_tb <= 1; R0_in_tb <= 1;
                #15 Zlow_out_tb <= 0; R0_in_tb <= 0;
            end
    endcase
end
endmodule