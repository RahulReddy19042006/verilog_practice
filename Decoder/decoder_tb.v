`timescale 1ns/1ps
`include "decoder.v"

module decoder_3to8_tb;
reg [2:0] A;
reg EN;
wire [7:0] Y;

decoder_3to8 DUT (.A(A),.EN(EN),.Y(Y));

initial begin
$dumpfile("decoder_3to8.vcd");
 $dumpvars(0, decoder_3to8_tb);
EN = 0; A = 3'b000; #10;
EN = 1; A = 3'b000; #10;
A = 3'b001; #10;
A = 3'b010; #10;
A = 3'b011; #10;
A = 3'b100; #10;
A = 3'b101; #10;
A = 3'b110; #10;
A = 3'b111; #10;
EN = 0; #10;
$finish;
end

initial begin
    $monitor("Time=%0t EN=%b A=%b Y=%b",$time, EN, A, Y);
end

endmodule