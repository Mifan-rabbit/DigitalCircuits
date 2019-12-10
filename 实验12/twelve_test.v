`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:09:28 12/03/2019
// Design Name:   twelve
// Module Name:   C:/MY_ise/twelve/twelve_test.v
// Project Name:  twelve
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: twelve
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module twelve_test;

	// Inputs
	reg MR;
	reg EN;
	reg CLK;

	// Outputs
	wire [3:0] Q;
	wire CO;

	// Instantiate the Unit Under Test (UUT)
	twelve uut (
		.MR(MR), 
		.EN(EN), 
		.CLK(CLK), 
		.Q(Q), 
		.CO(CO)
	);
	always #10 CLK=~CLK;
	initial begin
		// Initialize Inputs
		MR = 0; EN = 0; CLK = 0; #100;
		MR = 1; EN = 1; #100;
		MR = 1; EN = 1; #100;
		MR = 1; EN = 1; #100;
		MR = 1; EN = 1; #100;
		MR = 0; EN = 1; #100;
		MR = 1; EN = 1; #100;
		MR = 1; EN = 0; #100;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

