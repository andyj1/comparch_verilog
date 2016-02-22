//////////////////////////////////////////////////////////////////////////////////
// Module Name: increment.v
// Description: increments 2-bit value from previous
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ns

`include "two_bit_fa.v"

module increment(value, sta, mn, prev_value, instruct);

//−−−−−−−−−−−−−Input Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

input [1:0] instruct; 	//input a 2 bit register from JNO
input [1:0] prev_value;

//−−−−−−−−−−−−−Output Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−

inout [1:0] value;
output sta;
output mn;

//−−−−−−−−−−−−−Input ports Data Type−−−−−−−−−−−−−−−−−−−
// By rule all the input ports should be wires
wire [1:0] instruct;
wire [1:0] clk;
wire [1:0] prev_value;

//−−−−−−−−−−−−−Output Ports Data Type−−−−−−−−−−−−−−−−−−
// Output port can be a storage element (reg) or a wire
wire [1:0] value;
wire sta;
wire mn;

//−−−−−−−−−−−−−Intermediate Wires----−−−−−−−−−−−−−−−−−−


//−−−−−−----−-−−−−−−Instructions---−−−−−−−−−−−−−−−--−−−


and (mn, !instruct[1], !instruct[0]);
fulladder adder(sta, value, prev_value);

endmodule