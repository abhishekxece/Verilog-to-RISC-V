`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg din;

    wire detected;

    // Instantiate DUT
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Send one bit
    task send_bit;
        input bit_value;

        begin
            din = bit_value;

            @(posedge clk);
            #1;

            $display(
                "Time=%0t | Input=%b | Detected=%b",
                $time,
                din,
                detected
            );
        end
    endtask

    initial begin

        // VCD file
        $dumpfile("day10_sequence_detector.vcd");
        $dumpvars(0, sequence_detector_tb);

        // Initial values
        clk = 0;
        reset = 1;
        din = 0;

        // Reset
        #10;
        reset = 0;

        // Detect 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Some additional bits
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        #10;

        $finish;
    end

endmodule