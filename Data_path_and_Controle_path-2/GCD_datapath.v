module GCD_datapath(output lt,gt,eq,
                    input ldA,ldB,sel1,sel2,sel_in,clk,
                    input [15:0]data_in);
wire [15:0] Bus,A_out,B_out,X,Y,sub_out;
PIPO A(A_out,Bus,ldA,clk);
PIPO B(B_out,Bus,ldB,clk);
MUX IN1(X,A_out,B_out,sel1);
MUX IN2(Y,B_out,A_out,sel2);
MUX load(Bus,sub_out,data_in,sel_in);
SUB s(sub_out,X,Y);
COMPARE comp(lt,gt,eq,A_out,B_out);
endmodule

// Registers A and B 
module PIPO(output reg [15:0]d_out,
            input [15:0]d_in,
            input load,clk);
always@(posedge clk)
begin
if(load) d_out<=d_in;
end
endmodule

module MUX(output [15:0]out,
           input [15:0]in1,in2,
           input sel);
assign out=sel?in1:in2;
endmodule

module COMPARE(output lt,gt,eq,
               input [15:0]data1,data2);
assign lt=data1<data2;
assign gt=data1>data2;
assign eq=data1==data2;
endmodule

module SUB(output[15:0]out,
        input [15:0] in1,in2);
assign out=in1-in2;
endmodule