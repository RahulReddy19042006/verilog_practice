`timescale 1ns/1ps
`include "bcd_to_7seg.v"

module test_bcd_to_7seg;
reg [3:0]bcd;
wire [6:0]seg;
bcd_to_7seg dut(bcd,seg);
initial
begin
$dumpfile("bcd_to_7seg.vcd");
$dumpvars(0,test_bcd_to_7seg);
$monitor($time,"\tbcd_code=%b , 7segment_display=%b",bcd,seg);
bcd=4'b0000;
#5 bcd=4'b0010;
#5 bcd=4'b0111;
#5 bcd=4'b1111;
#5 bcd=4'b0110;
#5 $finish;
end
endmodule