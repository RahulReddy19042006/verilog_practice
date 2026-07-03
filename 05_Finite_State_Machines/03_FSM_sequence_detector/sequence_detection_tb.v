`timescale 1ns/1ps
`include "sequence_detect.v"
module test_sequence;
reg clk,x,reset;
wire z;
seq_detector dut(x,clk,reset,z);
initial
begin
$dumpfile("sequence_detector.vcd");
$dumpvars(0,test_sequence);
clk=1'b0; reset=1'b1;
#2 reset=1'b0; #2 reset=1'b1;
x=0;#10 x=0;#10 x=1; #10 x=1; #10 x=0; #10 x=0; #10 x=1; #10 $finish;
end
always #5 clk=~clk;

always@(negedge clk)
$display($time,"\tinput=%b, state=%b, output=%b",x,dut.PS,z);
endmodule