// testbench for traffic light controller

`timescale 1ps/1ps
module testbench;

  reg Clk, Rst, Main_Special, Side_Special;
  wire [2:0] Main_light, Side_light;

  traffic_light uut(
    .Clk(Clk), 
    .Rst(Rst), 
    .Main_Special(Main_Special), 
    .Side_Special(Side_Special), 
    .Main_light(Main_light), 
    .Side_light(Side_light)
    );

    always #5 Clk = ~Clk;   // clock generation

    initial begin
      
      $dumpfile("trafic_light_controller.vcd");
      $dumpvars(0, testbench);


      // initialize inputs
      Clk = 0;
      Rst = 1;
      Main_Special = 0;
      Side_Special = 0;
      #15;

      // normal operation
      Rst = 0;
      #50;

      // test case for side special vehicle
      Side_Special = 1;
      #34;
      Side_Special = 0;
      #10;

      // normal operation
      #2560;

      // test case for main special vehicle
      Main_Special = 1;
      #15;
      Main_Special = 0;
      #10;

      // normal operation
      #250;
      
      $finish;
    end


endmodule