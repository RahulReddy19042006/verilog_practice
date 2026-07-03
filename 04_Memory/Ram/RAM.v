module ram #(parameter addr_size=10, word_size=8, memory_size=(1<<addr_size))
(output [word_size-1:0]data_out,
 input [word_size-1:0]data_in,
 input [addr_size-1:0]addr,
 input wr,cs);

reg [word_size-1:0] mem [memory_size-1:0];

assign data_out=mem[addr];
always@(posedge wr)
begin
if(cs) mem[addr]=data_in;
end
endmodule