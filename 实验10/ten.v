`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:30 11/20/2019 
// Design Name: 
// Module Name:    ten 
// Project Name: 
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
module JK(clk,j,k,q,qn);
    input clk,j,k;
	 output q,qn;
	 reg q;
	 wire qn;
	 always @(posedge clk)
		begin
			case({j,k})
			2'b00: q<=q;
			2'b01: q<=1'b0;
			2'b10: q<=1'b1;
			2'b11: q<=~q;
			default: q<=q;
			endcase
		end
assign qn=~q;
endmodule
