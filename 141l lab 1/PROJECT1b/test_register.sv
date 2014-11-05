`timescale 1ns / 1ps

module test_register#(parameter W = 16);
     
  logic         clk;
  logic   wen_r;
  logic[W-1:0] wa_r; //Write Address
  logic[W-1:0] wd_r; //Write Data
  logic [W-1:0] ra0_r; //Read address 0
  logic [W-1:0] ra1_r; //Read address 1
  logic [W-1:0] rd0_r; //output *ptr 0
  logic [W-1:0] rd1_r;  //output *ptr 1
     
  register dut (    
           .clk(clk), .wen_i(wen_r), .wa_i(wa_r), 
			  .wd_i(wd_r), .ra0_i(ra0_r), .ra1_i(ra1_r), 
			  .rd0_o(rd0_r),.rd1_o(rd1_r)                      
                 );   
  initial
    begin
      clk = 0;
      forever #10 clk = !clk;
    end
    
   initial
     begin //Reading two reg's, no writing + writing
       wen_r = 16'd1;
       wa_r = 0;
       wd_r = 10;
       ra0_r = 0;
     @(negedge clk);
       wen_r = 16'd1;
       wa_r = 1;
       wd_r = 20;
	  @(negedge clk); //Reading same register on different ports
	    wen_r = 16'd0;
	    ra0_r = 1;
		 ra1_r = 1;
	  @(negedge clk); //Reading from reg + writing
	    wen_r = 16'd1;
		 wa_r = 1;
		 wd_r = 1;
		 ra0_r = 1;
		 ra1_r = 1;
		 
   end // initial begin
 endmodule

