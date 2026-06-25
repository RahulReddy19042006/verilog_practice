`timescale 1ns/1ps
`include "regbank.v"

module regbank_test;
reg [4:0] sr1,sr2,dr;
reg [31:0] wrData;
reg write,reset,clk;
wire [31:0] rdData1,rdData2;
integer k;
regbank Reg(rdData1,rdData2,wrData,sr1,sr2,dr,write,reset,clk);
initial 
begin 
$dumpfile("regbank.vcd");
$dumpvars(0,regbank_test);
clk=0;
#2 reset=1; write=0;
#5 reset=0;
end

always #5 clk=~clk;

initial
begin 
#8
for(k=0;k<32;k=k+1)
begin
write=1;dr=k;wrData=10*k;
#10;
end 
#20 
for(k=0;k<31;k=k+2)
begin 
sr1=k; sr2=k+1;
#2 $display("reg[%d]=%d, reg[%d]=%d",sr1,rdData1,sr2,rdData2);
#1;
end
$finish;
end 
endmodule