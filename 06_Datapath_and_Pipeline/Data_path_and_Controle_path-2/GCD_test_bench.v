`timescale 1ns/1ps
`include "GCD_datapath.v"
`include "GCD_controlepath.v"

module GCD_test;
reg clk,reset,start;
reg [15:0] data_in;
wire lt,gt,eq,ldA,ldB,sel1,sel2,sel_in,done;

GCD_datapath DP(lt,gt,eq,ldA,ldB,sel1,sel2,sel_in,clk,data_in);
GCD_controller CN(lt,gt,eq,clk,start,reset,ldA,ldB,sel1,sel2,sel_in,done);

initial
begin
    $dumpfile("GCD.vcd");
    $dumpvars(0,GCD_test);
    clk= 1'b1; reset= 1'b0; start= 1'b0;
    //reset
    #2 reset = 1'b1;
    #2 reset = 1'b0; 
    //start
    start = 1'b1;
    // Number A = 24
    data_in = 24;
    //Number B
    #18 data_in = 18;
end

always #5 clk = ~clk;

// Monitor
always @(negedge clk)
    $display( "t=%0d PS=%0d A=%0d B=%0d lt=%b gt=%b eq=%b done=%b",$time,CN.PS, DP.A_out, DP.B_out, lt,gt,eq, done);
endmodule