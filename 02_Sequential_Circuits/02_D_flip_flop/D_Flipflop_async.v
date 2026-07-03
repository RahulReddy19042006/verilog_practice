//D flip flop with asynchronous set and reset
module dff(q,qbar,d,set,reset,clk);
input d,set,reset,clk;
output reg q;
output qbar;
assign qbar=~q;
always@(posedge clk,negedge set,negedge reset)
begin
if(reset==0) q<=0;
else if(set==0) q<=1;
else q<=d;
end
endmodule