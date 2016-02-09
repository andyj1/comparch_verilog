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
module fulladder(carry, sum, a, b, cin);
output carry, sum;
input a,b,cin;
wire w0, w1, w2;

	xor u0(sum, a, b, cin);
	and u1(w0, a, b);
	and u2(w1, b, cin);
	and u3(w2, cin, b);
	or  u4(carry, w0, w1, w2)
endmodule