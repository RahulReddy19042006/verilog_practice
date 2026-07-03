`timescale 1ns/1ps
//`include "D_Flipflop_async.v"
`include "D_Flipflop_sync.v"

module test_Dflip_tb;
wire Q,Qbar;
reg D,set,reset,clk;
integer myseed;
dff uut(Q,Qbar,D,set,reset,clk);
initial
begin
$dumpfile("D_Flipflop_async.vcd");
$dumpvars(0,test_Dflip_tb);
$monitor($time,"\tclk=%d, D=%b, Q=%b, Qbar=%b",clk,D,Q,Qbar);
clk=1'b0; myseed=15; D=1'b0; #1 set=1'b0; #1 reset=1'b0; set=1'b1; #1 reset=1'b1;
#50 $finish;
end
always #5 clk=~clk;
initial 
begin
#2;
repeat(3)
#10 D=$random(myseed);
end
endmodule
