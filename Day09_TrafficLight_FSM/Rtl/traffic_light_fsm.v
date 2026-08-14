module traffic_light_fsm #(
    parameter RED_TIME    = 5,
    parameter GREEN_TIME  = 5,
    parameter YELLOW_TIME = 2
)(
    input  wire clk,
    input  wire reset,

    output reg red,
    output reg yellow,
    output reg green
);

    //============================================================
    // State Encoding
    //============================================================

    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    //============================================================
    // State Registers
    //============================================================

    reg [1:0] current_state;
    reg [1:0] next_state;

    //============================================================
    // Timer
    //============================================================

    reg [3:0] counter;

    //============================================================
    // State Register
    //============================================================

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            current_state <= RED;
        end

        else begin
            current_state <= next_state;
        end

    end

    //============================================================
    // Next-State Logic
    //============================================================

    always @(*) begin

        next_state = current_state;

        case (current_state)

            RED: begin
                if (counter >= RED_TIME - 1)
                    next_state = GREEN;
            end

            GREEN: begin
                if (counter >= GREEN_TIME - 1)
                    next_state = YELLOW;
            end

            YELLOW: begin
                if (counter >= YELLOW_TIME - 1)
                    next_state = RED;
            end

            default: begin
                next_state = RED;
            end

        endcase

    end

    //============================================================
    // Counter Logic
    //============================================================

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            counter <= 0;
        end

        else begin

            if (current_state != next_state)
                counter <= 0;

            else
                counter <= counter + 1'b1;

        end

    end

    //============================================================
    // Output Logic
    //============================================================

    always @(*) begin

        // Default outputs
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;

        case (current_state)

            RED: begin
                red = 1'b1;
            end

            GREEN: begin
                green = 1'b1;
            end

            YELLOW: begin
                yellow = 1'b1;
            end

            default: begin
                red = 1'b1;
            end

        endcase

    end

endmodule