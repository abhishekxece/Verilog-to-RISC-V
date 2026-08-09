`timescale 1ns/1ps

module alu_4bit_tb;

    // Testbench inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    // Testbench outputs
    wire [3:0] Y;
    wire       Carry;

    // Instantiate the ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Y(Y),
        .Carry(Carry)
    );

    // Waveform generation
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_4bit_tb);
    end

    // Test sequence
    initial begin

        // --------------------------------
        // Initial values
        // --------------------------------
        A = 4'b1010;       // 10
        B = 4'b0011;       // 3


        // --------------------------------
        // ADDITION
        // 1010 + 0011 = 1101
        // --------------------------------
        ALU_Sel = 3'b000;
        #10;

        $display("ADD       : A=%b B=%b Y=%b Carry=%b",
                 A, B, Y, Carry);


        // --------------------------------
        // SUBTRACTION
        // 1010 - 0011 = 0111
        // --------------------------------
        ALU_Sel = 3'b001;
        #10;

        $display("SUB       : A=%b B=%b Y=%b",
                 A, B, Y);


        // --------------------------------
        // AND
        // 1010 & 0011 = 0010
        // --------------------------------
        ALU_Sel = 3'b010;
        #10;

        $display("AND       : A=%b B=%b Y=%b",
                 A, B, Y);


        // --------------------------------
        // OR
        // 1010 | 0011 = 1011
        // --------------------------------
        ALU_Sel = 3'b011;
        #10;

        $display("OR        : A=%b B=%b Y=%b",
                 A, B, Y);


        // --------------------------------
        // XOR
        // 1010 ^ 0011 = 1001
        // --------------------------------
        ALU_Sel = 3'b100;
        #10;

        $display("XOR       : A=%b B=%b Y=%b",
                 A, B, Y);


        // --------------------------------
        // NOT
        // ~1010 = 0101
        // --------------------------------
        ALU_Sel = 3'b101;
        #10;

        $display("NOT       : A=%b Y=%b",
                 A, Y);


        // --------------------------------
        // LEFT SHIFT
        // 1010 << 1 = 0100
        // --------------------------------
        ALU_Sel = 3'b110;
        #10;

        $display("LEFT SHIFT: A=%b Y=%b",
                 A, Y);


        // --------------------------------
        // RIGHT SHIFT
        // 1010 >> 1 = 0101
        // --------------------------------
        ALU_Sel = 3'b111;
        #10;

        $display("RIGHT SHIFT: A=%b Y=%b",
                 A, Y);


        // --------------------------------
        // ADDITION OVERFLOW TEST
        // 1111 + 0001 = 1 0000
        // --------------------------------
        A = 4'b1111;
        B = 4'b0001;
        ALU_Sel = 3'b000;
        #10;

        $display("OVERFLOW ADD: A=%b B=%b Y=%b Carry=%b",
                 A, B, Y, Carry);


        // --------------------------------
        // TEST A = 0, B = 0
        // --------------------------------
        A = 4'b0000;
        B = 4'b0000;
        ALU_Sel = 3'b000;
        #10;

        $display("ZERO ADD  : A=%b B=%b Y=%b Carry=%b",
                 A, B, Y, Carry);


        // End simulation
        $finish;

    end

endmodule