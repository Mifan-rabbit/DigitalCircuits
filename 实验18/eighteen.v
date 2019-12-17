//用于控制数码管刷新频率
module CLK_5ms(rst,clk_in,clk_out);
	input rst,clk_in;
	reg [10:0] counter;
	output reg clk_out;
	always @(posedge clk_in or posedge rst)
	begin
		if (rst)
			begin
				counter <= 21'b0;
				clk_out <= 1'b0;
			end
		else if(counter == 11'd2)//11'd2000
			begin
				clk_out <= ~clk_out;
				counter <= 11'b0;
			end	 
      else
			counter<=counter+1'b1;
   end
endmodule





//用于控制数字自增速度
module CLK_Data(rst,clk_in,clk_out);
	input rst,clk_in;
	reg [20:0] counter;
	output reg clk_out;
	always @(posedge clk_in or posedge rst)
	begin
		if (rst)
			begin
				counter <= 21'b0;
				clk_out <= 1'b0;
			end
		else if(counter == 21'd32)// 21'd10000000
			begin
				clk_out <= ~clk_out;
				counter <= 21'b0;
			end	 
      else
			counter<=counter+1'b1;
   end
endmodule





//数码管显示
module show(rst,clk,Data,ds,seg);
	input clk,rst;
	input [31:0]Data;
	output reg [3:0] ds;
	output reg [7:0]seg;

	reg [2:0]BitSel;
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
			4'b1010: seg[7:0]<=8'b00010001;
			4'b1011: seg[7:0]<=8'b11000001;
			4'b1100: seg[7:0]<=8'b01100011;
			4'b1101: seg[7:0]<=8'b10000101;
			4'b1110: seg[7:0]<=8'b01100001;
			4'b1111: seg[7:0]<=8'b01110001;
			default: seg[7:0]<=8'b11111111;
		endcase
	end
	
	always@( posedge clk or posedge rst)
		begin
			if(rst) BitSel<=3'b0;
			else
				begin
					BitSel <= BitSel + 1'b1;
							case(BitSel)
						3'b000: 
							begin 
								ds<=4'b1111;
								//AN<=8'b1111_1110;
								data<=Data[3:0];
							end
						3'b001: 
							begin
								ds<=4'b1110;							
								//AN<=8'b1111_1101;
								data<=Data[7:4];
							end
						3'b010: 
							begin
								ds<=4'b1101;
								//AN<=8'b1111_1011;
								data<=Data[11:8];
							end
						3'b011: 
							begin
								ds<=4'b1100;
								//AN<=8'b1111_0111;
								data<=Data[15:12];
							end
						3'b100: 
							begin 
								ds<=4'b1011;
								//AN<=8'b1110_1111;
								data<=Data[19:16];
							end
						3'b101: 
							begin
								ds<=4'b1010;
								//AN<=8'b1101_1111;
								data<=Data[23:20];
							end
						3'b110: 
							begin
								ds<=4'b1001;
								//AN<=8'b1011_1111;
								data<=Data[27:24];
							end
						3'b111: 
							begin
								ds<=4'b1000;
								//AN<=8'b0111_1111;
								data<=Data[31:28];
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





//一位十进制计数器
module numerical(stop,rst,clk,data,out);
	input rst;
	input clk;
	input stop;
	output reg out;
	output reg [3:0] data;
	always@(posedge rst or posedge clk)
	begin
		if(rst)
			begin
				data <= 4'b0;
				out<=1'b0;
			end
		else if(~stop)
			begin
				if(data == 4'b1001)
					begin
						data <= 4'b0;
						out <=1'b1;
					end
				else
					begin
						data <= data + 1'b1;
						out<=1'b0;
					end
			end
	end
endmodule





//8位十进制计数器
module getDATA(stop,rst,clk,Data);
	input rst;
	input clk;
	input stop;
	output [31:0]Data;
	wire out1,out2,out3,out4,out5,out6,out7,out8;
	numerical n0(stop,rst,clk,Data[3:0],out1);
	numerical n1(stop,rst,out1,Data[7:4],out2);
	numerical n2(stop,rst,out2,Data[11:8],out3);
	numerical n3(stop,rst,out3,Data[15:12],out4);
	numerical n4(stop,rst,out4,Data[19:16],out5);
	numerical n5(stop,rst,out5,Data[23:20],out6);
	numerical n6(stop,rst,out6,Data[27:24],out7);
	numerical n7(stop,rst,out7,Data[31:28],out8);	
endmodule





//顶层模块, 控制数字清零、自增、停止自增
module eighteen(stop,rst,clk,ds,seg);
	input rst;
	input clk;
	input stop;
	output [3:0] ds;
	output [7:0] seg; //段选信号
	wire clkData;  //显示数据加1时间间隔
	wire clk5ms;   //扫描显示时间间隔clk_5ms 
	wire [31:0]Data;
	CLK_5ms clk5 (rst,clk,clk5ms);
	CLK_Data clkd (rst,clk,clkData);
	getDATA d(stop,rst,clkData,Data);
	show s (rst,clk5ms,Data,ds,seg);
endmodule
