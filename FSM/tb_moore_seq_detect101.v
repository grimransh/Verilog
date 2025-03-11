// testbench for  Moore sequence detector of 101

`timescale 1ps/1ps
module testbench;

  reg Clk, Rst, Din;
  wire Q;

  mooreFsm101 uut(.Clk(Clk), .Rst(Rst), .Din(Din), .Q(Q));

  always #5 Clk = ~Clk;

  initial begin
    $dumpfile("moore_seq_detect.vcd");
    $dumpvars(0,testbench);

    // Initialize Inputs
    Clk = 0; Rst = 1; Din = 0;
    #5;

    Rst = 0;
    
    // Apply input sequence
    repeat(50) begin
      #10 Din = $random % 2;
    end
    
    #10;
    Rst = 1;

    $finish;
  end
endmodule