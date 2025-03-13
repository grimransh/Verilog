// Program to implement seven segment display
// this program takes binary as input and display the corresponding decimal number on seven segment display

module Segment(Din, Seg);
  
  input [3:0] Din;
  output reg [6:0] Seg;

  // segment A B C D E F G
  //       __A__
  //      |     |
  //      F     B
  //      |__G__|
  //      |     |
  //      E     C
  //      |__D__|

  // local parameter
  localparam ZERO  = 7'b1111110;
  localparam ONE   = 7'b0110000;
  localparam TWO   = 7'b1101101;
  localparam THREE = 7'b1111001;
  localparam FOUR  = 7'b0110011;
  localparam FIVE  = 7'b1011011;
  localparam SIX   = 7'b1011111;
  localparam SEVEN = 7'b1110000;
  localparam EIGHT = 7'b1111111;
  localparam NINE  = 7'b1111011;
  localparam BLANK = 7'b0000000;

  //  
  always @(*) begin
    case (Din)
      4'd0: Seg = ZERO;
      4'd1: Seg = ONE; 
      4'd2: Seg = TWO;
      4'd3: Seg = THREE;
      4'd4: Seg = FOUR;
      4'd5: Seg = FIVE;
      4'd6: Seg = SIX;
      4'd7: Seg = SEVEN;
      4'd8: Seg = EIGHT;
      4'd9: Seg = NINE;
      
      default: Seg = BLANK;   //For Invalid or out of a Range inputs

    endcase
  end
endmodule
