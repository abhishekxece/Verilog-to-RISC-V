`timescale 1ns/1ps

module mod10_counter_tb;

reg clk;
reg reset;
wire [3:0] count;

mod10_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("mod10_counter.vcd");
    $dumpvars(0, mod10_counter_tb);

    clk = 0;
    reset = 1;

    #10;

    reset = 0;

    #120;

    $finish;

end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%d | Binary=%b",
             $time, reset, count, count);
end

endmodule