`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      番番
//
// Create Date:   15:12:49 12/11/2019
// Design Name:   eighteen
// Module Name:   C:/MY_ise/eighteen/test.v
// Project Name:  数码管扫描显示
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eighteen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg start;
	reg rst;
	reg clk;

	// Outputs
	wire [3:0] ds;
	wire [7:0] seg;

	// Instantiate the Unit Under Test (UUT)
	eighteen uut (
		.start(start), 
		.rst(rst), 
		.clk(clk), 
		.ds(ds), 
		.seg(seg)
	);


always #1 clk=~clk;
	initial begin
		// Initialize Inputs
		start = 1; rst = 1; clk = 0; #10;
		start = 1; rst = 0; #600;        
		start = 1; rst = 1; #20; 
		start = 0; rst = 0; #20; 
		start = 1; rst = 0; #200; 
		// Add stimulus here

	end
      
endmodule
