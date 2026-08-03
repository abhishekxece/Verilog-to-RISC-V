`timescale 1ns/1ps

module mux_tb;

    // -------------------------
    // 2:1 MUX signals
    // -------------------------
    reg a;
    reg b;
    reg sel2;
    wire y2;

    // -------------------------
    // 4:1 MUX signals
    // -------------------------
    reg [3:0] i;
    reg [1:0] sel4;
    wire y4;


    // -------------------------
    // Instantiate 2:1 MUX
    // -------------------------
    mux2to1 M1 (
        .a(a),
        .b(b),
        .sel(sel2),
        .y(y2)
    );


    // -------------------------
    // Instantiate 4:1 MUX
    // -------------------------
    mux4to1 M2 (
        .i(i),
        .sel(sel4),
        .y(y4)
    );


    // -------------------------
    // Test sequence
    // -------------------------
    initial begin

        // Create waveform file
        $dumpfile("waveform.vcd");
        $dumpvars(0, mux_tb);

        // =====================================
        // 2:1 MUX TEST
        // =====================================

        $display("----- 2:1 MUX TEST -----");

        a = 0;
        b = 1;
        sel2 = 0;
        #10;

        a = 0;
        b = 1;
        sel2 = 1;
        #10;

        a = 1;
        b = 0;
        sel2 = 0;
        #10;

        a = 1;
        b = 0;
        sel2 = 1;
        #10;


        // =====================================
        // 4:1 MUX TEST
        // =====================================

        $display("----- 4:1 MUX TEST -----");

        i = 4'b1010;

        sel4 = 2'b00;
        #10;

        sel4 = 2'b01;
        #10;

        sel4 = 2'b10;
        #10;

        sel4 = 2'b11;
        #10;


        $display("Simulation completed.");

        $finish;

    end

endmodule