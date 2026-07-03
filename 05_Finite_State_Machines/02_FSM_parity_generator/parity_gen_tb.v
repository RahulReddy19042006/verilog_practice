`timescale 1ns/1ps
`include "parity_gen.v"

module test_FSM_parity;
reg clk,x;
wire z;
parity_gen dut(x,clk,z);
initial 
begin
$dumpfile("parity_gen.vcd");
$dumpvars(0,test_FSM_parity);
$monitor("time=%d, input=%b,parity_bit=%b, state=%b",$time,x,z,dut.even_odd);
x=0; clk=0;
#10 x=1;
#10 x=1; #10 x=0;
#10 x=1; #10 x=0;
#10 x=0;
#10 $finish;
end 
always #5 clk=~clk;
endmodule 
