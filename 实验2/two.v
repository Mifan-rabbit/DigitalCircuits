`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:02 10/30/2019 
// Design Name: 
// Module Name:    two 
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
module two(A,B,C,D,S,EN,Y);
   input [1:0] A,B,C,D,S;
	input EN;
	output [1:0] Y;
	
	wire [1:0] A,B,C,D,S,Y;
	wire EN;
	
	assign Y[0]=(~EN)&(((~S[0])&(~S[1])&(A[0]))|((S[0])&(~S[1])&(B[0]))|((~S[0])&(S[1])&(C[0]))|((S[0])&(S[1])&(D[0])));
	assign Y[1]=(~EN)&(((~S[0])&(~S[1])&(A[1]))|((S[0])&(~S[1])&(B[1]))|((~S[0])&(S[1])&(C[1]))|((S[0])&(S[1])&(D[1])));
	
endmodule
