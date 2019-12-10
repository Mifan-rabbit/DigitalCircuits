`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:35 12/03/2019
// Design Name:   thirteen
// Module Name:   C:/MY_ise/thirteen/thirteen_test.v
// Project Name:  thirteen
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: thirteen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module thirteen_test;

	// Inputs
	reg MR;
	reg LOAD;
	reg EN;
	reg UpDown;
	reg CLK;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;
	wire CO;

	// Instantiate the Unit Under Test (UUT)
	thirteen uut (
		.MR(MR), 
		.LOAD(LOAD), 
		.EN(EN), 
		.UpDown(UpDown), 
		.CLK(CLK), 
		.D(D), 
		.Q(Q), 
		.CO(CO)
	);

always #10 CLK=~CLK;
	initial begin
		// Initialize Inputs
		MR = 1;LOAD = 0;EN = 1;UpDown = 0;CLK = 0;D = 0;#30;
		MR = 0;LOAD = 0;EN = 1;UpDown = 0;D = 4'b1100;#50;
		MR = 0;LOAD = 1;EN = 1;UpDown = 0;D = 4'b1100;#270;
		MR = 0;LOAD = 1;EN = 1;UpDown = 1;D = 4'b1100;#300;
		MR = 0;LOAD = 1;EN = 0;UpDown = 1;D = 4'b1100;#100;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

