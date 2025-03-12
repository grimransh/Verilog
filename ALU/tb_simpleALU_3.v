`timescale 1ps/1ps  

module testbench;

  reg [31:0] A, B;
  reg [2:0] Opcode;
  wire [31:0] Y;

  simpleALU uut (.A(A), .B(B), .Opcode(Opcode), .Y(Y));

  // always #5 Clk = ~Clk;

  initial begin
    $dumpfile("simpleALU_3.vcd");
    $dumpvars(0,testbench);
    
    A=32'hx; B=32'hx; Opcode=32'hx;
    #5;

    A = 32'hFFAC078;
    B = 32'hF42FAB2;
    Opcode = 3'd0;
    #10;
    Opcode = 3'd1;
    #10;
    Opcode = 3'd2;
    #10;
    Opcode = 3'd3;
    #10;
    Opcode = 3'd4;
    #10;
    Opcode = 3'd5;
    #10;
    Opcode = 3'd6;
    #10;
    Opcode = 3'd7;
    #10;

    A=32'hx; B=32'hx; Opcode=32'hx;
    #5;

    $finish;
        
  end

endmodule