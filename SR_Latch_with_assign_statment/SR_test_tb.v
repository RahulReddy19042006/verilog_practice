`timescale 1ns/1ns

module SR_test_tb;

reg S, R;
wire Q, Qbar;

SRlatch LAT(Q, Qbar, S, R);

initial begin
    $dumpfile("SRLATCH.vcd");
    $dumpvars(0, SR_test_tb);

    $monitor($time,
             " S=%b, R=%b, Q=%b, Qbar=%b",
             S, R, Q, Qbar);

    S = 1'b0; R = 1'b1;
    #2 S = 1'b1; R = 1'b0;
    #2 S = 1'b1; R = 1'b1;
    #2 S = 1'b0; R = 1'b0;
    #2 $finish;
end

endmodule