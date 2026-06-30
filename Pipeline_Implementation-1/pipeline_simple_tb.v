`timescale 1ns/1ps
`include "pipeline_simple_example.v"

module pipe_test;
parameter N=16;
wire[N-1:0]F;
reg [N-1:0] A,B,C,D;
reg clk; 

pipe_simple #(.N(N)) dut(.F(F),.A(A),.B(B),.C(C),.D(D),.clk(clk));
initial
begin 
$dumpfile("pipeline_simple.vcd");
$dumpvars(0,pipe_test);
clk=0;A = 0;B = 0;C = 0;D = 0;
end 
always #10 clk=~clk;
initial 
begin 
#5 A=10;B=12;C=5;D=3;
#20 A=10;B=10;C=8;D=2;
#20 A=1;B=1;C=4;D=9;
#20 A=4;B=5;C=10;D=8;
#100 $finish;
end 
always@(negedge clk)
$display("Time=%t, F=%d",$time,F);

endmodule
