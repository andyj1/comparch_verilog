module dff (clk, s, r, d, q, qbar);
	input clk, s, r, d;
	output q,qbar;
	reg q,qbar;
	always @(posedge r) begin
		q = 1'b0;
		qbar = 1'b1;
		end
	always @(posedge s) begin
		q = 1'b1;
		qbar = 1'b0;
		end
	always @(posedge clk) begin
		//#1;
		q = d;
		qbar = ~d;
		end

endmodule