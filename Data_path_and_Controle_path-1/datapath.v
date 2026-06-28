// Multiplication datapath using repeated addition

module MUL_datapath(
    output eqz,
    input ldA, ldB, ldP, clrP, decB, clk,
    input [15:0] data_in
);

wire [15:0] A_out;
wire [15:0] B_out;
wire [31:0] P_out;
wire [31:0] Sum;
wire [15:0] Bus;

assign Bus = data_in;

// Multiplicand register
PIPO_A A(A_out,Bus,ldA,clk);
// Product register
PIPO_P P( P_out, Sum, ldP,clrP,clk);
// Counter register (multiplier)
CNTR B( B_out, Bus, ldB, decB, clk);
// P + A
assign Sum = P_out + {16'b0, A_out};
// B == 0 ?
COMP EQ(eqz, B_out);
endmodule


// 16-bit PIPO register
module PIPO_A(
    output reg [15:0] dout,
    input [15:0] din,
    input load,
    input clk
);
always @(posedge clk)
begin
    if(load)
        dout <= din;
end
endmodule

// 32-bit Product register
module PIPO_P(
    output reg [31:0] dout,
    input [31:0] din,
    input load,
    input clear,
    input clk
);
always @(posedge clk)
begin
    if(clear)
        dout <= 32'd0;
    else if(load)
        dout <= din;
end
endmodule

// Comparator
module COMP(
    output eqz,
    input [15:0] data
);
assign eqz = (data == 16'd0);
endmodule

// Counter register
module CNTR(
    output reg [15:0] dout,
    input [15:0] din,
    input ld,
    input dec,
    input clk
);
always @(posedge clk)
begin
    if(ld)
        dout <= din;
    else if(dec)
        dout <= dout - 1'b1;
end
endmodule