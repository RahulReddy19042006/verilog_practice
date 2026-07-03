module counter #(parameter N=8)
                (input clock,clear,
                output reg [N-1:0]count);
always@(posedge clock)
  if(clear) count<=0;
  else count<=count+1;
endmodule