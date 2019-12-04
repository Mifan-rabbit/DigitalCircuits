module nFdiv(rst,clk,count,out);
	input rst,clk;
	input [31:0] count;
	output reg out;
	reg [31:0] counter;
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter <= 32'b0;
				out <= 1'b0;
			end
		else if(counter == count)
			begin
				out <= ~out;
				counter <= 32'b0;
			end	 
      else
			counter<=counter+1'b1;
   end
endmodule


module nsDelay(rst,clk,timeout);
	input rst,clk;
	output reg timeout;
	reg [31:0] counter;
	always @(posedge clk, posedge rst)
	begin
		if (rst)
		begin
		counter <= 32'b0;
		timeout <= 1'b0;
		end
		else if(counter == 32'd120000000)//32'd6
	    begin
		   timeout <= ~timeout;
			counter <= 1'b0;
	    end	 
      else
			counter<=counter+1'b1;			
   end
endmodule


module sixteen(sw,rst,clk,clk_O);
	input rst,clk;
	input [1:0] sw;
	output reg clk_O;
	wire [31:0] count00,count01,count10;
	assign count00=32'd20000000;//9
	assign count01=32'd10000000;//4
	assign count10=32'd5000000;//1
	wire out00,out01,out10,timeout;
	nFdiv Fdiv00(rst,clk,count00,out00);
	nFdiv Fdiv01(rst,clk,count01,out01);	
	nFdiv Fdiv10(rst,clk,count10,out10);	
	nsDelay Delay(rst,clk,timeout);	
	always @(*)
	begin
		case(sw)
			2'b00: clk_O<=out00;
			2'b01: clk_O<=out01;
			2'b10: clk_O<=out10;
			2'b11: clk_O<=timeout;
		endcase
	end
endmodule
