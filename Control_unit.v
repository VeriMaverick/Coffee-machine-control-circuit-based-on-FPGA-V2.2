module Control_unit(
clk,
RSTN,
cup_rdy,
cof_rdy,
place_cup,
Release_cof,
half_yuan,
one_yuan,
present_state,
cnt,
cnt_en,
cnt_clr,
Eql_grt,
LCD_EN,
LCD_RW,
LCD_RS,
LCD_DATA
);

input clk;
input RSTN;
input cup_rdy;
input cof_rdy;
input half_yuan;
input one_yuan;
input Eql_grt;


output place_cup;
output Release_cof;
output present_state;
output cnt_en;
output cnt_clr;
output [3:0]cnt;

reg cnt_clr,a,b,c,d,e,f;
reg cnt_en, place_cup,Release_cof;
reg [3:0]present_state,next_state;

output LCD_EN;
output LCD_RW;
output LCD_RS;

output [7:0] LCD_DATA;
reg [127:0] row_1;
reg [127:0] row_2;

LCD_Driver U1(
.CLOCK(clk),
.rst_n(RSTN),
.LCD_EN(LCD_EN),
.LCD_RW(LCD_RW),
.LCD_RS(LCD_RS),
.LCD_DATA(LCD_DATA),
.row_1(row_1),
.row_2(row_2)
);

parameter Init=3'b000;
parameter Wait=3'b010;
parameter Add_a=3'b110;
parameter Add_b=3'b100;
parameter comp=3'b111;
parameter Place=3'b001;
parameter Release=3'b011;

always @ (posedge clk)
begin
 a<=~one_yuan;
 b<=a;
 c<=a&&(~b);
end

always @ (posedge clk)
begin
 d<=~half_yuan;
 e<=d;
 f<=d&&(~e);
end

always @ (negedge clk or negedge RSTN)
begin
	if(!RSTN)//复位
		present_state<=Init;
	else
		present_state<=next_state;
end	

always @ (*)
begin
	case(present_state)
		Init: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0000;
				next_state<=Wait;
			end
		Wait : 
			begin
				row_1 <="Please invest 1 ";    //第一行显示的16*1字节个内容
				row_2 <="RMB or 0.5 RMB! ";    //第二行显示的16*1字节个内容
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0100;
				if(f)
					next_state<=Add_b;
				else if(c)
					next_state<=Add_a;
				else
					next_state<=Wait;
			end
		Add_a: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b1100;
				next_state<=Add_b;
			end
		Add_b: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b1100;
				next_state<=comp;
			end
		comp: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0100;
				if(Eql_grt)
					next_state<=Place;
				else
					next_state<=Wait;
        end
		Place: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0110;
				if(!cup_rdy)
					begin
						next_state<=Place;
						row_1 <="The cup is alre-";    //第一行显示的16*1字节个内容
						row_2 <="ady in place !  ";
					end
				else
					begin
						next_state<=Release;
						row_1 <="The cup is alre-";    //第一行显示的16*1字节个内容
						row_2 <="ady in place !  "; 
					end
			end
		Release: 
			begin
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0101;
				if(!cof_rdy)
					begin
						next_state<=Release;
						row_1 <="Please enjoy yo-";    //第一行显示的16*1字节个内容
						row_2 <="ur coffee <^.^> "; 	
					end			
				else
					next_state<=Init;
			end
		default:
			begin
				next_state<=Init; 
				{cnt_en,cnt_clr,place_cup,Release_cof}=4'b0100;
			end
	endcase
end
endmodule 