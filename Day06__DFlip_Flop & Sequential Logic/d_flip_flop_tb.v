`timescale 1ns/1ps

module d_flip_flop_tb;

    reg clk;
    reg reset;
    reg d;
    wire q;

    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, d_flip_flop_tb);

        clk = 0;
        reset = 1;
        d = 0;

        #10 reset = 0;

        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;

        #10 $finish;
    end

endmodule