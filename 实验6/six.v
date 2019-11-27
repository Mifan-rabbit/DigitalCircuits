module adder(a,b,cin,s,cout);
   input a,b,cin;
   output cout,s;
	assign s=a^b^cin;
	assign cout=(a&b)|(a^b)&cin;
endmodule

module six(A,B,C,F,COUT);
    input [3:0] A,B;
	 input C;
	 output [3:0]F;
	 output COUT;
	 wire C1,C2,C3;
	 adder add1(A[0],B[0],C,F[0],C1);
	 adder add2(A[1],B[1],C1,F[1],C2);
	 adder add3(A[2],B[2],C2,F[2],C3);
	 adder add4(A[3],B[3],C3,F[3],COUT);
endmodule
