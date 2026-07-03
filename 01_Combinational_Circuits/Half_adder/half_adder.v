// Data flow modelling 
module half_adder (input A,input B,output Sum,output Carry);
assign Sum = A ^ B;
assign Carry = A & B;
endmodule

/*Behavioral modelling 
module half_adder (input A,input B,output reg Sum,output reg Carry);
always@(*)
begin
Sum = A ^ B;
Carry = A & B;
end
endmodule*/

/* Gate level modelling
module half_adder (input A,input B,output Sum,output Carry);
xor X1(Sum,A,B);
and X2(Carry,A,B);
endmodule */