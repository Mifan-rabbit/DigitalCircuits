`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      番番
// 
// Create Date:    09:35:45 05/30/2020 
// Design Name: 
// Module Name:    TOP 
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
module TOP(clka, rst, PC, Inst_code, ALU_OP, Write_Reg, rs, rt, rd, rs_data, rt_data, rd_data, shamt, ZF, OF);
	input clka;
	input rst;
	output [31:0]PC;	
	output [31:0]Inst_code;	//指令
	output [2:0] ALU_OP;	//操作符
	output Write_Reg;	//是否写入寄存器
	output [4:0] rs;	//rs地址
	output [4:0] rt;	//rt地址
	output [4:0] rd;	//rd地址
	output [31:0] rs_data;  //rs数据
	output [31:0] rt_data;  //rt数据
	output [31:0] rd_data;  //rd数据
	output [4:0] shamt;
	output reg ZF, OF; 
	wire Set_ZF, Set_OF;
	wire FR_ZF, FR_OF;
	wire rs_shamt;
	wire [31:0] alu_a;

	always@(negedge clka or posedge rst)
	begin
		if(rst)
			begin
				OF = 1'b0;
				ZF = 1'b0;
			end
		else
			begin
			if(Set_OF) OF = FR_OF;
			if(Set_ZF) ZF = FR_ZF;
			end
	end

	
	// 连接指令存储器和取指令部件
	Get_Inst get_inst (clka, rst, Inst_code, PC);
	// 译码及控制单元 
	analysis a(Inst_code, ALU_OP, Write_Reg, rs, rt, rd, shamt, Set_ZF, Set_OF, rs_shamt);
	// ALU、寄存器连接
	assign alu_a = (rs_shamt)?{{27{1'b0}},shamt}: rs_data;
	REG r (clka, rst, Write_Reg, rs, rt, rd, rd_data, rs_data, rt_data);
   ALU alu (ALU_OP, alu_a, rt_data, rd_data, FR_ZF, FR_OF);	 
endmodule



module Get_Inst(clka, rst, Inst_code, PC);
	input clka;
	input rst;
	
	output [31:0]Inst_code;
	output reg [31:0]PC;
	
	// R型指令的下一个PC
	wire [31:0]PC_new;	
	assign PC_new = PC+4;
	
	always @(negedge clka or posedge rst)
	begin
		if(rst) 
			PC <= 32'h00000000;//清零
		else
			PC <= PC_new;
	end

	myInst mmyinst (
	  .clka(clka), // input clka
	  .addra(PC[7:2]), // input [5 : 0] addra
	  .douta(Inst_code) // output [31 : 0] douta
	);

endmodule



module analysis(inst,ALU_OP,Write_Reg,rs,rt,rd,shamt,Set_ZF,Set_OF,rs_shamt);
	input [31:0] inst;
	output reg [2:0] ALU_OP;
	output reg Write_Reg;
	output reg [4:0] rs;
	output reg [4:0] rt;
	output reg [4:0] rd;
	output reg Set_ZF, Set_OF;
	output reg [4:0] shamt;
	output reg rs_shamt;
always@(*)
begin
	if(inst[31:26]==6'b000000) //判断是否为R型
    begin
      rs=inst[25:21];       //rs
      rt=inst[20:16];       //rt	 
      rd=inst[15:11];       //rd 
		shamt = inst[10:6];
		Write_Reg=1;
		Set_ZF=1'b1; 
		Write_Reg=1'b1;
		rs_shamt=1'b0;

		case(inst[5:0])   //映射对应的ALU
         6'b100000:begin ALU_OP=3'b100;Set_OF=1'b1;end
         6'b100010:begin ALU_OP=3'b101;Set_OF=1'b1;end
         6'b100100:begin ALU_OP=3'b000;Set_OF=1'b0;end
         6'b100101:begin ALU_OP=3'b001;Set_OF=1'b0;end
         6'b100110:begin ALU_OP=3'b010;Set_OF=1'b0;end
         6'b100111:begin ALU_OP=3'b011;Set_OF=1'b0;end
         6'b101011:begin ALU_OP=3'b110;Set_OF=1'b0;end 
         6'b000100:begin ALU_OP=3'b111;Set_OF=1'b1;end 
         6'b001000:begin ALU_OP=3'b100;Set_OF=1'b1;end         
			6'b000000:begin ALU_OP=3'b111;Set_OF=1'b1;rs_shamt=1'b1;end

			default:begin ALU_OP=3'bxxx;end
		endcase
     end 
end
endmodule



module ALU(OP,A,B,F,ZF,OF); 
    input [2:0] OP;
    input [31:0] A;
    input [31:0] B;
    output reg [31:0] F;
    output reg ZF, OF; 
    reg C; //最高位进位
    always@(*)
    begin
       C=1'b0;
		 OF=1'b0;
       case(OP)
				//位与操作
            3'b000:begin F=A&B; end
    			//位或操作
            3'b001:begin F=A|B; end
  				//位异或操作
            3'b010:begin F=A^B; end
  				//位或非操作
            3'b011:begin F=~(A|B); end 
				//算术加操作
            3'b100:begin {C,F}=A+B; OF = A[31]^B[31]^F[31]^C;	end 
				//算术减操作
            3'b101:begin {C,F}=A-B; OF = A[31]^B[31]^F[31]^C;	end 
				//若A＜B，则输出1，否则输出0 
            3'b110:begin if(A<B) F=1'b1; else F=1'b0; end   //F=A<B
				//B逻辑左移A所指定的位数 
            3'b111:begin F=B<<A; OF = B[31]^F[31];	 end
				default;
        endcase

			//0标志位, 运算结果为0(全零)则置1, 否则置0 
        ZF = F==32'h0000_0000;
    end
endmodule



module REG(CLK,Reset,Write_Reg,R_Addr_A,R_Addr_B,W_Addr,W_Data,R_Data_A,R_Data_B);
	input CLK; //用于写入寄存器
	input Reset; //用于初始化寄存器
	input Write_Reg;//写控制信号
	input [4:0]R_Addr_A,R_Addr_B;//寄存器地址
	input [4:0]W_Addr;//写寄存器地址
	input [31:0]W_Data;//写入数据
	output [31:0]R_Data_A,R_Data_B;//端口读出数据
	
	reg [31:0] REG_Files[0:31];
	integer i;
	initial for(i=0;i<32;i=i+1) REG_Files[i]<=32'h00000000; //初始化寄存器
	always @(negedge CLK or posedge Reset)		//下降沿存储
	begin
		if(Reset)
			begin
				for(i=0;i<32;i=i+1) REG_Files[i]<=32'h0000_0000;  
			end
		else if(W_Addr != 5'b00000)
			//寄存器模块，$0 要始终置为 要始终置为 0（不允许写入操作）
			begin
				if(Write_Reg) REG_Files[W_Addr]<=W_Data;
			end
	end
	assign R_Data_A=REG_Files[R_Addr_A];
	assign R_Data_B=REG_Files[R_Addr_B];
endmodule


module LED(clka, clk_in, rst, choice, AN, seg, ZF, OF, PC, Inst_code, rd_data, Data);
	input clka;	
	input clk_in;
	input rst;
	input [1:0] choice;
	 
	output [7:0] AN;
	output [7:0] seg;//段选信号
	output ZF, OF;	
	
	wire [2:0] ALU_OP;	//操作符
	wire Write_Reg;	//是否写入寄存器
	wire [4:0] rs;	//rs地址
	wire [4:0] rt;	//rt地址
	wire [4:0] rd;	//rd地址
	wire [31:0] rs_data;  //rs数据
	wire [31:0] rt_data;  //rt数据
	
	output [31:0] PC;	
	output [31:0] Inst_code;	//指令
	output [31:0] rd_data;  //rd数据
	
	wire clk_out;    
	wire [4:0] shamt; 
	output reg [31:0]Data;
	
	always@(*)
	begin
		case(choice)
			2'b00: Data<=rd_data;
			2'b01: Data<=Inst_code; 
			default: Data<=PC;
		endcase
	end
	
	shuaXin sshu(~rst, clk_in, clk_out);
	show ssho(~rst, clk_out, Data, AN, seg);
	TOP top (~clka, ~rst, PC, Inst_code, ALU_OP, Write_Reg, rs, rt, rd, rs_data, rt_data, rd_data, shamt, ZF, OF);
	 
	
endmodule


//用于控制数码管刷新频率
module shuaXin(rst,clk_in,clk_out);
	input rst,clk_in;
	reg [10:0] counter;
	output reg clk_out;
	always @(posedge clk_in or posedge rst)
	begin
		if (rst)
			begin
				counter <= 11'b0;
				clk_out <= 1'b0;
			end
		else if(counter == 11'd2000)//11'd2
			begin
				clk_out <= ~clk_out;
				counter <= 11'b0;
			end	 
      else
			counter<=counter+1'b1;
   end
endmodule

//数码管显示
module show(rst,clk,Data,AN,seg);
	input clk,rst;
	input [31:0]Data;
	//output reg [3:0] ds;
	output reg [7:0] seg;
	output reg [7:0] AN;

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
	
	always@(posedge clk or posedge rst)
		begin
			if(rst) BitSel<=3'b0;
			else
				begin
					BitSel <= BitSel + 1'b1;
							case(BitSel)
						3'b000: 
							begin 
								//ds<=4'b1111;
								AN<=8'b1111_1110;
								data<=Data[3:0];
							end
						3'b001: 
							begin
								//ds<=4'b1110;							
								AN<=8'b1111_1101;
								data<=Data[7:4];
							end
						3'b010: 
							begin
								//ds<=4'b1101;
								AN<=8'b1111_1011;
								data<=Data[11:8];
							end
						3'b011: 
							begin
								//ds<=4'b1100;
								AN<=8'b1111_0111;
								data<=Data[15:12];
							end
						3'b100: 
							begin 
								//ds<=4'b1011;
								AN<=8'b1110_1111;
								data<=Data[19:16];
							end
						3'b101: 
							begin
								//ds<=4'b1010;
								AN<=8'b1101_1111;
								data<=Data[23:20];
							end
						3'b110: 
							begin
								//ds<=4'b1001;
								AN<=8'b1011_1111;
								data<=Data[27:24];
							end
						3'b111: 
							begin
								//ds<=4'b1000;
								AN<=8'b0111_1111;
								data<=Data[31:28];
							end							
						default: 
							begin
								//ds<=4'b0000;
								AN<=8'b1111_1111;
								data<=4'bzzzz;
							end
					endcase		
				end
		end	
endmodule
