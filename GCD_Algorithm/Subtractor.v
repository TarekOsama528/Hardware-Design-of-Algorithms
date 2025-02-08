`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 17:07:54
// Design Name: 
// Module Name: Subtractor
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


module Subtractor(
    input [15:0] operand1,
    input [15:0] operand2,
    output reg [15:0] sub_out
    );
    
    always @(*)
    begin
    sub_out = operand1 - operand2;
    end
endmodule
