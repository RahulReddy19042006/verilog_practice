`timescale 1ns/1ps
`include "udp_mux4to1.v"

 module test_udp;
 reg s0,s1,i0,i1,i2,i3;
 wire f;
 udp_mux4to1 dut(f,s0,s1,i0,i1,i2,i3);
 initial
 begin
 $dumpfile("udp_mux4to1.vcd");
 $dumpvars(0,test_udp);
 $monitor($time," s1=%b s0=%b f=%b",s1,s0,f);

    i0=0; i1=1; i2=0; i3=1;

    s0=0; s1=0; #5;
    s0=0; s1=1; #5;
    s0=1; s1=0; #5;
    s0=1; s1=1; #5;
    $finish;
end
endmodule