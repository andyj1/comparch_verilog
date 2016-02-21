`include "dff.v"
`include "datablock.v"
module dff_test();

reg CLK;
wire D0, D1;

wire Q0, Q1;
wire Q0bar, Q1bar;
wire w1, w2;

reg Q0out;
reg Q0nout;

reg Q1out;
reg Q1nout;

reg R0;
reg S0;
reg R1;
reg S1;
reg Da1;
reg Da0;
reg status;

// Testbench of above code
initial begin
  $monitor("Time = %t CLK = %b Q1 = %b  Q0 = %b",$time, CLK, Q1, Q0);
  CLK = 0;

  R0 = 0;
  S0 = 0;
  R1 = 0;
  S1 = 0;

  Q0out = 0;
  Q0nout = 1;
  Q1out = 0;
  Q1nout = 1;
  status = 0;

  Da1 = 0;
  Da0 = 0;

  #1 R0 = 1;
  R1 = 1;
  #4 R0 = 0;
  R1 = 0;

  #40 $finish;
end	

always begin
	#5 CLK = ~CLK;
end

always @(posedge CLK)
begin
	Q0out <= Q0;
	Q1out <= Q1;
	Q0nout <= Q0bar;
	Q1nout <= Q1bar;
end

dff dff0(CLK, S0, R0, D0, Q0, Q0bar);
dff dff1(CLK, S1, R1, D1, Q1, Q1bar);

and (w1, Q0bar, Q1);
and (w2, Q1bar, Q0);
or (D1, w1, w2);
and (D0, Q0bar,1);

//addressblock addr(Q1, Q0, Da1, Da0, Q1out, Q0out, status);

endmodule

