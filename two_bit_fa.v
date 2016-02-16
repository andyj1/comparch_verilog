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
module fulladder(c_out, sum0, sum1, a0, b0, a1, b1);
output sum0, sum1, c_out;
input a0, b0, a1, b1;
wire w0, w1, w2, w3;

	xor u0(sum0, a0, b0); //LSB of output (sum1,sum0)
	and u1(w0, a0, b0);
	xor u2(w1, a1, b1);
	and u3(w2, a1, b1);

	and u4(w3, w0, w1);
	xor u5(sum1, w0, w1); //MSB of output (sum1,sum0)

	or  u6(c_out, w2, w3); //carry out	
endmodule