// testbench for Majority module

`timescale 1ps/1ps  
module testbench;
  reg A, B, C;
  wire Y;
  Majority uut( 
    .A(A), .B(B), .C(C), .Y(Y)
  );

  initial begin
    $dumpfile("Mazority_output.vcd");
    $dumpvars(0, testbench);

    // Test Cases for 0 Majority
    A=0; B=0; C=0; #10;
    A=0; B=0; C=1; #10;
    A=0; B=1; C=0; #10;
    A=1; B=0; C=0; #10;

    // Test Cases for 1 Majority
    A=0; B=1; C=1; #10;
    A=1; B=0; C=1; #10;
    A=1; B=1; C=0; #10;
    A=1; B=1; C=1; #10;

    $finish;
  end

endmodule