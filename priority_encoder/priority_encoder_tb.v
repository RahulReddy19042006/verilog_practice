`timescale 1ns/1ps
`include "priority_encoder.v"

 module encoder_test;
 reg [7:0]in;
 wire [2:0]out;
priority_encoder uut(in,out);
initial 
begin
$dumpfile("priority_encoder.vcd");
$dumpvars(0,encoder_test);
$monitor($time,"\tinput=%b, output_code=%b",in,out);
in=8'd0;
#5 in=8'b00100010;
#5 in=8'b00010001;
#5 in=8'b00011100;
#5 in=8'b00100000;
#5 in=8'b10000000;
#5 $finish;
end
endmodule
