// Program to test the counter4 module

module testbench;
  reg Clk,Rst;
  wire [3:0] Q;

  counter4 uut (.Clk(Clk), .Rst(Rst), .Q(Q));

  always
    #5 Clk = ~Clk;        //to generate clock signal
      

  initial begin
    $dumpfile("counter4.vcd");
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