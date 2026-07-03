// full adder using udp
module full_adder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;
udp_sum Sum(sum,a,b,cin);
udp_carry cy(cout,a,b,cin);
endmodule

primitive udp_carry(cout,a,b,cin);
output cout;
input a,b,cin;
table
// a b cin: cout
   0 0 ?  : 0;
   0 ? 0  : 0;
   ? 0 0  : 0;
   1 1 ?  : 1;
   1 ? 1  : 1;
   ? 1 1  : 1;
endtable
endprimitive

primitive udp_sum(sum,a,b,cin);
output sum;
input a,b,cin;
table
// a b cin: sum
   0  0   0  : 0;
   0  0   1  : 1;
   0  1   0  : 1;
   0  1   1  : 0;
   1  0   0  : 1;
   1  0   1  : 0;
   1  1   0  : 0;
   1  1   1  : 1;
endtable
endprimitive