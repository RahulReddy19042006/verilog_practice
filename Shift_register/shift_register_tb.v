`timescale 1ns/1ps
`include "shift_register.v"

module shift_register_tb;
reg clk,clr,in;
wire out;
shift_register SR(.clk(clk),.clr(clr),.in(in),.out(out));
initial
begin
$dumpfile("shift_register.vcd");
$dumpvars(0,shift_register_tb);
$dumpvars(0,SR);
$monitor($time,"\tclk=%b , in=%b , t=%b , out=%b",clk,in,SR.t,out);
clk=1'b0; in=1'b0; #2clr=0; #2clr=1;
end
always #5 clk=~clk;
initial
begin
#2;
repeat(2)
begin
#10 in=1; #10 in=0; #10 in=1;
end
#2 $finish;
end
endmodule