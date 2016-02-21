`include "jk.v"
module jk_tb();

reg clock;
reg j1;
reg k1;
reg clear;
reg qreg;
reg qnreg;

wire qout;
wire qnout;
wire a1;

initial begin
	$monitor ("Time = %t clk = %b qout = %b qnout = %b",$time, clock, qout, qnout);
	j1 = 1;
	k1 = 1;
	qreg = 0;
	qnreg = 1;
	clock = 0;
	clear = 1;
	assign qout = 1;
	#2 clear = 0;
	#10 $finish;
end


//Configure clock with DFF
always begin
	#1 clock = ~clock;
end

//Connect dflipflop to DUT
jk jk1(j1,k1,clock,clear,qout,qnout);

endmodule

