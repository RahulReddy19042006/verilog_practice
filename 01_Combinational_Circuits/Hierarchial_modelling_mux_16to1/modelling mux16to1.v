module mux16to1(input [15:0] in,
                input [3:0] sel,
                output out);
wire [3:0] t;
mux4to1 M0(in[3:0],sel[1:0],t[0]);
mux4to1 M1(in[7:4],sel[1:0],t[1]);
mux4to1 M2(in[11:8],sel[1:0],t[2]);
mux4to1 M3(in[15:12],sel[1:0],t[3]);
mux4to1 M(t,sel[3:2],out);
endmodule

 module mux4to1(input [3:0] in,
                input [1:0]sel,
                output out);
    wire [1:0] w;
    mux2to1 M0(in[1:0],sel[0],w[0]);
    mux2to1 M1(in[3:2],sel[0],w[1]);
    mux2to1 M(w,sel[1],out);
endmodule
 
module mux2to1(input [1:0]in,
                input sel,
                output out);
    wire k1,k2,k3;
    not G1(k1,sel);
    and G2(k2,in[0],k1);
    and G3(k3,in[1],sel);
    or  G4(out,k2,k3);
endmodule