`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:27 11/20/2019
// Design Name:   nine
// Module Name:   C:/MY_ise/nine/nine_test.v
// Project Name:  nine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nine_test;

	// Inputs
	reg pre;
	reg clr;
	reg clk;
	reg D;

	// Outputs
	wire Q;
	wire QN;

	// Instantiate the Unit Under Test (UUT)
	nine uut (
		.pre(pre), 
		.clr(clr), 
		.clk(clk), 
		.D(D), 
		.Q(Q), 
		.QN(QN)
	);
	
	always #20 clk = ~clk;

	initial begin
		// Initialize Inputs
		pre = 0;
		clr = 0;
		clk = 0;
		D = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		pre = 0;
		clr = 1;
		D = 0;
		#100;
		pre = 1;
		clr = 0;
		D = 0;
		#100;
		pre = 1;
		clr = 1;
		D = 0;
		#100;
		pre = 1;
		clr = 1;
		D = 0;
		#100;
		pre = 1;
		clr = 1;
		D = 1;
      #100;  
		pre = 0;
		clr = 1;
		D = 0;

		// Add stimulus here

	end
      
endmodule

