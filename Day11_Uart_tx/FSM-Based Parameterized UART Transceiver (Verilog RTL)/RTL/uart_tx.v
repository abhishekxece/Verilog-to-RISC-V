module uart_tx # (
  parameter clks_per_bit = 16
)  (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire tx_start,

    output reg tx,
    output reg tx_busy  
    );

    localparam IDLE = 2'D0;
    localparam START = 2'd1;
    localparam DATA =2'd2;
    localparam STOP = 2'd3;

    reg [1:0] state;
    reg [15:0] clk_count;
    reg [2:0] bit_index;
    reg [7:0] data_req;

    
    always @(posedge clk)
    begin

        if (rst)
        begin
            state <= IDLE;
            tx <= 1'B1;
            tx_busy <= 1'B0;
            clk_count <= 16'b0;
            bit_index <= 3'b0;
            data_req <= 8'b0;
              
        end

        else

        begin 
            case(state)
                IDLE:
                begin
                    tx <= 1'b1;
                    clk_count <= 16'b0;
                    bit_index <= 3'b0;

                    if (tx_start)
                    begin
                        data_req <= data_in;
                        state <= START;
                        tx_busy <= 1'b1;
                    end
                    else
                        state <= IDLE;
                end

                START:
                begin
                    tx <= 1'b0;

                    if (clk_count < clks_per_bit - 1)
                    begin
                        clk_count <= clk_count + 1'b1;
                        state <= START;
                    end
                    else
                    begin
                        clk_count <= 16'b0;
                        state <= DATA;
                    end
                end

                DATA:
                begin
                    tx <= data_req[bit_index];

                    if (clk_count < clks_per_bit - 1)
                    begin
                        clk_count <= clk_count + 1'b1;
                        state <= DATA;
                    end
                    else
                    begin
                        clk_count <= 16'b0;

                        if (bit_index < 3'd7)
                        begin
                            bit_index <= bit_index + 1'b1;
                            state <= DATA;
                        end
                        else
                        begin
                            bit_index <= 3'b0;
                            state <= STOP;
                        end
                    end
                end

                STOP:
                begin
                    tx <= 1'b1;

                    if (clk_count < clks_per_bit - 1)
                    begin
                        clk_count <= clk_count + 1'b1;
                        state <= STOP;
                    end
                    else
                    begin
                        clk_count <= 16'b0;
                        state <= IDLE;
                        tx_busy <= 1'b0;
                    end 
                end
            endcase


        end
    end 
endmodule



