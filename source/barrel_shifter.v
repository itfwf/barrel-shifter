module barrel_shiter(in,shift_by,RS,CK,shift_l_r,p_load,out);

input RS, CK, shift_l_r, p_load;
input [7:0]in;
input [2:0] shift_by;
output [7:0] out;
reg[7:0] q;

integer index;

always @(posedge RS)
begin
	if(RS)
		q<=8'b0;
end

always @(posedge CK)
begin

if(p_load==1'b1 )
begin	

q=in;
	if(shift_l_r==1'b0)
	begin
		for(index = 0; index <shift_by; index = index + 1) begin
    			q={q[6:0],q[7]};
  		end
	end
	else begin
		for(index = 0; index <shift_by; index = index + 1) begin
    			q={q[0],q[7:1]};
  		end
	end
	

end
end
assign out=q;
endmodule