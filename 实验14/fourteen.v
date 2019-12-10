`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       番番
// 
// Create Date:    17:09:47 12/09/2019 
// Design Name: 
// Module Name:    fourteen 
// Project Name:   基本寄存器设计
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
module fourteen(OE,CLR,CLK,D,Q);
	input OE,CLR,CLK;
	input [3:0] D;
	output reg [3:0] Q;
	always @(posedge CLK, posedge CLR, negedge OE)
		begin
			if(~OE)
				begin
					if(CLR)	Q<=4'b0000;
					else	Q<=D;
				end
			else Q<=4'bzzzz;
		end
endmodule
