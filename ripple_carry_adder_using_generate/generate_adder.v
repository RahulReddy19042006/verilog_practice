//N-bit adder using generate
module generate_adder #(parameter N=8)
(input [N-1:0]a,b,
input cy_in,
 output [N-1:0]sum, 
 output cy_out);
 wire [N:0]carry;
 assign carry[0]=cy_in;
 assign cy_out=carry[N];
 genvar i;
 generate for(i=0;i<N;i=i+1)
    begin : fa
 wire t1,t2,t3;
 xor G1(t1,a[i],b[i]), G2(sum[i],t1,carry[i]);
 and G3(t2,a[i],b[i]), G4(t3,t1,carry[i]);
 or G5(carry[i+1],t2,t3);
 end 
 endgenerate 
 endmodule




