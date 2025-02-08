`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 16:58:36
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
    input [15:0] data_in,
    input load,
    output reg [15:0] data_out
    );
    
    always @(posedge clk)
    begin
    if (load) data_out <= data_in;
    end
    
endmodule
