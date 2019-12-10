`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:57:03 12/03/2019
// Design Name:   eleven
// Module Name:   C:/MY_ise/eleven/eleven_test.v
// Project Name:  eleven
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eleven
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eleven_test;

	// Inputs
	reg MR;
	reg LOAD;
	reg EN;
	reg CLK;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;
	wire CO;

	// Instantiate the Unit Under Test (UUT)
	eleven uut (
		.MR(MR), 
		.LOAD(LOAD), 
		.EN(EN), 
		.CLK(CLK), 
		.D(D), 
		.Q(Q), 
		.CO(CO)
	);
always #10 CLK=~CLK;

	initial begin
		// Initialize Inputs
		MR = 0; LOAD = 1; EN = 1; CLK = 0; D = 0;#30;		
		MR = 1; LOAD = 0; EN = 0; D = 4'b1110;#30;
		MR = 1; LOAD = 1; EN = 0; D = 0;#40;
		MR = 1; LOAD = 1; EN = 1; D = 0;#700;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

