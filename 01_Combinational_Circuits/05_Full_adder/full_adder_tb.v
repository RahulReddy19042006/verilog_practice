`timescale 1ns/1ps

module full_adder_tb;

    reg A, B, Cin;
    wire Sum, Cout;

    // Instantiate the Full Adder
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Dump file for waveform
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        // Test all input combinations
        A=0; B=0; Cin=0; #10;
        A=0; B=0; Cin=1; #10;
        A=0; B=1; Cin=0; #10;
        A=0; B=1; Cin=1; #10;
        A=1; B=0; Cin=0; #10;
        A=1; B=0; Cin=1; #10;
        A=1; B=1; Cin=0; #10;
        A=1; B=1; Cin=1; #10;

        $finish;
    end

endmodule