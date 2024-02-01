module Nixie_tube(
Seg,
Data1,
Data2,
Data3,
Data4
);
input [3:0]Seg;

output Data1;
output Data2;
output Data3;
output Data4;

reg [6:0] Data1;
reg [6:0] Data2;
reg [6:0] Data3;
reg [6:0] Data4;

always @ (Seg)
	begin
		case(Seg)
			4'd0:   begin Data1=7'b1000000;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd1:   begin Data1=7'b1111001;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
         4'd2:   begin Data1=7'b0100100;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
         4'd3:   begin Data1=7'b0110000;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd4:   begin Data1=7'b0011001;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd5:   begin Data1=7'b0010010;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd6:   begin Data1=7'b0000010;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd7:   begin Data1=7'b1111000;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd8:   begin Data1=7'b0000000;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			4'd9:   begin Data1=7'b0010000;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
			default:begin Data1=7'b0111111;  Data2=7'b0001001; Data3=7'b0010010; Data4=7'b1000000;end
		endcase 
	end
endmodule 