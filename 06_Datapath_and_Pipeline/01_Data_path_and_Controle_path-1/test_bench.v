`timescale 1ns/1ps
`include "datapath.v"
`include "controle_path.v"

module MUL_test;
reg [15:0] data_in;
reg clk,start,reset;
wire done,ldA, ldB, ldP, clrP, decB,eqz;

MUL_datapath dut_DP(eqz,ldA,ldB,ldP,clrP,decB,clk,data_in);
MUL_controller dut_CN(clk,reset,start,eqz,ldA,ldB,ldP,clrP,decB,done);

initial
begin 
$dumpfile("MUL.vcd");
$dumpvars(0,MUL_test);
clk=1'b1; reset=1'b0;start=1'b0;
#2 reset=1'b1; 
#2 reset=1'b0;
start=1'b1;
data_in=17;
#10 data_in=6;
end 
always #5 clk=~clk;
always @(negedge clk)
begin
    $display("t=%0d PS=%0d ldA=%b ldB=%b ldP=%b clrP=%b decB=%b Product=%0d Done=%b",$time,dut_CN.PS,
             ldA, ldB, ldP, clrP, decB,dut_DP.P_out,done);
end
endmodule
