`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:19 11/20/2019
// Design Name:   JK
// Module Name:   C:/MY_ise/ten/ten_test.v
// Project Name:  ten
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JK
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ten_test;

	// Inputs
	reg clk;
	reg j;
	reg k;

	// Outputs
	wire q;
	wire qn;

	// Instantiate the Unit Under Test (UUT)
	JK uut (
		.clk(clk), 
		.j(j), 
		.k(k), 
		.q(q), 
		.qn(qn)
	);

always #20 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		j = 1;
		k = 0;

		// Wait 100 ns for global reset to finish
		#100;
		j = 0;
		k = 0;
		#100;
		j = 0;
		k = 1;		
		#100;
		j = 1;
		k = 0;
		#100;
		j = 1;
		k = 1;		
		// Add stimulus here

	end
      
endmodule

