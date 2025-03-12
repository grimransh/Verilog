// Program to create Simple ALU

// Opcode        Operation       Function
// 000           Y <= A          A
// 001           Y <= A + B      Add
// 010           Y <= A - B      Subtract
// 011           Y <= A AND B    AND
// 100           Y <= A OR B     OR
// 101           Y  <= A + 1     Increment A
// 110           Y <= A - 1      Decrement A
// 111           Y <= B          B



module simpleALU (A, B, Opcode, Y);

  input [31:0] A, B;
  input [2:0] Opcode;
  output reg [31:0] Y;

  always @(*) begin
    case (Opcode)
      3'd0: Y = A;
      3'd1: Y = A + B;
      3'd2: Y = A - B;
      3'd3: Y = A & B;
      3'd4: Y = A | B;
      3'd5: Y = A + 1;
      3'd6: Y = A - 1;
      3'd7: Y = B;
    endcase
  end
endmodule