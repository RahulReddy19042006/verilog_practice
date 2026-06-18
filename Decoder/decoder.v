module decoder_3to8(input  [2:0] A,
                    input  EN,
                    output reg [7:0] Y);
always @(*) 
begin
if (EN)
     Y = 8'b00000001 << A;
 else
    Y = 8'b00000000;
end
endmodule