`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:00 12/09/2019
// Design Name:   fifteen
// Module Name:   C:/MY_ise/fifteen/fifteen_test.v
// Project Name:  fifteen
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifteen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifteen_test;

	// Inputs
	reg OE;
	reg [1:0] S;
	reg CLK;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	fifteen uut (
		.OE(OE), 
		.S(S), 
		.CLK(CLK), 
		.D(D), 
		.Q(Q)
	);

	always #10 CLK=~CLK;
	initial begin
		OE = 0; S = 2'b11; CLK = 1; D = 4'b1000; #100;
		OE = 0; S = 2'b10; D = 4'b0; #100;   
		OE = 0; S = 2'b01; D = 4'b0; #100; 	 
		OE = 1; S = 2'b0; D = 4'b0; #100; //高阻	
		OE = 0; S = 2'b11; D = 4'b0001; #30; 	
		OE = 0; S = 2'b01; D = 4'b0; #100; 	 		
	end
      
endmodule

