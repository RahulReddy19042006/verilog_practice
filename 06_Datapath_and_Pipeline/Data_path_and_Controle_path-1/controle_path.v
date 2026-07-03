// Multiplication controlepath using repeated addition
module MUL_controller(input clk,reset,start,eqz,
                    output reg ldA,ldB,ldP,clrP,decB,done);
parameter S0 = 3'd0,S1 = 3'd1,S2 = 3'd2,S3 = 3'd3,S4 = 3'd4,S5 = 3'd5;
reg [2:0] PS, NS;

// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        PS <= S0;
    else
        PS <= NS;
end

// Next-State Logic + Output Logic
always @(*)
begin
    // Default outputs
    ldA   = 0;ldB   = 0; ldP   = 0; clrP  = 0; decB  = 0; done=0; NS = PS;
    case(PS)
    // Idle
    S0:
    begin
        if(start)
            NS = S1;
    end
    // Load Multiplicand
    S1:
    begin
        ldA = 1;
        NS  = S2;
    end
    // Load Multiplier and Clear Product
    S2:
    begin
        ldB  = 1;
        clrP = 1;
        NS   = S3;
    end
    // Check if B == 0
    S3:
    begin
        if(eqz)
            NS = S5;
        else
            NS = S4;
    end
    // P ← P + A, B ← B - 1
    S4:
    begin
        ldP  = 1;
        decB = 1;
        NS   = S3;
    end
    // Done
    S5:
    begin
        done = 1;
        #10 $finish;
    end
    default:
        NS = S0;
    endcase
end
endmodule