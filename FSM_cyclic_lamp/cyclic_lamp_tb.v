`timescale 1ns/1ps
`include "cyclic_lamp.v"

module test_FSM;
reg clk;
wire [2:0]light;
cyclic_lamp dut(clk,light);

initial
begin 
clk=0;
$dumpfile("cyclic_lamp.vcd");
$dumpvars(0,test_FSM);
$monitor($time,"\t RYG:%b",light);
#50 $finish;
end
always #5 clk=~clk;
endmodule