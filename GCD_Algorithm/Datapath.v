`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 16:43:29
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
    input [15:0] data_in,
    input sel_in,
    input sel1,
    input sel2,
    input ldA,
    input ldB,
    output lt,
    output gt,
    output eq,
    output [15:0] result
    );
    wire [15:0] Subout;
    wire [15:0] Aout;
    wire [15:0] Bout;
    wire [15:0] X;
    wire [15:0] Y;
    wire [15:0] bus_data;
    
    PIPO A (.clk(clk),.data_in(bus_data),.data_out(Aout),.load(ldA));
    PIPO B (.clk(clk),.data_in(bus_data),.data_out(Bout),.load(ldB));
    PIPO Rout (.clk(clk),.data_in(X),.data_out(result),.load(eq));
    
    MUX #(.WIDTH(16)) mux1 (.sel(sel1),.data1(Aout),.data2(Bout),.data_out(X));
    MUX #(.WIDTH(16)) mux2 (.sel(sel2),.data1(Aout),.data2(Bout),.data_out(Y));
    MUX #(.WIDTH(16)) mux_data (.sel(sel_in),.data1(data_in),.data2(Subout),.data_out(bus_data));
    
    Subtractor SUB (.operand1(X),.operand2(Y),.sub_out(Subout));

    Comparator COMP (.data1(Aout),.data2(Bout),.lt(lt),.gt(gt),.eq(eq));

    
endmodule
