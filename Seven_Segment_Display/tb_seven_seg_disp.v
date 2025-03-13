// Testbench for seven segment display

`timescale 1ps/1ps  
module testbench;

  reg [3:0] Din;
  wire [6:0] Seg;

  Segment uut(.Din(Din), .Seg(Seg));

  initial begin
    $dumpfile("seven_seg_disp.vcd");
    $dumpvars(0,testbench);

    // initialize
    Din = 4'bx;
    #10;

    // test cases
    Din = 4'd0; #10; 
    Din = 4'd1; #10;
    Din = 4'd2; #10;
    Din = 4'd4; #10;
    Din = 4'd3; #10;
    Din = 4'd5; #10;
    Din = 4'd6; #10;
    Din = 4'd7; #10;
    Din = 4'd8; #10;
    Din = 4'd9; #10;

    // invalid input
    Din = 4'd10; #10;
    Din = 4'bx; #3;

    $finish;
  end
endmodule