`timescale 1ns/1ps

module half_adder_tb;

    reg a;
    reg b;

    wire sum;
    wire carry;

    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        $display("Time | a b | carry sum");
        $display("----------------------");

        a = 0;
        b = 0;
        #10;
        $display("%4t | %b %b |   %b     %b",
                 $time, a, b, carry, sum);

        a = 0;
        b = 1;
        #10;
        $display("%4t | %b %b |   %b     %b",
                 $time, a, b, carry, sum);

        a = 1;
        b = 0;
        #10;
        $display("%4t | %b %b |   %b     %b",
                 $time, a, b, carry, sum);

        a = 1;
        b = 1;
        #10;
        $display("%4t | %b %b |   %b     %b",
                 $time, a, b, carry, sum);

        $finish;
    end

endmodule