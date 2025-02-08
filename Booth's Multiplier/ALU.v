`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 23:41:50
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter WIDTH = 16)(
    input addsub,
    input signed [WIDTH-1:0] operand1,
    input signed [WIDTH-1:0] operand2,
    output reg signed [WIDTH-1:0] result
    );
    
    always @(*) begin
    if (addsub) result = operand1 + operand2;
    else if (!addsub) result = operand1 - operand2;
    end
endmodule
