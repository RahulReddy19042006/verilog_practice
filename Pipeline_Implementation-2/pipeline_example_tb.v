`timescale 1ns/1ps
`include "pipeline_example.v"

module pipe_test;
    wire [15:0] Z; 
    reg [3:0] rs1, rs2, rd, func;
    reg [7:0] addr;
    reg clk1, clk2;
    integer k;

    pipeline_example dut(.Zout(Z), .rs1(rs1), .rs2(rs2), .rd(rd), .addr(addr), .func(func), .clk1(clk1), .clk2(clk2) );

    // Continuous 2-phase non-overlapping clock generation
    initial begin
        clk1 = 0; clk2 = 0;
        forever begin
            #5 clk1 = 1; #5 clk1 = 0;
            #5 clk2 = 1; #5 clk2 = 0;
        end
    end

    // Initializing register bank values
    initial begin
        for(k = 0; k < 16; k = k + 1) begin
            dut.regbank[k] = k;
        end
    end

    // Test Stimulus Vector Sequences
    initial begin 
        // Inputs change synchronously with a step pattern
        #4  rs1=3;  rs2=5;  rd=10; func=0;  addr=125;
        #20 rs1=3;  rs2=8;  rd=12; func=2;  addr=126;
        #20 rs1=10; rs2=5;  rd=14; func=1;  addr=127;
        #20 rs1=7;  rs2=3;  rd=13; func=11; addr=128;
        #20 rs1=10; rs2=12; rd=15; func=1;  addr=129;
        #20 rs1=12; rs2=13; rd=11; func=0;  addr=130;

        #100;
        for(k = 125; k < 131; k = k + 1) begin
            $display("Mem[%d] = %d", k, dut.mem[k]); // Fixed "men" typo
        end
    end 

    initial begin 
        $dumpfile("pipe.vcd");
        $dumpvars(0, pipe_test);
        $monitor("Time=%3d, Zout=%d", $time, Z);
        #400 $finish;
    end 

endmodule