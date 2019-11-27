`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:45 11/13/2019 
// Design Name: 
// Module Name:    five 
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
module five(A,B,Y);
    input [3:0] A,B;
	 output reg [2:0]Y;
	 always @(*)
		begin
		   if(A[3]==B[3] && A[2]==B[2] && A[1]==B[1] && A[0]==B[0]) Y=3'b101;
			else if(A[3]>B[3] || A[3]==B[3] && A[2]>B[2] || A[3]==B[3] && A[2]==B[2] && A[1]>B[1] || A[3]==B[3] && A[2]==B[2] && A[1]==B[1] && A[0]>B[0]) Y=3'b011;
			else Y=3'b110;
		end
endmodule
