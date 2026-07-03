`timescale 1ns/1ns
`include "modelling mux16to1.v"

 module mux16to1_test;
 reg [15:0] A; reg [3:0]S; wire F;
 mux16to1 M(.in(A),.sel(S),.out(F));
 initial
 begin 
 $dumpfile("mux16to1.vcd");
 $dumpvars(0,mux16to1_test);
 $monitor($time,"A=%H, S=%H, F=%B",A,S,F);

 #5 A=16'h301a ; S=4'h0;
     #5 S=4'h1;
     #5 S=4'h6;
     #5 S=4'hc;
     #5 $finish;
  end 
  endmodule