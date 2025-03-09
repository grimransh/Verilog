// Program to implement decade counter

module bcd_counter(Clk, Rst, Q);

  input Clk, Rst;
  output reg [3:0] Q;

  always @(posedge Clk or posedge Rst) begin
    if(Rst) Q <= 4'b0000;
    else if(Q == 4'b1001) Q <= 4'b0000;
    else Q <= Q + 1;
  end
endmodule