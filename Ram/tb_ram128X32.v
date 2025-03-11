// testbench for ram128X32.v

`timescale 1ps/1ps
module testbench;
  parameter add_width = 8;
  parameter data_width = 32;

  reg Clk, Write_enable;
  reg [add_width - 1 : 0] Add;
  reg [data_width - 1 : 0] Data;
  wire [data_width - 1 : 0] Q;

  ram128x32 uut(.Clk(Clk), .Write_enable(Write_enable), .Add(Add), .Data(Data), .Q(Q));

  always #5 Clk = ~Clk;        //to generate clock signal

  initial begin
    $dumpfile("ram128X32.vcd");
    $dumpvars(0,testbench);

    Clk = 0;
    Write_enable = 0;
    Add = 0;
    Data = 0;
    #5;

    Write_enable = 1;
    Add = 7'd0;     Data = 32'd1;        #10;
    Add = 7'd10;    Data = 32'd10;       #10; 
    Add = 7'd20;    Data = 32'd220;      #10;
    Add = 7'd50;    Data = 32'd5550;     #10;
    Add = 7'd100;   Data = 32'hFFAC0780; #10;
    Add = 7'd127;   Data = 32'hFFFFFFFF; #10;
    Write_enable = 0; #10;

    Add = 7'd0;     #10;
    Add = 7'd10;    #10; 
    Add = 7'd20;    #10;
    Add = 7'd50;    #10; 
    Add = 7'd100;   #10;
    Add = 7'd127;   #10;

    $finish;
  end

endmodule