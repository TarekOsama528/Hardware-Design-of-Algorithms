`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:41:50
// Design Name: 
// Module Name: shift_reg
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


module shift_reg #(parameter WIDTH = 16) (
    input clk,
    input ld,
    input clr,
    input rsft,
    input s_in,
    input [WIDTH-1:0] D,
    output reg [WIDTH-1:0] Q
    );
    
    always @(posedge clk) begin
    if (clr) Q <= 0;
    else if (ld) Q <= D;
    else if (rsft) Q <= {s_in,Q[WIDTH-1:1]};
    
    end
    
    
endmodule
