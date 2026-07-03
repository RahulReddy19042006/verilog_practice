// Data Flow Modelling
module full_adder (input A, input B, input Cin, output Sum, output Carry);
assign Sum   = A ^ B ^ Cin;
assign Carry = (A & B) | (B & Cin) | (A & Cin);
endmodule

/* Behavioral Modelling
module full_adder (input A, input B, input Cin, output reg Sum, output reg Carry);
always @(*)
begin
    Sum   = A ^ B ^ Cin;
    Carry = (A & B) | (B & Cin) | (A & Cin);
end
endmodule
*/

/* Gate Level Modelling
module full_adder (input A, input B, input Cin, output Sum, output Carry);
wire t1, t2, t3;
xor X1(t1, A, B);
xor X2(Sum, t1, Cin);
and A1(t2, A, B);
and A2(t3, t1, Cin);
or  O1(Carry, t2, t3);
endmodule
*/