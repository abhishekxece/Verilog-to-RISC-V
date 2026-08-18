module sequence_detector (
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg  detected
);

    // State declaration
    reg [1:0] state;
    reg [1:0] next_state;

    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state and output logic
    always @(*) begin

        // Default values
        next_state = S0;
        detected = 1'b0;

        case (state)

            // Nothing matched
            S0: begin
                if (din == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
            end

            // Received "1"
            S1: begin
                if (din == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
            end

            // Received "10"
            S2: begin
                if (din == 1'b1)
                    next_state = S3;
                else
                    next_state = S0;
            end

            // Received "101"
            S3: begin
                if (din == 1'b1) begin
                    next_state = S1;
                    detected = 1'b1;
                end
                else begin
                    next_state = S2;
                end
            end

            default: begin
                next_state = S0;
                detected = 1'b0;
            end

        endcase
    end

endmodule