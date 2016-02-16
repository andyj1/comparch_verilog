`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:10 02/09/2016 
// Design Name: 
// Module Name:    fulladder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fulladder(c_out, sum, a, b, c_in);
output c_out, sum;
input a,b,c_in;
wire w0, w1, w2;

	xor u0(sum, a, b, c_in);
	and u1(w0, a, b);
	and u2(w1, b, c_in);
	and u3(w2, c_in, b);
	or  u4(c_out, w0, w1, w2)
endmodule