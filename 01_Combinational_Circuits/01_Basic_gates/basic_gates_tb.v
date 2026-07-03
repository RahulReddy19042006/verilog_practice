`timescale 1ns/1ns

module basic_gates_tb;

reg a, b;
wire y;

// Instantiate the design
and_gate uut1 (.a(a), .b(b), .y(y));
//or_gate uut2 (.a(a), .b(b), .y(y));
//nand_gate uut3 (.a(a), .b(b), .y(y));
//nor_gate uut4 (.a(a), .b(b), .y(y));
//not_gate uut5 (.a(a), .y(y));

initial begin
    $dumpfile("basic_gates_wave.vcd");   // waveform file
    $dumpvars(0, basic_gates_tb);
    $monitor("Time=%t  a=%b b=%b y=%b", $time, a,b,y);
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
end

endmodule