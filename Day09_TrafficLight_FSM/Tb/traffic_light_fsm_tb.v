`timescale 1ns/1ps

module traffic_light_fsm_tb;

    reg clk;
    reg reset;

    wire red;
    wire yellow;
    wire green;

    //============================================================
    // DUT
    //============================================================

    traffic_light_fsm #(
        .RED_TIME(5),
        .GREEN_TIME(5),
        .YELLOW_TIME(2)
    ) dut (

        .clk(clk),
        .reset(reset),

        .red(red),
        .yellow(yellow),
        .green(green)

    );

    //============================================================
    // Clock Generation
    //============================================================

    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end

    //============================================================
    // Test Sequence
    //============================================================

    initial begin

        // Start with reset
        reset = 1;

        #20;

        reset = 0;

        // Run the traffic light
        #150;

        $finish;

    end

    //============================================================
    // Monitor
    //============================================================

    initial begin

        $monitor(
            "Time=%0t | Reset=%b | RED=%b | YELLOW=%b | GREEN=%b",
            $time,
            reset,
            red,
            yellow,
            green
        );

    end

    //============================================================
    // Waveform
    //============================================================

    initial begin

        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_fsm_tb);

    end

endmodule