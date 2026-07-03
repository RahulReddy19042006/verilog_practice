module SRlatch(q,qbar,S,R);
input S,R;
output q,qbar;
assign q=~(R&qbar);
assign qbar=~(S&q);
endmodule