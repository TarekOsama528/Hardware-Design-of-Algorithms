`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 21:19:58
// Design Name: 
// Module Name: GCD_tb
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


module GCD_tb;
    reg clk;
    reg [15:0] data_in;
    reg start;
    wire done;
    wire [15:0] result;
    
    Datapath DP (clk,data_in,sel_in,sel1,sel2,ldA,ldB,lt,gt,eq,result);
    Controller CON (clk,start,lt,gt,eq,done,ldA,ldB,sel_in,sel1,sel2);
    
    initial begin
        clk = 0;
        #3 start = 1;
        #10000 $finish;
    end 
    
    always #5 clk = ~clk;
    
    initial begin
        #10 data_in = 78;
        #12 data_in = 143;
    end
    
    initial begin
        $monitor ($time, " result:%d  %b",result,done);
    end
    
endmodule

