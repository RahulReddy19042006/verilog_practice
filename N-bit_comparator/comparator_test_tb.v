`timescale 1ns/1ns
`include "comparator.v"

module compare_tb;
parameter size=16;
reg [size-1:0]A,B;
wire lt,gt,eq;
compare uut(A,B,lt,gt,eq);
initial
begin
$dumpfile("comparator.vcd");
$dumpvars(0,compare_tb);
$monitor($time, "A=%h, B=%h, lt=%b, gt=%b, eq=%b",A,B,lt,gt,eq);
#5 A=16'hA456; B=16'hC2d3;
#5 A=16'hB65C; B=16'hB65C;
#5 A=16'hB577; B=16'h7856;
#5 $finish;
end
endmodule