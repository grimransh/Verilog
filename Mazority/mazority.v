// Program to implement a 3-bit majority function using Verilog
module Majority (A, B, C, Y);

input A, B, C;
output Y;

assign  Y = ((A ^ B) & C ) | (A & B);

    
endmodule