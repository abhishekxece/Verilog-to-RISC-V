`timescale 1ns/1ps

module single_port_ram_tb;

    // Testbench signals
    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate RAM
    single_port_ram uut (
        .clk  (clk),
        .we   (we),
        .addr (addr),
        .din  (din),
        .dout (dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        // Waveform dump
        $dumpfile("single_port_ram.vcd");
        $dumpvars(0, single_port_ram_tb);

        // Initial values
        clk  = 0;
        we   = 0;
        addr = 4'd0;
        din  = 8'd0;

        $display("==============================================");
        $display("       SINGLE-PORT RAM TESTBENCH");
        $display("==============================================");

        // -----------------------------------------
        // WRITE 1
        // Address = 3
        // Data = AA
        // -----------------------------------------
        #10;

        we   = 1;
        addr = 4'd3;
        din  = 8'hAA;

        @(posedge clk);
        #1;

        $display("WRITE: Address = %d, Data = %h", addr, din);

        // -----------------------------------------
        // WRITE 2
        // Address = 7
        // Data = 55
        // -----------------------------------------
        #9;

        we   = 1;
        addr = 4'd7;
        din  = 8'h55;

        @(posedge clk);
        #1;

        $display("WRITE: Address = %d, Data = %h", addr, din);

        // -----------------------------------------
        // WRITE 3
        // Address = 10
        // Data = F0
        // -----------------------------------------
        #9;

        we   = 1;
        addr = 4'd10;
        din  = 8'hF0;

        @(posedge clk);
        #1;

        $display("WRITE: Address = %d, Data = %h", addr, din);

        // -----------------------------------------
        // READ Address 3
        // -----------------------------------------
        #9;

        we   = 0;
        addr = 4'd3;

        @(posedge clk);
        #1;

        $display("READ : Address = %d, Data = %h", addr, dout);

        if (dout == 8'hAA)
            $display("PASS: Address 3 contains AA");
        else
            $display("FAIL: Expected AA, Got %h", dout);

        // -----------------------------------------
        // READ Address 7
        // -----------------------------------------
        #9;

        addr = 4'd7;

        @(posedge clk);
        #1;

        $display("READ : Address = %d, Data = %h", addr, dout);

        if (dout == 8'h55)
            $display("PASS: Address 7 contains 55");
        else
            $display("FAIL: Expected 55, Got %h", dout);

        // -----------------------------------------
        // READ Address 10
        // -----------------------------------------
        #9;

        addr = 4'd10;

        @(posedge clk);
        #1;

        $display("READ : Address = %d, Data = %h", addr, dout);

        if (dout == 8'hF0)
            $display("PASS: Address 10 contains F0");
        else
            $display("FAIL: Expected F0, Got %h", dout);

        // -----------------------------------------
        // Finish simulation
        // -----------------------------------------
        #10;

        $display("==============================================");
        $display("          SIMULATION COMPLETE");
        $display("==============================================");

        $finish;

    end

endmodule