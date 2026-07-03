`timescale 1ns/1ns
module arithmetic_gates_tb;
reg A, B;
wire Y;

// Instantiate the XOR gate
xor_gate uut1 (.A(A),.B(B),.Y(Y));
//xnor_gate uut2 (.A(A),.B(B),.Y(Y));
initial begin
// Dump file for waveform
$dumpfile("arithmetic_gates.vcd");
$dumpvars(0, arithmetic_gates_tb);
$monitor("Time=%t A=%b B=%b Y=%b", $time, A, B, Y);

A = 0; B = 0; #10;
A = 0; B = 1; #10;
A = 1; B = 0; #10;
A = 1; B = 1; #10;
$finish;
end
endmodule