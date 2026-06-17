`timescale 1ns/1ps
`include "ALU_adder.v"

module test_ALU_adder;

reg  [15:0] X, Y;
wire [15:0] Z;
wire sign, carry, parity, zero, overflow;
ALU_adder uut(X,Y,sign,carry,parity,zero,overflow,Z);

initial
begin
    $dumpfile("ALU_adder.vcd");
    $dumpvars(0, test_ALU_adder);

    $monitor($time,
             "\tX=%h, Y=%h, Z=%h ,Carry=%b, Sign=%b, Parity=%b, Zero=%b, Overflow=%b",
             X, Y, Z, carry, sign, parity, zero, overflow);

    X = 16'd10;     Y = 16'd20;
    #10;
    X = 16'hFFFF;   Y = 16'd1;
    #10;
    X = 16'd0;      Y = 16'd0;#10;
    X = 16'h7FFF;   Y = 16'd1;#10;
    X = 16'h8000;   Y = 16'h8000;
    #10;
    X = 16'd1000;   Y = 16'd2000;
    #10;
    $finish;
end
endmodule