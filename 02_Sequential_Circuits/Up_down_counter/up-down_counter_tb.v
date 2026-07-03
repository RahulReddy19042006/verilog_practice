`timescale 1ns/1ps
`include "Up-Down_Counter.v"

module up_down_counter_tb;
parameter N = 8;
reg clk,rst,mode;
wire [N-1:0] count;

n_bit_up_down_counter #(N) DUT (.clk(clk),.rst(rst),.mode(mode),.count(count));

initial begin
$dumpfile("Up-Down_Counter.vcd");
$dumpvars(0,up_down_counter_tb);
clk = 0;rst = 1;mode = 1;
#10 rst = 0;
#80;
mode = 0;
#80;
$finish;
end

always #5 clk = ~clk;

initial begin
$monitor("Time=%0t mode=%b count=%d",$time, mode, count);
end

endmodule