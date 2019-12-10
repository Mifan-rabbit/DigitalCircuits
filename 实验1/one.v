`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:00 10/30/2019 
// Design Name:    番番
// Module Name:    one 
// Project Name:   五输入表决器	
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
module one(A,B,C,D,E,Y);
    input A,B,C,D,E;
	 output Y;
	 wire A,B,C,D,E,Y,T0,T1,T2,T3,T4,T5,T6,T7,T8,T9;
	 and AU0(T0,A,B,C),
		AU1(T1,A,B,D),
		AU2(T2,A,B,E),
		AU3(T3,A,C,D),
		AU4(T4,A,C,E),
		AU5(T5,A,D,E),
		AU6(T6,B,C,D),
		AU7(T7,B,C,E),
		AU8(T8,B,D,E),
		AU9(T9,C,D,E);
	or OU0(Y, T0,T1,T2,T3,T4,T5,T6,T7,T8,T9);
endmodule

