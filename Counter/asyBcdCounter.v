// program to implement asynchronous BCD counter

module asybcdCounter (
  input Clk, Rst,
  output reg [3:0] Q
);

  always @(posedge Clk or posedge Rst) begin
    if(Rst || Q==9) Q <= 4'b0000;
    else begin
      Q[0] <= ~Q[0];
      Q[1] <= Q[1] ^ Q[0];
      Q[2] <= Q[2] ^ (Q[1] & Q[0]);
      Q[3] <= Q[3] ^ (Q[2] & Q[1] & Q[0]);
    end
  end
    
  
endmodule