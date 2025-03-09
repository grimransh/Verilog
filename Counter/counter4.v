// Program to implement 4-bit counter

module counter4 (Clk, Rst, Q);
  input Clk, Rst;
  output reg [3:0] Q;

  always @(posedge Clk or posedge Rst)
    if(Rst) Q <= 4'b0000;
    else Q <= Q + 1;
    
endmodule