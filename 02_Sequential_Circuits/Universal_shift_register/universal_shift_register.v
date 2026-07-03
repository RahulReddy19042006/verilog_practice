module universal_shift_register #(parameter N = 4)
(input clk,rst,serial_in_left,serial_in_right,
input [1:0] sel,
input [N-1:0] parallel_in,
output reg [N-1:0] q);

always @(posedge clk or posedge rst)
begin
if(rst)
 q <= 0;
else
begin
 case(sel)
    2'b00: q <= q;                                    // Hold
    2'b01: q <= {q[N-2:0], serial_in_right};          // Shift Left
    2'b10: q <= {serial_in_left, q[N-1:1]};           // Shift Right
    2'b11: q <= parallel_in;                          // Parallel Load
    endcase
end
end
endmodule