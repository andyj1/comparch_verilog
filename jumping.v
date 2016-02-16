`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: 2-bit RAM
// Description: 
// Author: Andy Jeong
//////////////////////////////////////////////////////////////////////////////////

module ram(status, a0, b0, clk);
input a0, b0, status;
reg[1:0] count;

wire w0, w1, w2, w3;

initial
	    count = 2'b0;
fork
	and u0(w0, !status, !a0, b0);
	d_flip_flop flip(w1, w0, clk);
	and u1(w2, a0, w1);
	and u2(w3, b0, w1);

//Program Counter
always @ ( negedge clk )
	    count[0] <= ~count[0];

	always @ ( negedge count[0] )
	    count[1] <= ~count[1];

assign count[0] = w2;
assign count[1] = w3;

join
endmodule