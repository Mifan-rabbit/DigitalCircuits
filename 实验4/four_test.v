`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:05 11/13/2019
// Design Name:   four
// Module Name:   C:/MY_ise/four/four_test.v
// Project Name:  four
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four
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
	reg EN;
	reg [7:0] IN;

	// Outputs
	wire [2:0] Y;
	wire Done;

	// Instantiate the Unit Under Test (UUT)
	four uut (
		.EN(EN), 
		.IN(IN), 
		.Y(Y), 
		.Done(Done)
	);

	initial begin
		// Initialize Inputs
		EN = 0;
		IN = 0;

		// Wait 100 ns for global reset to finish
		#100;
		EN = 1; IN = 00000000;
		
		#100;
		EN = 0; IN = 00000000;
		
		#100;
		EN = 0; IN = 00000001;
		
		#100;
		EN = 0; IN = 00000010;
		
		#100;
		EN = 0; IN = 00000100;
		
		#100;
		EN = 0; IN = 00001000;
		
		#100;
		EN = 0; IN = 00010000;
		
		#100;
		EN = 0; IN = 00100000;
		
		#100;
		EN = 0; IN = 01000000;
		
 		#100;
		EN = 0; IN = 10000000; 
      
		#100;
		EN = 1; IN = 00000001;
		// Add stimulus here

	end
      
endmodule

