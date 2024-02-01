module Counter(
cnt_clr,
clk,
cnt,
cnt_en
);
		  
input cnt_en;
input cnt_clr;
input clk;

output [3:0]cnt;

reg [3:0]cnt;

always @ (negedge cnt_clr or posedge clk)
begin
	if(!cnt_clr)
		cnt<=4'b0000;
	else	if(cnt_en)
		cnt<=cnt+3'b1;
	else	if(cnt==4'b0111)
		cnt<=4'b0000;
	else
		cnt<=cnt;
end

endmodule 