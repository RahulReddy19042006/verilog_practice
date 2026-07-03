`timescale 1ns/1ps
module muxtest;
reg [15:0]A;
 reg[3:0]B;
 wire F;
mux16to1 M(.in(A),.sel(B),.out(F));
 initial
   begin
    $dumpfile("mux16to1.vcd");
    $dumpvars(0, muxtest);
    $monitor($time,"A=%h,B=%h,F=%b",A,B,F);
     #5 A=16'h301a ; B=4'h0;
     #5 B=4'h1;
     #5 B=4'h6;
     #5 B=4'hc;
  end 
  endmodule