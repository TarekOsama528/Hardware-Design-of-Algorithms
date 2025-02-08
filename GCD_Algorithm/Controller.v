`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 16:47:49
// Design Name: 
// Module Name: Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller(
    input clk,
    input start,
    input lt,
    input gt,
    input eq,
    output reg done,
    output reg ldA,
    output reg ldB,
    output reg sel_in,
    output reg sel1,
    output reg sel2
    );
    
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
    
    reg [2:0] PS;

        //State Logic
        always @ (posedge clk)
        begin
            case (PS)
                S0:     if (start) PS <= S1;
                S1:     PS <= S2;
                S2:     #2 if (eq) PS <= S5;
                            else if (lt) PS <= S3;
                            else if (gt) PS <= S4;
                S3:     #2 if (eq) PS <= S5;
                            else if (lt) PS <= S3;
                            else if (gt) PS <= S4;
                S4:    #2 if (eq) PS <= S5;
                            else if (lt) PS <= S3;
                            else if (gt) PS <= S4;
                S5:         PS <= S5;
                default:    PS <= S0;
            endcase
        end
    
        //I/O Logic
        always @ (PS)
        begin
            case (PS)
                S0:     begin sel_in = 0; ldA = 1; ldB = 0; done = 0; end
                S1:     begin sel_in = 0; ldA = 0; ldB = 1; end
                S2:     if (eq) done = 1;
                        else if (lt) begin sel1 = 1; sel2 = 0; sel_in = 1; #1 ldA = 0; ldB = 1; end
                        else if (gt) begin sel1 = 0; sel2 = 1; sel_in = 1; #1 ldA = 1; ldB = 0; end
                S3:     if (eq) done = 1;
                        else if (lt) begin sel1 = 1; sel2 = 0; sel_in = 1; #1 ldA = 0; ldB = 1; end
                        else if (gt) begin sel1 = 0; sel2 = 1; sel_in = 1; #1 ldA = 1; ldB = 0; end
                S4:     if (eq) done = 1;
                        else if (lt) begin sel1 = 1; sel2 = 0; sel_in = 1; #1 ldA = 0; ldB = 1; end
                        else if (gt) begin sel1 = 0; sel2 = 1; sel_in = 1; #1 ldA = 1; ldB = 0; end
                S5:     begin done = 1; sel1 = 0; sel2 = 0; ldA = 0; ldB = 0; end
                default: begin ldA = 0; ldB = 0; end
            endcase
        end 
    
endmodule
