`timescale 1ns/1ps
`include "udp_full_adder.v"
 module test_udp_fulladder;
 reg a,b,cin;
 wire sum,cout;
 integer i;
 full_adder dut(sum,cout,a,b,cin);
 initial
 begin
 $dumpfile("udp_full_adder.vcd");
 $dumpvars(0,test_udp_fulladder);
 for(i=0;i<8;i=i+1)
 begin
 {a,b,cin}=i;#5;
 $display($time,"\ta=%b, b=%b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
 end
 #5 $finish;
 end
 endmodule

