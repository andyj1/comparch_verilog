module test_tb;
reg clock;
reg sel1;
reg sel2;
wire out1;
wire out2;


initial begin
	$display( "+−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−+" );
	$display( "| time | sel1 | sel2 | out1 | out2 |" );
	$display( "+−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−+" );
	$display("| %g | %b | %b | %b | %b |", $time, sel1, sel2, out1, out2);
	clock = 0;
	sel1 = 0;
	sel2 = 0;
	#1 sel1 = 1;
	#1 sel1 = 0;
	#1 sel2 = 1;
	#1 sel1 = 1;
	#2 $finish;
end

always begin
	#1 clock = ~clock; // Generate clock
end

twoBitRam ram1(
.sel1 (sel1),
.sel2 (sel2),
.out1 (out1),
.out2 (out2)
);
endmodule

