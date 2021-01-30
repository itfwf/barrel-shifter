module test_shifter();

reg RS, CK, shift_l_r, p_load;
reg [7:0]in;
reg [2:0] shift_by;
wire [7:0] out;
integer idx=0;
barrel_shiter dut(.in(in),.RS(RS),.CK(CK),.shift_l_r(shift_l_r),.p_load(p_load),.shift_by(shift_by),.out(out));

initial begin

RS=1'b0;
CK=1'b0;
in=8'b01011010;
p_load=1'b0;
shift_by=idx;
//shift left
shift_l_r=1'b0; //left
#2 RS=1'b1; p_load=1'b1;
#3 RS=1'b0;

for(idx=0;idx<=3'b111;idx=idx+1)
	#10 shift_by=idx;

#10 shift_by=3'b0;
shift_l_r=1'b1;


for(idx=0;idx<=3'b111;idx=idx+1)
	#10 shift_by=idx;

end
always #3 CK=~CK;
endmodule