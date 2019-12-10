`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       番番
// 
// Create Date:    12:18:03 12/03/2019 
// Design Name:     
// Module Name:    twelve 
// Project Name:   十进制计数器设计
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
	module twelve(MR,EN,CLK,Q,CO);
input wire MR,CLK,EN;
output reg [3:0] Q;
output CO;
always @ ( posedge CLK or negedge MR)  
		begin
			if(~MR)	Q<=4'b0000;
			else if(EN)
				begin
					if(Q==4'b0000)	Q<=4'b1001;
					else	Q<=Q-1'b1;
				end
		end
assign CO=(~Q[0])&(~Q[1])&(~Q[2])&(~Q[3])&(MR);
endmodule
