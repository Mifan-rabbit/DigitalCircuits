`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:20 10/30/2019
// Design Name:   two
// Module Name:   C:/MY_ise/two/two_test.v
// Project Name:  two
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////module two_test;

	module two_test;

	// Inputs
	reg [1:0] A;
	reg [1:0] B;
	reg [1:0] C;
	reg [1:0] D;
	reg [1:0] S;
	reg EN;

	// Outputs
	wire [1:0] Y;

	// Instantiate the Unit Under Test (UUT)
	two uut (
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.S(S),
		.EN(EN),
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		S = 0;
		EN = 0;

		// Wait 100 ns for global reset to finish
       
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 0;EN = 0;
       
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 0;EN = 1;
       
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 01;EN = 0;
       
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 01;EN = 1;
       
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 10;EN = 0;
		
      #100;
		A = 00;B = 01;C = 10;D = 11;S = 10;EN = 1;
     
		#100;
		A = 00;B = 01;C = 10;D = 11;S = 11;EN = 0;
		
      #100;
		A = 00;B = 01;C = 10;D = 11;S = 11;EN = 1;
       
		// Add stimulus here

	end
     
endmodule
