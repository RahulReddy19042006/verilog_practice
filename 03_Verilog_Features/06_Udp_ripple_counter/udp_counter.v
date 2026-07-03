module udp_counter(input clk,clr,
                   output [5:0]count);
TFF f0(count[0],clk,clr);
TFF f1(count[1],count[0],clr);
TFF f2(count[2],count[1],clr);
TFF f3(count[3],count[2],clr);
TFF f4(count[4],count[3],clr);
TFF f5(count[5],count[4],clr);
endmodule

primitive TFF(q,clk,clr);
input clk,clr;
output q;
reg q;
table
//clk  clr : q : qnew
  ?     0  : ? : 0;
  ?   (01) : ? : -;
 (10)   1  : 0 : 1;
 (10)   1  : 1 : 0;
 (01)   1  : ? : -;
 endtable
 endprimitive