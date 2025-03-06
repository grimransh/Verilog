`timescale 1ps/1ps
module testbench;
    reg[3:0] A,B;
    wire G,E,L;

    comparator uut(                       //uut is the instance name <unit under test>
        .A(A), .B(B), .G(G), .E(E), .L(L)
    );
    initial begin
        $dumpfile("comparator_output.vcd");
        $dumpvars(0, testbench);

        // Test Cases

        // 1. A < B Cases
        A = 4'b0000; B = 4'b0001; #10;
        A = 4'b0010; B = 4'b1000; #10;
        A = 4'b0100; B = 4'b1100; #10;

        // 2. A > B Cases
        A = 4'b1000; B = 4'b0110; #10;
        A = 4'b1101; B = 4'b1010; #10;
        A = 4'b1111; B = 4'b0111; #10;

        // 3. A == B Cases
        A = 4'b0000; B = 4'b0000; #10;
        A = 4'b0101; B = 4'b0101; #10;
        A = 4'b1111; B = 4'b1111; #10;

        // 4. Edge Cases
        A = 4'b0000; B = 4'b1111; #10;  // Min vs Max
        A = 4'b1111; B = 4'b0000; #10;  // Max vs Min

        $finish;
    end
    
endmodule