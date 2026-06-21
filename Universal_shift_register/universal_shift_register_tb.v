`timescale 1ns/1ps
`include "universal_shift_register.v"

module universal_shift_register_tb;

parameter N = 4;
reg clk, rst, serial_in_left, serial_in_right; 
reg [1:0] sel;
reg [N-1:0] parallel_in;
wire [N-1:0] q;

universal_shift_register #(N) DUT ( .clk(clk),.rst(rst), .sel(sel),.serial_in_left(serial_in_left),.serial_in_right(serial_in_right),.parallel_in(parallel_in),.q(q)
);

always #5 clk = ~clk;
initial
begin
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, universal_shift_register_tb);
    clk = 0;rst = 1;sel = 0;serial_in_left = 0;serial_in_right = 0;parallel_in = 0;

    #10 rst = 0;
    // Parallel Load
    sel = 2'b11;
    parallel_in = 4'b1010;
    #10;
    // Hold
    sel = 2'b00;
    #10;
    // Shift Left
    sel = 2'b01;
    serial_in_right = 1;
    #20;
    // Shift Right
    sel = 2'b10;
    serial_in_left = 0;
    #20;
    $finish;
end

initial
begin
    $monitor("Time=%0t sel=%b q=%b",$time, sel, q);
end
endmodule