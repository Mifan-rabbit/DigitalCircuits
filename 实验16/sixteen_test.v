`timescale 1ns / 1ps

module sixteen_test;

	// Inputs
	reg [1:0] sw;
	reg rst;
	reg clk;

	// Outputs
	wire clk_O;

	// Instantiate the Unit Under Test (UUT)
	sixteen uut (
		.sw(sw), 
		.rst(rst), 
		.clk(clk), 
		.clk_O(clk_O)
	);

	always #5 clk = ~clk;

	initial begin
	
		// Initialize Inputs
		clk = 0;
		sw = 00;
		rst = 1;

		// Wait 100 ns for global reset to finish
		
		#20;
		sw = 00;
		rst = 0;
		
		#300
		sw = 01;
		rst = 1;
 		
		#20;
		sw = 01;
		rst = 0;		
 		
		#300;
		sw = 10;
		rst = 1;

		#20;
		sw = 10;
		rst = 0;
 		
		#300;
		sw = 11;
		rst = 1;
 		
		#20;
		sw = 11;
		rst = 0;
		
		#200;
		// Add stimulus here

	end
      
endmodule

