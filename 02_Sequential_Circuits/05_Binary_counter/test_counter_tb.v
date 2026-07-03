`timescale 1ns/1ps
`include "binary_counter.v"

module test_counter_tb;
parameter N=8;
reg clk=0,clr;
wire [N-1:0]cout;
counter #(.N(N)) uut(.clock(clk),.clear(clr),.count(cout));
initial 
begin
$dumpfile("counter.vcd");
$dumpvars(0,test_counter_tb);
$monitor($time,"\t cout=%d",cout);
end
always #5 clk=~clk;
initial
begin
#2 clr=1'b1;
#7 clr=1'b0;#100 clr=1'b1;
#5 $finish;
end
endmodule
