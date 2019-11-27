`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:24 11/13/2019
// Design Name:   six
// Module Name:   C:/MY_ise/six/six_test.v
// Project Name:  six
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: six
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module six_test;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg C;

	// Outputs
	wire [3:0] F;
	wire COUT;

	// Instantiate the Unit Under Test (UUT)
	six uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.F(F), 
		.COUT(COUT)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A=0000; B=0000; C=0;
		
		#100;
		A=0011; B=0110; C=0;
		
		#100;
		A=1100; B=0110; C=0;
		
		#100;
		A=1000; B=0111; C=0;
		
		#100;
		A=1111; B=1111; C=0;
		
		#100;
		A=0000; B=0000; C=1;		
		
		#100;
		A=0011; B=0110; C=1;
				
		#100;
		A=1000; B=0111; C=1;
		
		#100;
		A=1111; B=1111; C=1;		
		// Add stimulus here

	end
      
endmodule

