`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       番番
// 
// Create Date:    13:18:08 12/03/2019 
// Design Name: 
// Module Name:    thirteen 
// Project Name:   可逆计数器设计
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
module thirteen(MR,LOAD,EN,UpDown,CLK,D,Q,CO);
input MR,LOAD,CLK,EN,UpDown;
input [3:0] D;
output reg [3:0] Q;
output reg CO;
always @ ( posedge CLK or posedge MR)  
		begin
			if(MR)	Q<=1'b0;
			else if (~LOAD)	Q<=D;
			else if (EN)
				begin
					if(UpDown)
						begin
							if(Q==4'b0000)	Q<=4'b1111;
							else	Q<=Q-1'b1;
						end
					else
						begin
								if(Q==4'b1111)	Q<=1'b0;
								else	Q<=Q+1'b1;
						end
				end
		end
always @(*)
	begin
		if(UpDown && Q==4'b0000 && ~MR)	CO<=1'b1;
		else if(~UpDown && Q==4'b1111 && ~MR)	CO<=1'b1;
		else	CO<=1'b0;
	end
endmodule

