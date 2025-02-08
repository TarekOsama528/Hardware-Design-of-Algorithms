`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:36:42
// Design Name: 
// Module Name: Booth_tb
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


module booth_multiplier (
    input  clk,
    output done,
    input start,
    input signed [15:0] data_in,
    output signed [31:0] result
);

    wire ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, clrff, addsub, decr, ldcnt, eqz, qm1, q0;


    Datapath DP (.clk(clk),.ldA(ldA),.clrA(clrA),.sftA(sftA),.ldQ(ldQ),.clrQ(clrQ),.sftQ(sftQ), .ldM(ldM), .clrff(clrff), .addsub(addsub), 
    .decr(decr),.ldcnt(ldcnt),.data_in(data_in),.eqz(eqz),.qm1(qm1),.result(result),.q0(q0));

    Controller CON (.start(start),.clk(clk), .q0(q0), .qm1(qm1), .eqz(eqz), .done(done), .ldA(ldA), .clrA(clrA), .sftA(sftA), 
    .ldQ(ldQ), .clrQ(clrQ), .sftQ(sftQ), .ldM(ldM), .clrff(clrff), .addsub(addsub), .decr(decr), .ldcnt(ldcnt));
   
endmodule
