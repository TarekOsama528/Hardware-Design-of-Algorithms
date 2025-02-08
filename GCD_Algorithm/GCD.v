`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 18:11:50
// Design Name: 
// Module Name: GCD
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


module GCD(
    input clk,
    output done,
    input start,
    input [15:0] data_in,
    output reg [15:0] result
    );
    wire ldA;
    wire ldB;
    wire sel_in;
    wire sel1;
    wire sel2;
    wire lt;
    wire gt;
    wire eq;
    
    Datapath DP_DUT (.clk(clk),.data_in(data_in),.sel_in(sel_in),.sel1(sel1),.sel2(sel2),.ldA(ldA),
    .ldB(ldB),.lt(lt),.gt(gt),.eq(eq),.result(result));
    
    Controller CON_DUT (.clk(clk),.start(start),.lt(lt),.gt(gt),.eq(eq),.done(done),.ldA(ldA),
    .ldB(ldB),.sel_in(sel_in),.sel1(sel1),.sel2(sel2));
    
endmodule
