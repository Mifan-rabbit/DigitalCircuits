`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:39:09 10/30/2019
// Design Name:   three
// Module Name:   C:/MY_ise/three/three_test.v
// Project Name:  three
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: three
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module three_test;

	// Inputs
	reg G1;
	reg G2;
	reg G3;
	reg [2:0] A;

	// Outputs
	wire [7:0] Y;

	// Instantiate the Unit Under Test (UUT)
	three uut (
		.G1(G1), 
		.G2(G2), 
		.G3(G3), 
		.A(A), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		G1 = 0;
		G2 = 0;
		G3 = 0;
		A = 0;

		// Wait 100 ns for global reset to finish		
		
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 000;		
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 001;
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 010;	
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 011;		
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 100;	
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 101;
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 110;	
		
		#100;
      G1 = 1;G2 = 0;G3 = 0;A = 111;	
		
		#100;
      G1 = 0;G2 = 0;G3 = 0;A = 111;		
		
		#100;
      G1 = 1;G2 = 1;G3 = 0;A = 000;
		
		#100;
      G1 = 1;G2 = 0;G3 = 1;A = 000;

		
		// Add stimulus here

	end
      
endmodule

