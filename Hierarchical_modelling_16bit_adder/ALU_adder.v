//16-bit adder 
module ALU_adder(input [15:0]X,Y,
            output sign,carry,parity,zero,overflow,
            output [15:0]Z);
wire [3:1] C;
assign sign=Z[15];
assign parity=~^Z;
assign zero=~|Z;
assign overflow=(X[15]&Y[15]&~Z[15])|(~X[15]&~Y[15]&Z[15]);
adder4 A0(Z[3:0],C[1],X[3:0],Y[3:0],1'b0);
adder4 A1(Z[7:4],C[2],X[7:4],Y[7:4],C[1]);
adder4 A2(Z[11:8],C[3],X[11:8],Y[11:8],C[2]);
adder4 A3(Z[15:12],carry,X[15:12],Y[15:12],C[3]);
endmodule

module adder4(S,cout,A,B,cin);
input [3:0]A,B;
input cin;
output [3:0]S;
output cout;
wire c1,c2,c3;
full_adder FA0(S[0],c1,A[0],B[0],cin);
full_adder FA1(S[1],c2,A[1],B[1],c1);
full_adder FA2(S[2],c3,A[2],B[2],c2);
full_adder FA3(S[3],cout,A[3],B[3],c3);
endmodule

module full_adder(s,cout,a,b,c);
input a,b,c;
output s,cout;
wire t1,t2,t3;
xor G1(t1,a,b), G2(s,t1,c);
and G3(t2,a,b), G4(t3,t1,c);
or G5(cout,t2,t3);
endmodule
