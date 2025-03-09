// Test bench for 4-bit Fulladder

`timescale 1ps/1ps
module testbench;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;
  integer i;
  
  adder4bit uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout) );

  initial begin
    $dumpfile("adder_output.vcd");
    $dumpvars(0, testbench);

    for(i=0; i < 512; i=i+1) begin    // 1+4+4=9 2^9=512
      {Cin, A, B} = i;                  //cin, A, B = 0 0000 0000 for i=0
      #10;
    end
    $finish;
  end
endmodule