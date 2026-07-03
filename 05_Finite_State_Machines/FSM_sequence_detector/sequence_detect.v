// sequence 0110 detection
module seq_detector(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter S0=0,S1=1,S2=2,S3=3;
reg [1:0] PS,NS;

always @(posedge clk or negedge reset)
begin
    if(!reset)
        PS <= S0;
    else
        PS <= NS;
end
always @(*)
begin
    case(PS)

    S0:
    begin
        z  = 0;
        NS = x ? S0 : S1;
    end

    S1:
    begin
        z  = 0;
        NS = x ? S2 : S1;
    end

    S2:
    begin
        z  = 0;
        NS = x ? S3 : S1;
    end

    S3:
    begin
        z  = x ? 0 : 1;
        NS = x ? S0 : S1;
    end

    default:
    begin
        z  = 0;
        NS = S0;
    end

    endcase
end
endmodule
