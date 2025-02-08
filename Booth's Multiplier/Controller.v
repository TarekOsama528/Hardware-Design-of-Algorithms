`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:36:42
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
    input start,
    input clk,
    input q0,
    input qm1,
    input eqz,
    output done,
    output ldA,
    output clrA,
    output sftA,
    output ldQ,
    output clrQ,
    output sftQ,
    output ldM,
    output clrff,
    output addsub,
    output decr,
    output ldcnt
    );
    
    reg [2:0] PS;
    parameter S0 = 0 ,S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;
    
    //state logic
    always @(posedge clk) begin
    case (PS) 
    S0: begin
        if (start) PS = S1;
        else PS = S0;
    end

    S1: PS = S2;

    S2: begin
        #1 if ({q0,qm1} == 2'b01) PS = S3;
        else if ({q0,qm1} == 2'b10) PS = S4; 
        else if (({q0,qm1} == 2'b00) || ({q0,qm1} == 2'b11)) PS = S5;
    end

    S3: PS = S5;

    S4: PS = S5;

    S5: begin
        #1 if (({q0,qm1} == 2'b01) && !eqz) PS = S3;
        else if (({q0,qm1} == 2'b10) && !eqz) PS = S4;
        else if (eqz) PS = S6;
    end

    S6: PS = S6;

    default: PS = S0;
    endcase
    end
    
    assign ldA = ((PS == S3) || (PS == S4))? 1:0;
    assign clrA = (PS == S0)? 1:0;
    assign sftA = (PS == S5)? 1:0;

    assign ldQ = (PS == S2)? 1:0;
    assign clrQ = (PS == S0)? 1:0;
    assign sftQ = (PS == S5)? 1:0;

    assign decr = (PS == S5)? 1:0;
    assign ldcnt = (PS == S1)? 1:0;

    assign done = (PS == S6)? 1:0;
    assign ldM = (PS == S1)? 1:0;
    assign clrff = (PS == S0)? 1:0;
    assign addsub = (PS == S3)? 1:0;

    
endmodule
