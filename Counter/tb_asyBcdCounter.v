// testbecnh for asyBcdCounter

`timescale 1ps/1ps

module testbench;

  reg Clk, Rst;
  wire [3:0] Q;
  
  asybcdCounter uut (.Clk(Clk), .Rst(Rst), .Q(Q));
  
  always #5 Clk = ~Clk;

  initial begin
    $dumpfile("asyBcdCounter.vcd");
    $dumpvars(0, testbench);
    Clk = 0;
    Rst = 1;
    #10;
    Rst = 0;
    #250;
    Rst = 1;
    #10;
    $finish;
  end
  
endmodule