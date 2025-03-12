/*
   FIFO Memory Design (8-depth, 9-bit wide)

   - This is a First-In, First-Out (FIFO) memory with 8 storage locations.
   - Each location stores 9-bit data.

   Operations:
   - Write: When 'write' is active, store data at the location indicated by WrPtr.
   - Read: When 'read' is active, output data from the location indicated by RdPtr.
   - High Impedance: If 'read' is inactive, output should be high impedance (Z).

   Pointer Controls:
   - WrInc: Increments the write pointer (WrPtr) to the next location.
   - RdInc: Increments the read pointer (RdPtr) to the next location.
   - WrPtrClr: Resets WrPtr to the first location.
   - RdPtrClr: Resets RdPtr to the first location.

   Notes:
   - No full or empty status indicators are implemented.
   - Write and read pointers wrap around after reaching the last location.
*/

module FIFO (
  input Clk, Rst, Write, Read, WrInc, RdInc, WrPtrClr, RdPtrClr,
  input [8:0] DataIn,
  output reg [8:0] DataOut
);

  //9-bit wide, 8 depth FIFO memory
  reg [8:0] fifo [7:0];
  
  reg [2:0] WrPtr = 3'b000, RdPtr = 3'b000;     //log_2(9) = 3

  always @(posedge Clk or posedge Rst) begin
    // initial pointer
    if (Rst) begin
      WrPtr <= 3'd0;
      RdPtr <= 3'd0;
    end

    else begin
      // clear read and write pointer
      if (RdPtrClr) RdPtr <= 3'd0;
      if (WrPtrClr) WrPtr <= 3'd0;

      // write operation
      if (Write) fifo[WrPtr] <= DataIn;

      // read operation
      if (Read) DataOut <= fifo[RdPtr];
      else DataOut <= 9'bz;

      // increment of read write pointer
      if (WrInc) WrPtr <= WrPtr + 1;
      if (RdInc) RdPtr <= RdPtr + 1;
    end
  end

endmodule