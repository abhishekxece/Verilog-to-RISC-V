`timescale 1ns/1ps

module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input  wire                     clk,
    input  wire                     we,
    input  wire [ADDR_WIDTH-1:0]    addr,
    input  wire [DATA_WIDTH-1:0]    din,
    output reg  [DATA_WIDTH-1:0]    dout
);

    // Memory: 16 locations x 8 bits
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    // Synchronous read/write
    always @(posedge clk) begin
        if (we) begin
            // Write data into memory
            mem[addr] <= din;
        end
        else begin
            // Read data from memory
            dout <= mem[addr];
        end
    end

endmodule