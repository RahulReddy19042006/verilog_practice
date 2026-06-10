module ring_counter #(parameter N=8)
(input clk,init,
output reg [0:N-1]count);
always@(negedge clk)
begin
if(init) count <= (1 << (N-1));
else
begin
count<=count>>1;
count[0]<=count[N-1];
/*else  count <= {count[N-1], count[0:N-2]};*/
end
end
endmodule