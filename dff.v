module dff (clk, s, r, d, q);
	input clk, s, r, d;
	output q;
	reg q;
	always @(posedge r)
		q = 1'b0;
	always @(posedge s)
		q = 1'b1;
	always @(posedge clk)
		q = #1 d;
endmodule