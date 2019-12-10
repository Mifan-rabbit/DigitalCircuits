`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       番番
// 
// Create Date:    17:26:28 12/09/2019 
// Design Name: 
// Module Name:    fifteen 
// Project Name:    移位寄存器设计
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fifteen(OE,S,CLK,D,Q);
	input OE,CLK;
	input [1:0] S;
	input [3:0] D;
	output reg [3:0] Q;
	always @(posedge CLK or posedge OE)
		begin
			if(OE) Q<=4'bzzzz;
			else if(S==2'b01)
				begin
					Q[3:1]<=Q[2:0];
					Q[0]<=Q[3];
				end
			else if(S==2'b10)
				begin
					Q[2:0]<=Q[3:1];
					Q[3]<=Q[0];
				end			
			else if(S==2'b11)	Q<=D;
		end
endmodule
