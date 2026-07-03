// Cyclic lamp---RED->YELLOW->GREEN->RED
module cyclic_lamp(input clk,output reg [2:0]light);
reg [1:0] state;
parameter S0=0,S1=1,S2=2;
parameter Red=3'b100, Yellow=3'b010, Green=3'b001;

always@(posedge clk)
begin
case(state)
S0: state<=S1;
S1: state<=S2;
S2: state<=S0;
default: state<=S0;
endcase
end

always@(state)
begin
case(state)
S0: light=Red;
S1: light=Yellow;
S2: light=Green;
default:light=Red;
endcase
end
endmodule

