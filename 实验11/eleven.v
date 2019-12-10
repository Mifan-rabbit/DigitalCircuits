`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     10:44:17 12/03/2019 
// Design Name:     番番
// Module Name:     eleven 
// Project Name:    同步二进制计数器设计
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
module eleven(MR,LOAD,EN,CLK,D,Q,CO);
input MR,LOAD,CLK,EN;
input [3:0] D;
output reg [3:0] Q;
output CO;
always @ ( posedge CLK or negedge MR or negedge LOAD)  
		begin
			if(~MR)	Q<=4'b0;
			else if (~LOAD) Q<=D;
			else if (EN)
				begin
					if(Q==4'b1111)		Q<=4'b0;				
					else 	Q<=Q+1'b1;
				end
		end
assign CO=Q[0]&Q[1]&Q[2]&Q[3];
endmodule
