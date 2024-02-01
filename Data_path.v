module Data_path(
        cnt_clr,
        clk,
        cnt_en,
        Eql_grt,
        Sum
);
input cnt_clr,clk,cnt_en;
output Eql_grt;
output [3:0]Sum;
wire cnt_en;

Counter cnt1(
        .cnt_clr(cnt_clr),
        .clk(clk),
        .cnt(Sum),
        .cnt_en(cnt_en)
        );

Comparator cmp1(
        .clk(clk),
        .cnt(Sum),
        .Eql_grt(Eql_grt)
        );
endmodule
