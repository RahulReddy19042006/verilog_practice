module GCD_controller(input lt,gt,eq,clk,start,reset,
                      output reg ldA,ldB,sel1,sel2,sel_in,done);

parameter S0 = 3'd0,  // Idle
S1 = 3'd1,  // Load A
S2 = 3'd2,  // Load B
S3 = 3'd3,  // Compare
S4 = 3'd4,  // A <- A-B
S5 = 3'd5,  // B <- B-A
S6 = 3'd6;  // Done

reg [2:0] PS, NS;
// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        PS <= S0;
    else
        PS <= NS;
end

// Next State Logic + Outputs
always @(*)
begin
    ldA    = 0;ldB    = 0;sel1   = 0;sel2   = 0;sel_in = 0;done   = 0;NS = PS;
    case(PS)
    // Idle
    S0:
    begin
        if(start)
            NS = S1;
    end
    // Load A
    S1:
    begin
        sel_in = 0;    // data_in
        ldA    = 1;
        NS     = S2;
    end
    // Load B
    S2:
    begin
        sel_in = 0;    // data_in
        ldB    = 1;
        NS     = S3;
    end
    // Compare A and B
    S3:
    begin
        if(eq)
            NS = S6;
        else if(gt)
            NS = S4;
        else if(lt)
            NS = S5;
    end
    // A <- A - B
    S4:
    begin
        sel1   = 1;    // X=A
        sel2   = 1;    // Y=B
        sel_in = 1;    // Bus=sub_out
        ldA    = 1;
        NS = S3;
    end
    // B <- B - A
    S5:
    begin
        sel1   = 0;    // X=B
        sel2   = 0;    // Y=A
        sel_in = 1;    // Bus=sub_out
        ldB    = 1;
        NS = S3;
    end
    // Done
    S6:
    begin
        done = 1;
    #10 $finish;
    end

    default:
        NS = S0;
    endcase
end
endmodule