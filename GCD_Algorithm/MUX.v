`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 17:05:32
// Design Name: 
// Module Name: MUX
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


module MUX #(parameter WIDTH = 16)(
    input [WIDTH-1:0] data1,
    input [WIDTH-1:0] data2,
    input sel,
    output [WIDTH-1:0] data_out
    );
    
    assign data_out = sel? data2:data1;
    
endmodule
