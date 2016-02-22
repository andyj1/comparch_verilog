
//////////////////////////////////////////////////////////////////////////////////
// Module Name: 2-bit fulladder 
// Description: This is last updated 2/19/2016 3:11 am. When ran this should 
// print out only the increment logic
// Author: Andy Jeong
// Note: in this adder, one is always adding 1 to the previous number
//////////////////////////////////////////////////////////////////////////////////

`include "twoBitRam.v"
`include "increment.v"
`include "programcounter.v"
`include "halt.v"
`include "jno.v"
`include "checking.v"
`include "dff.v"
`include "dfff.v"

module test_tb(); 

reg status; 						// status register
reg clock; 							// clock register
wire monostable;					// monostable clock induced by inc logic
wire pulse;							// clock induced by halt
wire monostabler;
reg [1:0] out; 						// output registers
wire w3, w4, w5, w6;
wire openpulser;					//Pulse from JNO, imitating monostable timer

reg [1:0] constant; 				// INC logic: add to full adder
wire [1:0] adder_to_out; 			// INC logic :connect adder to reg out
wire adder_to_stat;					// ING logic: ddding to status
wire [1:0] instruct; 				// output instruction from RAM (LSB)
wire [1:0] instructA;				// actual instruction after checking
reg [1:0] Resetter;					//used to initialize the program counter

wire enabled, enabled_sta;
wire [1:0] PC;						// Counter: program counter output

initial begin

	//print out things to monitor
	$monitor ("time = %g\t PC = %b instruct = %b out = %b stat = %b", $time, PC, instruct, out, status);

	clock = 0; 				// initialize clock to be 0
	status = 0; 			// initialize status to be 0

	out[0] = 0; 			// initialize LSB to be 0
	out[1] = 0; 			// initialize MSB to be 0
	constant[0] = 1; 		// constant added to adder
	constant[1] = 0; 		// constant added to adder
	Resetter[1] = 0;
	Resetter[0] = 0;

	#1 Resetter[1] = 1;
	Resetter[0] = 1;
	#1 Resetter[1] = 0;
	Resetter[0] = 0;
 	//let the simulation run for 15 seconds
	#80 $finish;
end

//only when the instructions are 00
always @(posedge monostabler)
begin
	out[0] <= adder_to_out[0];
	out[1] <= adder_to_out[1];
end

//set the status such that once the status turns 1 it would never change back
//to zero
always @(posedge monostabler)
begin
	status <= adder_to_stat;
end

//Set the clock to alter every second
always begin
	#4 clock = ~clock; // Generate clock
end


//Connect twoBitRam to test bench

twoBitRam ram1(
PC,
instruct
);

//connect increment blackbox to testbench
increment inc(
adder_to_out, 
adder_to_stat,
pulse, 
monostable, 
out,
instructA);

//connect counter to testbench
programcounter pc(
PC, 
openpulser,
Resetter,
instruct, 
pulse, 
enabled_sta);

and (monostabler, monostable, !status);

//connect halt blackbox to program counter
halt hlt(
pulse,
clock,
instructA);

//connect jno blackbox to checking logic
jno jnoo(enabled, enabled_sta, openpulser, status, instructA, pulse);
checking checkers(instructA, enabled, instruct);

endmodule

