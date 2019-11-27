`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:06 11/20/2019 
// Design Name: 
// Module Name:    nine 
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
module nine(pre,clr,clk,D,Q,QN);
	input pre,clr,clk,D;
	output reg Q,QN;
    always @(negedge clr or negedge pre or posedge clk)
		begin
			if(!pre)
				begin 
					Q<=1'b1;
					QN<=1'b0;
				end
			else if(!clr)
				begin
					Q<=1'b0;
					QN<=1'b1;
				end
			else
				begin
					Q<=D;
					QN<=~D;
				end	
		end
endmodule

