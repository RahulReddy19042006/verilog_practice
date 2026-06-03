//N-bit comparator behaviral modelling
module compare(A,B,lt,gt,eq);
  parameter size=16;
  input [size-1:0]A,B;
  output reg lt,gt,eq;
always@(*)
begin
lt=0; gt=0; eq=0;
if(A>B) gt=1;
else if(A<B) lt=1;
else eq=1;
end
endmodule

/*Another way
module compare(A,B,lt,gt,eq);

parameter size = 16;

input  [size-1:0] A,B;
output lt,gt,eq;

assign gt = (A > B);
assign lt = (A < B);
assign eq = (A == B);

endmodule*/