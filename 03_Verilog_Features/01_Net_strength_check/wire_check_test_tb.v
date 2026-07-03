`timescale 1ns/1ns
`include "wire_strong_weak_check.v"

module wire_check_test_tb;

wire_strong_weak_check uut();

initial begin
    $dumpfile("nets_check_test.vcd");
    $dumpvars(0, wire_check_test_tb);
end

endmodule