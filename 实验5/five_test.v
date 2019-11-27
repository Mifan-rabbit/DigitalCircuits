`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:03:08 11/13/2019
// Design Name:   five
// Module Name:   C:/MY_ise/five/four_test.v
// Project Name:  five
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: five
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_test;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [2:0] Y;

	// Instantiate the Unit Under Test (UUT)
	five uut (
		.A(A), 
		.B(B), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 0001;
		B = 0000;
		
		#100;
		A = 0000;
		B = 0001;
		
		#100;
		A = 0010;
		B = 0000;
		
		#100;
		A = 0000;
		B = 0010;
		
		#100;
		A = 0100;
		B = 0000;
		
		#100;
		A = 0000;
		B = 0100;
		
		#100;
		A = 1000;
		B = 0000;
		
		#100;
		A = 0000;
		B = 1000;  
 		
		#100;
		A = 1111;
		B = 1111;
		
		#100;
		A = 1001;
		B = 1001;		
		// Add stimulus here

	end
      
endmodule

