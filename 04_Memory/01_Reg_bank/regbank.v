//32X32 register file(Behavioral way) with 2 read and 1 write ports
module regbank(rdData1,rdData2,wrData,sr1,sr2,dr,write,reset,clk);
input clk,write,reset;
input [4:0]sr1,sr2,dr;
input [31:0]wrData;
output [31:0] rdData1, rdData2;
integer k;
reg [31:0] regfile [0:31];
//READ
assign rdData1=regfile[sr1];
assign rdData2=regfile[sr2];
//Write
always@(posedge clk)
begin 
if(reset) begin 
for(k=0;k<32;k=k+1)
 regfile[k]=32'd0;
end 
else begin
if (write) regfile[dr]<=wrData;
end 
end 
endmodule 
