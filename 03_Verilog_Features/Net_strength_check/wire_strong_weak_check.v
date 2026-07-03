module wire_strong_weak_check;

wire x1, x2, x3;

assign (strong1, strong0) x1 = 1'b1;
assign (weak1,   weak0)   x1 = 1'b0;

assign (strong1, strong0) x2 = 1'bz;
assign (weak1,   weak0)   x2 = 1'b0;

assign (strong1, strong0) x3 = 1'b0;
assign (strong1, strong0) x3 = 1'b1;

initial begin
    #1;
    $display("Case1 x1 = %b", x1);
    $display("Case2 x2 = %b", x2);
    $display("Case3 x3 = %b", x3);
end

endmodule