`timescale 1ns/1ps
`include "ring_counter.v"
 module ring_counter_tb;
 parameter N=4;
 reg clk, init; 
 wire [0:N-1]count;
 ring_counter #(.N(N)) uut(clk,init,count);
 initial
 begin
 $dumpfile("ring_counter.vcd");
 $dumpvars(0,ring_counter_tb);
 $monitor($time,"\t count=%b",count);
 clk=0;
 end
 always #5 clk=~clk;
 initial
 begin
 #2 init=1'b1;
 #10 init=1'b0;
 #100 $finish;
 end
endmodule