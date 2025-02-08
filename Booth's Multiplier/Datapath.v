`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:36:42
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input clk,
    input ldA,
    input clrA,
    input sftA,
    input ldQ,
    input clrQ,
    input sftQ,
    input ldM,
    input clrff,
    input addsub,
    input decr,
    input ldcnt,
    input signed [15:0] data_in,
    output eqz,
    output qm1,
    output q0,
    output signed [31:0] result
    );
    
    wire signed [15:0] Z;
    wire signed [15:0] A;
    wire signed [15:0] M;
    wire signed [15:0] Q;
    wire [4:0] count;
    
    assign eqz = ~|count;
    assign result = {A,Q};
    assign q0 = Q[0];
    
    
    shift_reg #(.WIDTH(16)) AR (.clk(clk),.ld(ldA),.clr(clrA),.rsft(sftA),.D(Z),.s_in(A[15]),.Q(A));
    
    shift_reg #(.WIDTH(16)) QR (.clk(clk),.ld(ldQ),.clr(clrQ),.rsft(sftQ),.D(data_in),.s_in(A[0]),.Q(Q));
    
    d_ff Q_ff (.clk(clk),.clrff(clrff),.D(Q[0]),.Q(qm1));
    
    PIPO M_pipo (.clk(clk),.load(ldM),.data_in(data_in),.data_out(M));
    
    ALU #(.WIDTH(16)) alu (.addsub(addsub),.operand1(A),.operand2(M),.result(Z));
    
    Counter #(.WIDTH(5)) counter (.clk(clk),.data_out(count),.ldcnt(ldcnt),.decr(decr));

    
endmodule
