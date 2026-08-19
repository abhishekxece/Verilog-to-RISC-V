module uart_top #(
    parameter clks_per_bit = 16
)(
    input wire clk,
    input wire rst,

    input wire [7:0] data_in,
    input wire tx_start,

    output wire tx,
    output wire tx_busy,

    output wire [7:0] data_out,
    output wire data_valid
);

    //--------------------------------------------------
    // UART Transmitter
    //--------------------------------------------------
    uart_tx #(
        .clks_per_bit(clks_per_bit)
    ) TX (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .tx_start(tx_start),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    //--------------------------------------------------
    // UART Receiver
    //--------------------------------------------------
    uart_rx #(
        .clks_per_bit(clks_per_bit)
    ) RX (
        .clk(clk),
        .rst(rst),
        .rx(tx),              // Connect TX directly to RX
        .data_out(data_out),
        .data_valid(data_valid)
    );

endmodule