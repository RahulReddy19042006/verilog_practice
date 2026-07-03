module n_bit_up_down_counter #(parameter N = 4)
(input clk,rst,mode,   // 1 = UP, 0 = DOWN
output reg [N-1:0] count
);
always @(posedge clk or posedge rst) begin
if (rst)
    count <= 0;
else if (mode)
    count <= count + 1;
else
    count <= count - 1;
end
endmodule