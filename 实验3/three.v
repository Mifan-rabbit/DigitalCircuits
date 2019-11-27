`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:09 10/30/2019 
// Design Name: 
// Module Name:    three 
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
module three(G1,G2,G3,A,Y);
	input G1,G2,G3;
	input [2:0] A;
	output [7:0]Y;
	wire G1,G2,G3;
	wire [2:0] A;
	reg [7:0]Y;
	always @(A,G1,G2,G3)
		begin 
			if(~G1|G2|G3) Y = 8'b1111_1111;
			else 
				case(A)
                 3'b000 : Y= 8'b1111_1110;    
                 3'b001 : Y= 8'b1111_1101;    
                 3'b010 : Y= 8'b1111_1011;    
                 3'b011 : Y= 8'b1111_0111;     
                 3'b100 : Y= 8'b1110_1111;    
                 3'b101 : Y= 8'b1101_1111;    
                 3'b110 : Y= 8'b1011_1111;    
                 3'b111 : Y= 8'b0111_1111; 
				endcase
		end
endmodule
