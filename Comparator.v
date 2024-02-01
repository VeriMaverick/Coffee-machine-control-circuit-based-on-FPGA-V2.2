module Comparator(
clk,
cnt,
Eql_grt, 
);
input clk;
input [3:0]cnt;

output Eql_grt;

reg Eql_grt;

always @( posedge clk ) 
begin
        if(cnt >= 4'b0110)
        Eql_grt<=1'b1;
        else
        Eql_grt<=1'b0;   
end 
    
endmodule 