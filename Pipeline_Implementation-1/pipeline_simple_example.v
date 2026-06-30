// Simple 3-stage pipeline
module pipe_simple #(parameter N = 10)
(output [N-1:0] F,
input  [N-1:0] A,B,C,D,
input  clk);

reg [N-1:0] L12_X1, L12_X2, L12_D;
reg [N-1:0] L23_X3, L23_D;
reg [N-1:0] L34_F;

assign F = L34_F;

// Stage 1
always @(posedge clk)
begin
    L12_X1 <= #4 (A + B);
    L12_X2 <= #4 (C - D);
    L12_D  <= #4 D;
end

// Stage 2
always @(posedge clk)
begin
    L23_X3 <= #4 (L12_X1 + L12_X2);
    L23_D  <= #4 L12_D;
end

// Stage 3
always @(posedge clk)
begin
    L34_F <= #6 (L23_X3 * L23_D);
end

endmodule