module Coffee(
Clock,
RSTN_n,
cup_rdy,
cof_rdy,
half_yuan,
one_yuan,
Place_cup,
Release_cof,
Data1,
Data2,
Data3,
Data4,
LCD_EN,
LCD_RW,
LCD_RS,
LCD_DATA
);
input Clock;
input RSTN_n;
input cup_rdy,cof_rdy,half_yuan,one_yuan;
output Place_cup,Release_cof;
wire Place_cup,Release_cof;
wire Eql_grt;
wire [3:0]cnt;

output [6:0] Data1;
output [6:0] Data2;
output [6:0] Data3;
output [6:0] Data4;
wire [6:0] Data1;
wire [6:0] Data2;
wire [6:0] Data3;
wire [6:0] Data4;

output LCD_EN;
output LCD_RW;
output LCD_RS;
output [7:0] LCD_DATA;


Control_unit Control_unit(
.clk(Clock),
.RSTN(RSTN_n),
.cup_rdy(cup_rdy),
.cof_rdy(cof_rdy),
.half_yuan(half_yuan),
.one_yuan(one_yuan),
.place_cup(Place_cup),
.Release_cof(Release_cof),
.present_state(Present_state),
.cnt_en(cnt_en),
.cnt_clr(cnt_clr),
.Eql_grt(Eql_grt),	
.LCD_EN(LCD_EN),
.LCD_RW(LCD_RW),
.LCD_RS(LCD_RS),
.LCD_DATA(LCD_DATA)
);

Data_path Data_path(
.cnt_clr(cnt_clr),
.clk(Clock),
.cnt_en(cnt_en),
.Eql_grt(Eql_grt),
.Sum(cnt)
);

Nixie_tube Nixie_tube(
.Seg(cnt),
.Data1(Data1),
.Data2(Data2),
.Data3(Data3),
.Data4(Data4)
);
		  
endmodule 