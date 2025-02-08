`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 00:21:01
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter WIDTH = 4) (
    input clk,
    output reg [WIDTH-1:0] data_out,
    input ldcnt,
    input decr
    );
    
    always @(posedge clk) begin
    if (ldcnt) data_out <= 16;
    else if (decr) data_out <= data_out - 1;
    end
endmodule
