`include "twoBitRam.v"
module test_tb();
reg clock;
reg s1;
reg s2;
wire out1;
wire out2;


initial begin

	$monitor (
	   "time = %g\t s1 = %b s2 = %b out1 = %b out2 = %b",
	   $time, s1, s2, out1, out2);

	clock = 0;
	s1 = 1'b0;
	s2 = 1'b0;
	
	#5 s1 = 1'b1;
	#5 s1 = 1'b0;
	#5 s2 = 1'b1;
	#5 s1 = 1'b1;
	#10 $finish;
end

always begin
	#5 clock = ~clock; // Generate clock
end


//Connect twoBitRam to test bench
twoBitRam ram1(
s1,
s2,
out1,
out2
);
endmodule

