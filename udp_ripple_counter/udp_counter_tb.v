`timescale 1ns/1ps
`include "udp_counter.v"

module test_udp_counter;
reg clk,clr;
wire [5:0]count;
udp_counter uut(.clk(clk),.clr(clr),.count(count));
initial 
begin
$dumpfile("udp_counter.vcd");
$dumpvars(0,test_udp_counter);
clr=1'b0;
clk=1'b0;
#7 clr=1'b1;#200 $finish;
end 
always #5 clk=~clk;
always@(negedge clk)
begin
$display($time,"\tcount=%b=%d",count,count);
end
endmodule