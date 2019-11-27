`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:00:24 10/30/2019
// Design Name:   one
// Module Name:   C:/MY_ise/one/one_test.v
// Project Name:  one
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_test;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg E;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	one uut (
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E),
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A=0;B=0;C=0;D=0;E=1;
		
		#100;
		A=0;B=0;C=1;D=1;E=0;		
     
		#100;
		A=1;B=1;C=0;D=0;E=1;
		
		#100;
		A=1;B=1;C=1;D=0;E=1;
		
		#100;
		A=1;B=1;C=1;D=1;E=1;
		
		#100;
		A=0;B=0;C=0;D=0;E=0;
		// Add stimulus here
	end   
	
endmodule
