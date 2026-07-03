module shift_register #(parameter N=4)
(input clk,clr,in,
output reg out);
reg [N-2:0]t;
integer i;
always@(posedge clk,negedge clr)
begin
if(!clr) 
begin
for(i=0;i<N-1;i=i+1)
t[i]<=1'b0;
out<=1'b0;
end
else
begin
out<=t[N-2];
for(i=N-2;i>0;i=i-1)
t[i]<=t[i-1];
t[0]<=in;
end
end
endmodule