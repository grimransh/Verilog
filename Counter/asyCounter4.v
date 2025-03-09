// program to test the Asynchronous counter 4 bit

module asyCounter4(Clk, Rst, Q);

  input Clk, Rst;
  output reg [3:0] Q;

  always @(negedge Clk or posedge Rst) begin
    if(Rst) Q <= 4'b0000;
    else begin
      Q[0] <= ~Q[0];
      Q[1] <= Q[1] ^ Q[0];
      Q[2] <= Q[2] ^ (Q[0] & Q[1]);
      Q[3] <= Q[3] ^ (Q[0] & Q[1] & Q[2]);
    end
  end
endmodule