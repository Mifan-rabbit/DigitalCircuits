`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:37:27 12/09/2019
// Design Name:   fourteen
// Module Name:   C:/MY_ise/fourteen/fourteen_test.v
// Project Name:  fourteen
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fourteen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fourteen_test;

	// Inputs
	reg OE;
	reg CLR;
	reg CLK;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	fourteen uut (
		.OE(OE), 
		.CLR(CLR), 
		.CLK(CLK), 
		.D(D), 
		.Q(Q)
	);
	always #10 CLK=~CLK;
	initial begin
		// Initialize Inputs
		OE = 0; CLR = 1; CLK = 0; D = 0; #100;//清零
		OE = 0; CLR = 0; D = 4'b0101; #100;
		OE = 0; CLR = 0; D = 4'b1100; #50;
		OE = 0; CLR = 0; D = 4'b0011; #50;
		OE = 1; CLR = 0; D = 0; #100;//高阻
		OE = 0; CLR = 0; D = 4'b1010; #100;	
		OE = 0; CLR = 1; D = 4'b1000; #100;//清零
		// Add stimulus here

	end
      
endmodule

