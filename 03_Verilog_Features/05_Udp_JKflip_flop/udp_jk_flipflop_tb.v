`timescale 1ns/1ps
`include "udp_jk_flipflop.v"
 module test_udp;
 reg j,k,clk,clr;
 wire Q;
 JKFF uut(.j(j),.k(k),.q(Q),.clk(clk),.clr(clr));
 initial 
 begin
 $dumpfile("udp_jk_flipflop.vcd");
 $dumpvars(0,test_udp);
  j = 0; k = 0; clk = 1; clr = 1;
#6 clr = 0;
#2 j = 0; k = 0;
 #10 j = 0; k = 1;
#10 j = 1; k = 0;
#10 j = 1; k = 1;
#10 $finish;
end
always #5 clk = ~clk;
always @(negedge clk)
begin
 $display($time,
             "\tJ=%b K=%b Q=%b",
             j,k,Q);
end
endmodule

