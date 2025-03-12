

`timescale 1ps/1ps
module testbench;

  reg Clk, Rst, Write, Read, WrInc, RdInc, WrPtrClr, RdPtrClr;
  reg [8:0] DataIn;
  wire [8:0] DataOut;

  FIFO uut (
    .Clk(Clk), 
    .Rst(Rst), 
    .Write(Write), 
    .Read(Read), 
    .WrInc(WrInc), 
    .RdInc(RdInc), 
    .WrPtrClr(WrPtrClr), 
    .RdPtrClr(RdPtrClr), 
    .DataIn(DataIn), 
    .DataOut(DataOut)
  );

  always #5 Clk = ~Clk;

  initial begin
    $dumpfile("fifoMemory.vcd");
    $dumpvars(0,testbench);

    // initial
    Clk = 0;
    Rst = 1;
    Write = 0; 
    Read = 0;
    WrInc = 0; 
    RdInc = 0; 
    WrPtrClr = 0; 
    RdPtrClr = 0;
    DataIn = 9'b0;      //let data in is 0
    #15;

    // reset fifo
    Rst = 0;
    WrPtrClr = 1; 
    RdPtrClr = 1;
    #10;
    WrPtrClr = 0; 
    RdPtrClr = 0;
    #10

    // enter 4 values
    repeat(4)begin
      DataIn = DataIn + 2;
      Write = 1;
      WrInc = 1;
      #10;
      Write = 0;
      WrInc = 0;
      #10;
    end
    
    // read 4 values from fifo
    repeat(4) begin
      Read = 1;
      RdInc = 1;
      #10;
      Read = 0;
      RdInc = 0;
      #10;
    end

    // reset read pinter and read again
    RdPtrClr = 1;
    #10;
    RdPtrClr = 0;
    Read = 1;
    #10;
    Read = 0;
    #20;
    $finish;
  end
endmodule