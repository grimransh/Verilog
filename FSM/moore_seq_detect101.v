// Program to implement a Moore sequence detector
// The sequence to be detected is 101

module mooreFsm101(Clk, Rst, Din, Q);
  
  input Clk, Rst, Din;
  output reg Q;

  // state encoding
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

  reg [1:0] state, next_state;    // state and next state

  // state transition

  always @(posedge Clk or posedge Rst) begin
    if(Rst) state <= s0;
    else state <= next_state;
  end

  // next state logic

  always @(*) begin
    case (state)
      s0: if(Din) next_state = s1;
          else next_state = s0;

      s1: if(!Din) next_state = s2;
          else next_state = s1;

      s2: if(Din) next_state = s3;
          else next_state = s0;

      s3: if(Din) next_state = s1;
          else next_state = s2;

      default: next_state = s0;
    endcase
  end

  // output logic

  always @(*) begin
    if(Rst) Q <= 0;

    else if(state == s3) Q <= 1;
    
    else Q <= 0;
  end


endmodule
