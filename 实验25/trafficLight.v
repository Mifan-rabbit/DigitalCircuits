module top(clk,rst,stopa,stopb,pause,ds,seg,light1,light2);//顶层模块
	input clk,rst,stopa,stopb,pause;
	output [3:0] ds;
	output [7:0] seg;
	output [2:0] light1,light2;//绿 红 黄
	
	wire clk_s,clk_d;
	wire [15:0] data;
	
	clk_show s(clk,clk_s);
	clk_data d(rst,clk,clk_d);
	light l(clk_d,rst,stopa,stopb,pause,light1,light2,data);
	show sshow(rst,clk_s,stopa,stopb,data,ds,seg);
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////


module light(clk,rst,stopa,stopb,pause,A,B,data);//交通灯控制模块
input clk,rst,stopa,stopb,pause;
output  reg [2:0] A; //红绿黄
output  reg [2:0] B;
output reg [15:0] data; 

reg [2:0] stateA;
parameter redA1 = 3'b000, redA2 = 3'b100, greenA = 3'b001, yellowA = 3'b010;
 
always @ (posedge clk or posedge rst)
    begin 
        if(rst)
            begin  
               stateA <= redA1;
					A <= 3'b100;
					B <= 3'b100;
					data <= 16'b0000_0000_0000_0101;
            end
		  else if(stopa)
				begin
					stateA <= redA1;
					A <= 3'b100;
					B <= 3'b010;
					data <= 16'b0000_0000_0000_0101; 
				end
		  else if(stopb)
				begin
					stateA <= redA1;						
					A <= 3'b010;
					B <= 3'b100;
					data <= 16'b0000_0000_0000_0101; 
				end
        else if(~pause)   
            case (stateA)              //交通灯状态变换
                redA1 : 
						 begin 
						    if(data==0) 
								 begin
									 data <= 16'b0010_0011_0000_0000;
									 stateA <= greenA; //主绿次红
								end
							 else if(data[3:0] == 0 && !data[7:4] == 0) 
								 begin
								 	 A <= 3'b100;
									 B <= 3'b001;
									 data[7:4] <= data[7:4] - 1'b1;
									 data[3:0] <= 4'b1001;
								 end
							 else if(!data[3:0] == 0) 
								 begin
								 	A <= 3'b100;
									B <= 3'b001;
									data[3:0] <= data[3:0] - 1'b1;
								 end 
							 else stateA <= redA1;				
						 end
                greenA : 
						 begin 
							 if(data==0) 
								 begin  
								 data <= 16'b0000_0101_0000_0000;
								 stateA <= yellowA; //主黄次红
								 end
							 else if(data[11:8] == 0 && !data[15:12] == 0) 
								 begin
									 A <= 3'b010;
									 B <= 3'b100;								 
									 data[15:12] <= data[15:12] - 1'b1;
									 data[11:8] <= 4'b1001;
								 end
							 else if(!data[11:8] == 0) 
								 begin
									A <= 3'b010;
									B <= 3'b100;								 
									data[11:8] <= data[11:8] - 1'b1;
								 end 
							 else  stateA <= greenA; 			
						 end 
                yellowA :
						 begin 
							 if(data==0) 
								 begin
									 data <= 16'b0000_0000_0001_1001;
									 stateA <= redA2; //主红次绿
								 end
							 else if(data[11:8] == 0 && !data[15:12] == 0) 
								 begin
									 A <= 3'b001;
									 B <= 3'b100;								 
									 data[15:12] <= data[15:12] - 1'b1;
									 data[11:8] <= 4'b1001;
								 end
							 else if(!data[11:8] == 0) 
								 begin
									A <= 3'b001;
									B <= 3'b100;								 
									data[11:8] <= data[11:8] - 1'b1;
								 end 
							 else stateA <= yellowA;							
						 end
					redA2 :
						 begin 
							 if(data==0) 
								 begin
									 data <= 16'b0000_0000_0000_0101;
									 stateA <= redA1; //主红次黄
								 end
							 else if(data[3:0] == 0 && !data[7:4] == 0) 
								 begin
									 A <= 3'b100;
									 B <= 3'b010;									 
									 data[7:4] <= data[7:4] - 1'b1;
									 data[3:0] <= 4'b1001;
								 end
							 else if(!data[3:0] == 0) 
								 begin
									A <= 3'b100;
									B <= 3'b010;									 
									data[3:0] <= data[3:0] - 1'b1;
								 end 
							 else   stateA <= redA2; 							
						 end
                default : stateA <= redA1 ;
            endcase
    end

endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////


 module show (rst,clk,stopa,stopb,Data,ds,seg);//数码管显示模块
	input clk,rst,stopa,stopb;
	input [15:0]Data;
	output reg [3:0] ds;
	output reg [7:0]seg;

	reg [1:0]BitSel = 2'b0;
	reg [3:0]data;
	
	always@(*)
	begin
		case(data)
			4'b0000: seg[7:0]<=8'b00000011;
			4'b0001: seg[7:0]<=8'b10011111;
			4'b0010: seg[7:0]<=8'b00100101;
			4'b0011: seg[7:0]<=8'b00001101;
			4'b0100: seg[7:0]<=8'b10011001;
			4'b0101: seg[7:0]<=8'b01001001;
			4'b0110: seg[7:0]<=8'b01000001;
			4'b0111: seg[7:0]<=8'b00011111;
			4'b1000: seg[7:0]<=8'b00000001;
			4'b1001: seg[7:0]<=8'b00001001;
			4'b1010: seg[7:0]<=8'b11111101;
			default: seg[7:0]<=8'b11111111;
		endcase
	end
	
	
	always@( posedge clk)
		begin
				begin
					BitSel <= BitSel + 1'b1;
							case(BitSel)
						2'b00: 
							begin 
								ds<=4'b1111;
								//AN<=8'b1111_1110;
								
								if(rst) data <= 4'b1010;
								else if(stopa | stopb) data <=4'b1111;
								else data<=Data[3:0];
							end
						2'b01: 
							begin
								ds<=4'b1110;							
								//AN<=8'b1111_1101;
								
								if(rst) data <= 4'b1010;
								else if(stopa | stopb) data <=4'b1111;
								else data<=Data[7:4];
							end
						2'b10: 
							begin
								ds<=4'b1101;
								//AN<=8'b1111_1011;
								
								if(rst) data <= 4'b1010;
								else if(stopa | stopb) data <=4'b1111;
								else data<=Data[11:8];
							end
						2'b11: 
							begin
								ds<=4'b1100;
								//AN<=8'b1111_0111;
								
								if(rst) data <= 4'b1010;
								else if(stopa | stopb) data <=4'b1111;
								else data<=Data[15:12];
							end							
						default: 
							begin
								ds<=4'b0000;
								data<=4'bzzzz;
								//AN<=4'b1111_1111;
							end
					endcase		
				end
		end
	
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////


module clk_show(clk_in,clk_out);//分频器1（数码管刷新）
	input clk_in;
	reg [11:0] counter = 12'b0;
	output reg clk_out = 1'b0;
	always @(posedge clk_in)
	begin
		if(counter == 11'd2000)
			begin
				clk_out <= ~clk_out;
				counter <= 12'b0;
			end	 
      else
			counter <= counter+1'b1;
   end
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////


module clk_data(rst,clk_in,clk_out);//分频器2（数据刷新）
	input rst,clk_in;
	reg [30:0] counter;
	output reg clk_out;
	always @(posedge clk_in or posedge rst)
	begin
		if (rst)
			begin
				counter <= 31'b0;
				clk_out <= 1'b0;
			end
		else if(counter == 31'd100_0000)
			begin
				clk_out <= ~clk_out;
				counter <= 31'b0;
			end	 
      else
			counter <= counter+1'b1;
   end
endmodule
