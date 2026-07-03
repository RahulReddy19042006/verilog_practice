`timescale 1ns/1ps
`include "RAM.v"

module RAM_test;
reg  [9:0] address;
reg  [7:0] data_in;
reg  write, select;
wire [7:0] data_out;
integer k, myseed;

ram R(
    .data_out(data_out),
    .data_in(data_in),
    .addr(address),
    .wr(write),
    .cs(select)
);

initial
begin
$dumpfile("RAM.vcd");
$dumpvars(0, RAM_test);

address = 0; data_in = 0; write   = 0; select  = 0; myseed  = 35;
    // WRITE PHASE
    for(k = 0; k < 1024; k = k + 1)
    begin
        address = k;
        data_in = (2*k)%256;
        select = 1; write  = 0;
        #2;
        write  = 1;
        #2 write=0 ; select=0;
        #1;
    end
    // READ PHASE
    repeat(20)
    begin
        address = $unsigned($random(myseed)) % 1024;
        select = 1;  write  = 0;
        #2;
        $display("Time=%0t  Address=%0d  Data=%0d",
                 $time, address, data_out);
        select = 0;
        #2;
    end
#5  $finish;
end
endmodule