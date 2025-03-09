// Program to implement 4-bit adder using 1-bit adder module

module adder(A, B, Cin, Sum, Cout);
  input A,B,Cin;
  output Sum, Cout;

  assign Sum = A ^ B ^ Cin;
  assign Cout = ((A ^ B) & Cin) | (A & B);

endmodule

module adder4bit (
  input [3:0] A, B,
  input Cin,
  output [3:0] Sum,
  output Cout
);
  wire C1, C2, C3;
  adder a1 (A[0], B[0], Cin, Sum[0], C1);
  adder a2 (A[1], B[1], C1, Sum[1], C2);
  adder a3 (A[2], B[2], C2, Sum[2], C3);
  adder a4 (A[3], B[3], C3, Sum[3], Cout);
  
endmodule