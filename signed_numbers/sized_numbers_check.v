module sized_numbers_check;

reg [63:0] a,b,c;
reg [5:0] d;

initial begin
    a[31:0] = 'habc1;      // 32 bits
    b[7:0]  = 8'hef;
    c       = 16'h45;
    d       = -6'b11_01_1;

    $display("a=%h, b=%h, c=%h, d=%b, d=%d",
              a,b,c,d,d);

    a[63:0] = 'hxbc1;     // X extension
    b[63:0] = 'hzf;       // Z extension
    c       = 16'b1;       // zero extension

    $display("a=%b, b=%b, c=%h, c=%b",
              a,b,c,c);
end

endmodule