// Program to implement a 4-bit comparator using Verilog

module comparator (A,B, G,E,L);
    input wire [3:0] A, B;
    output reg G, E, L;
    always @(*)
    begin
        if(A>B)
        begin
            G=1; E=0; L=0;
        end
        else if(A==B)
        begin
            G=0; E=1; L=0;
        end
        else
        begin
            G=0; E=0; L=1;
        end
    end
endmodule