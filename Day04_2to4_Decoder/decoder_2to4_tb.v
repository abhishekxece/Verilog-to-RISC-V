`timescale 1ns/1ps

module decoder_2to4_tb;

reg [1:0] A;
wire [3:0] Y;

decoder_2to4 uut (
    .A(A),
    .Y(Y)
);

initial begin

    $dumpfile("decoder_2to4.vcd");
    $dumpvars(0, decoder_2to4_tb);

    $display("Time\tA\tY");
    $monitor("%0t\t%b\t%b", $time, A, Y);

    A = 2'b00;
    #10;

    A = 2'b01;
    #10;

    A = 2'b10;
    #10;

    A = 2'b11;
    #10;

    $finish;

end

endmodule