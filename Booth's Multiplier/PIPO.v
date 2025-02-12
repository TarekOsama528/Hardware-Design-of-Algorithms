`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:41:50
// Design Name: 
// Module Name: PIPO
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


module PIPO(
    input clk,
    input signed [15:0] data_in,
    input load,
    output reg signed [15:0] data_out
    );
    
    always @(posedge clk)
    begin
    if (load) data_out <= data_in;
    else data_out <= data_out;

    end
endmodule
