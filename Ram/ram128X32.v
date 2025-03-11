// Program to create RAM of 4K 

module ram128x32(Clk, Write_enable, Add, Data, Q);

  parameter add_width = 8;
  parameter data_width = 32;

  input Clk;
  input Write_enable;
  input [add_width - 1 : 0] Add;
  input [data_width - 1 : 0] Data;
  output reg [data_width - 1 : 0] Q;

  // memory 2D array
  reg [data_width - 1 : 0] ram [2 ** add_width - 1 : 0]; 

  // write operation
  always @(posedge Clk) begin
    if(Write_enable) ram[Add] <= Data;
  end

  // // read operation
  always @(*) begin
    Q = ram[Add];
  end

endmodule