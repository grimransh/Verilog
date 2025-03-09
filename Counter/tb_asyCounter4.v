// testbench for asyCounter4

`timescale 1ps/1ps

module testbench;
  reg Clk,Rst;
  wire [3:0] Q;

  asyCounter4 uut (.Clk(Clk), .Rst(Rst), .Q(Q));

  always #5 Clk = ~Clk;        //to generate clock signal

  initial begin
    $dumpfile("asyCounter4.vcd");
    $dumpvars(0,testbench);
    Clk = 0;
    Rst = 1;
    #10;
    Rst = 0;
    #1000;
    Rst = 1;
    #10;
    $finish;
  end
  
endmodule