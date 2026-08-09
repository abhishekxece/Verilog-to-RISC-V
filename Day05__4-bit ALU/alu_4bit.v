module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALU_Sel,

    output reg [3:0] Y,
    output reg       Carry
);

always @(*) begin

    Y = 4'b0000;
    Carry = 1'b0;

    case (ALU_Sel)

        
        
        3'b000: begin
            {Carry, Y} = A + B;
        end

        // 001: Subtraction
        3'b001: begin
            Y = A - B;
        end

        // 010: AND
        3'b010: begin
            Y = A & B;
        end

        // 011: OR
        3'b011: begin
            Y = A | B;
        end

        // 100: XOR
        3'b100: begin
            Y = A ^ B;
        end

        // 101: NOT A
        3'b101: begin
            Y = ~A;
        end

        // 110: Left Shift
        3'b110: begin
            Y = A << 1;
        end

        // 111: Right Shift
        3'b111: begin
            Y = A >> 1;
        end

        // Default case
        default: begin
            Y = 4'b0000;
            Carry = 1'b0;
        end

    endcase

end

endmodule