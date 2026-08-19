module uart_rx #(
    parameter clks_per_bit = 16
)(
    input wire clk,
    input wire rst,
    input wire rx,

    output reg [7:0] data_out,
    output reg data_valid
);

    //====================================================
    // FSM States
    //====================================================
    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    //====================================================
    // Registers
    //====================================================
    reg [1:0] state;

    reg [15:0] clk_count;
    reg [2:0] bit_index;

    reg [7:0] rx_shift;

    //====================================================
    // Receiver FSM
    //====================================================
    always @(posedge clk)
    begin

        //------------------------------------------------
        // Reset
        //------------------------------------------------
        if(rst)
        begin

            state <= IDLE;

            clk_count <= 0;
            bit_index <= 0;

            rx_shift <= 0;

            data_out <= 0;
            data_valid <= 0;

        end

        //------------------------------------------------
        // FSM
        //------------------------------------------------
        else
        begin

            case(state)

                //----------------------------------------
                // IDLE STATE
                //----------------------------------------
                IDLE:
                begin

                    data_valid <= 0;

                    clk_count <= 0;
                    bit_index <= 0;

                    // Detect Start Bit
                    if(rx == 0)
                    begin
                        state <= START;
                    end

                end

                //----------------------------------------
                // START STATE
                //----------------------------------------
                START:
                begin

                    // Wait until middle of start bit
                    if(clk_count < (clks_per_bit/2)-1)
                    begin
                        clk_count <= clk_count + 1;
                    end

                    else
                    begin

                        clk_count <= 0;

                        // Confirm start bit
                        if(rx == 0)
                        begin
                            state <= DATA;
                        end

                        else
                        begin
                            state <= IDLE;
                        end

                    end

                end

                //----------------------------------------
                // DATA STATE
                //----------------------------------------
                DATA:
                begin

                    if(clk_count < clks_per_bit-1)
                    begin
                        clk_count <= clk_count + 1;
                    end

                    else
                    begin

                        clk_count <= 0;

                        // Store received bit
                        rx_shift[bit_index] <= rx;

                        if(bit_index < 7)
                        begin
                            bit_index <= bit_index + 1;
                        end

                        else
                        begin
                            bit_index <= 0;
                            state <= STOP;
                        end

                    end

                end

                //----------------------------------------
                // STOP STATE
                //----------------------------------------
                STOP:
                begin

                    if(clk_count < clks_per_bit-1)
                    begin
                        clk_count <= clk_count + 1;
                    end

                    else
                    begin

                        clk_count <= 0;

                        // Check Stop Bit
                        if(rx == 1'b1)
                        begin
                            data_out <= rx_shift;
                            data_valid <= 1'b1;
                        end

                        state <= IDLE;

                    end

                end

                //----------------------------------------
                // DEFAULT
                //----------------------------------------
                default:
                begin
                    state <= IDLE;
                end

            endcase

        end

    end

endmodule