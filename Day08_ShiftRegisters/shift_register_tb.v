`timescale 1ns/1ps

module shift_register_tb;

    reg clk;
    reg reset;
    reg serial_in;

    wire serial_out;
    wire [3:0] parallel_out;

    // SISO Shift Register
    siso_shift_register uut_siso (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // SIPO Shift Register
    sipo_shift_register uut_sipo (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // VCD waveform
        $dumpfile("shift_register.vcd");
        $dumpvars(0, shift_register_tb);

        // Initial values
        clk = 1'b0;
        reset = 1'b1;
        serial_in = 1'b0;

        // Reset
        #10;
        reset = 1'b0;

        // Send 1
        serial_in = 1'b1;
        #10;

        // Send 0
        serial_in = 1'b0;
        #10;

        // Send 1
        serial_in = 1'b1;
        #10;

        // Send 1
        serial_in = 1'b1;
        #10;

        // Send 0
        serial_in = 1'b0;
        #10;

        // Send 1
        serial_in = 1'b1;
        #10;

        $finish;
    end

    // Monitor values
    initial begin
        $monitor(
            "Time=%0t | Reset=%b | Serial_In=%b | SISO_Out=%b | SIPO_Out=%b",
            $time,
            reset,
            serial_in,
            serial_out,
            parallel_out
        );
    end

endmodule