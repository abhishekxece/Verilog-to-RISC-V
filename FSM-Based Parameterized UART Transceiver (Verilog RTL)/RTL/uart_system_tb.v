`timescale 1ns/1ps

module uart_system_tb;

    //=========================================
    // Testbench Signals
    //=========================================
    reg clk;
    reg rst;
    reg [7:0] data_in;
    reg tx_start;

    wire tx;
    wire tx_busy;
    wire [7:0] data_out;
    wire data_valid;

    //=========================================
    // Instantiate UART Top Module
    //=========================================
    uart_top #(
        .clks_per_bit(16)
    ) uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .tx_start(tx_start),
        .tx(tx),
        .tx_busy(tx_busy),
        .data_out(data_out),
        .data_valid(data_valid)
    );

    //=========================================
    // Clock Generation (100 MHz)
    //=========================================
    always #5 clk = ~clk;

    //=========================================
    // Task to Send One Byte
    //=========================================
    task send_byte;
        input [7:0] data;
        begin

            @(posedge clk);
            data_in = data;
            tx_start = 1'b1;

            @(posedge clk);
            tx_start = 1'b0;

            // Wait until receiver finishes
            wait(data_valid == 1'b1);

            // Check received data
            if(data_out == data)
                $display("[%0t] PASS : Sent = %h Received = %h",
                         $time, data, data_out);
            else
                $display("[%0t] FAIL : Sent = %h Received = %h",
                         $time, data, data_out);

            @(posedge clk);

        end
    endtask

    //=========================================
    // Test Sequence
    //=========================================
    initial
    begin

        // Waveform
        $dumpfile("simulation/uart_system.vcd");
        $dumpvars(0, uart_system_tb);

        // Initialize
        clk = 0;
        rst = 1;
        data_in = 8'h00;
        tx_start = 0;

        // Reset
        #20;
        rst = 0;

        // Test Cases
        send_byte(8'hA5);
        send_byte(8'h55);
        send_byte(8'hAA);
        send_byte(8'hFF);
        send_byte(8'h00);

        #200;

        $display("-------------------------------------");
        $display("UART SYSTEM TEST COMPLETED");
        $display("-------------------------------------");

        $finish;

    end

endmodule