`timescale 1ns/1ps
`include "generate_adder.v"

module test_generate_adder;
parameter N = 16;

reg  [N-1:0] a, b;
reg  cy_in;
wire [N-1:0] sum;
wire cy_out;

generate_adder #(16) uut (a,b,cy_in,sum,cy_out);

initial
begin
    $dumpfile("generate_adder.vcd");
    $dumpvars(0, test_generate_adder);

    $monitor($time,"\ta=%d b=%d cin=%b => sum=%d cout=%b",a, b, cy_in, sum, cy_out);

    a = 8'd0;   b = 8'd0;   cy_in = 0;
    #5 a = 8'd10;  b = 8'd20;  cy_in = 0;
    #5 a = 8'd50;  b = 8'd25;  cy_in = 1;
    #5 a = 8'd255; b = 8'd1;   cy_in = 0;
    #5 a = 8'd100; b = 8'd100; cy_in = 0;
    #5 a = 8'd200; b = 8'd100; cy_in = 1;

    #5 $finish;
end

endmodule