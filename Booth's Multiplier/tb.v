module tb();
  reg [15:0] data_in;
  reg clk,start;
  wire [31:0] result;
  wire done;
  
  booth_multiplier dut (.clk(clk),.done(done),.start(start),.data_in(data_in),.result(result));
  
  initial
     begin
       clk = 0;
       forever #5 clk = ~clk;
     end
  
   
    
  initial
      begin
        @(negedge clk) start = 1;
        @(negedge clk) data_in = 10;
       #10 @(negedge clk) data_in = 13;
   
        #1000 $finish;
     end
  
    initial
      begin
        $monitor ($time,"%d %b",result,done);
      
      end
  
endmodule