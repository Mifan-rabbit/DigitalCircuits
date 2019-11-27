`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:09 11/13/2019 
// Design Name: 
// Module Name:    four 
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
module four(EN,IN,Y,Done);
    input [7:0] IN;
	 input EN;
	 output reg[2:0] Y;
	 output reg Done;
	 always @(*)
		begin
			if(~EN)
				begin
					Done = 1;
					if(IN[0]==1) Y=000;
					else if(IN[1]==1) Y=3'b001;
					else if(IN[2]==1) Y=3'b010;
					else if(IN[3]==1) Y=3'b011;
					else if(IN[4]==1) Y=3'b100;
					else if(IN[5]==1) Y=3'b101;
					else if(IN[6]==1) Y=3'b110;
					else if(IN[7]==1) Y=3'b111;
					else 
						begin
							Y=000;
							Done=0;
						end
				end
			else	
				begin
					Y=000;
					Done=0;
				end
		end
endmodule
