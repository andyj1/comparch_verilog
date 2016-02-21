
//////////////////////////////////////////////////////////////////////////////////
// Module Name: 2-bit fulladder 
// Description: This is last updated 2/19/2016 3:11 am. When ran this should 
// print out only the increment logic
// Author: Andy Jeong
// Note: in this adder, one is always adding 1 to the previous number
//////////////////////////////////////////////////////////////////////////////////

`include "twoBitRam.v"
`include "two_bit_fa.v"
`include "dff.v"
module test_tb(); 

reg status; 						// status register
reg clock; 							// clock register
wire clocky;						// clocky that filters clock and instruct = 11
reg [1:0] out; 						// output registers
wire w3, w4, w5;

reg [1:0] constant; 				// INC logic: add to full adder
wire [1:0] adder_to_out; 			// INC logic :connect adder to reg out
wire adder_to_stat;					// ING logic: ddding to status
wire [1:0] instruct; 				// output instruction from RAM (LSB)

reg S0, R0, S1, R1;		  			// Counter: set and reset registers
reg PC0, PC1, PCn0, PCn1;			// Counter: program counter output
wire D0, D1, Q0, Q1, Q0bar, Q1bar; 	// Counter: wires to d flip flops
wire w1, w2;						// Counter: intermediate wires for program counter
reg [1:0] R;						// Counter: reset
reg [1:0] S;						// Counter: set

initial begin

	//print out things to monitor
	$monitor ("time = %g\t clock = %b PC = %b%b instruct = %b%b out = %b%b stat = %b", $time, clock, PC1, PC0 , instruct[1], instruct[0], out[1], out[0],status);

	clock = 0; 				// initialize clock to be 0
	status = 0; 			// initialize status to be 0

	out[0] = 0; 			// initialize LSB to be 0
	out[1] = 0; 			// initialize MSB to be 0
	constant[0] = 1; 		// constant added to adder
	constant[1] = 0; 		// constant added to adder

	R[0] = 0;				// reset[0] is zero
  	R[1] = 0;				// reset[1] is zero
  	S[0] = 0;				// set[0] is zero
  	S[1] = 0;				// set[1] is zero

  	PC0 = 0;				//initialize d flip flop 0
  	PCn0 = 1;				//initialize d flip flop 0
  	PC1 = 0;				//initialize d flip flop 1
  	PCn1 = 1;				//initialize d flip flop 1

	#1 R[0] = 1;				//reset
	   R[1] = 1;				//reset
	#4 R[0] = 0;
	   R[1] = 0;

	//let the simulation run for 15 seconds
	#30 $finish;
end


//only when the instructions are 00
always @(posedge clocky & !instruct[0] & !instruct[1])
begin
	out[0] <= adder_to_out[0];
	out[1] <= adder_to_out[1];
end

//only when the instructions are 01
//always @(posedge clocky & !instruct[0] & instruct[1])
//begin
	//JNO logic
//end


//set the status such that once the status turns 1 it would never change back
//to zero
always @(posedge clocky & !instruct[0] & !instruct[1] &!status)
begin
	status <= adder_to_stat;
end


//Set the clock to alter every second
always begin
	#2 clock = ~clock; // Generate clock
end

//set the program counter to alter every second
always @(posedge clocky)
begin
	PC0 <= Q0;
	PC1 <= Q1;
	PCn0 <= Q0bar;
	PCn1 <= Q1bar;
end

//Connect twoBitRam to test bench
twoBitRam ram1(
PC0, 
PC1,
instruct
);

//Connect fullAdder to test bench
fulladder adder1(
adder_to_stat,
adder_to_out,
out,
constant
);

and (w3, clock, !instruct[1], instruct[0]);
and (w4, clock, !instruct[1], !instruct[0]);
and (w5, clock, instruct[1], instruct[0]);

or (clocky, w3, w4, w5);

//Connection of 2 bit dff counter with ability to set and reset
dff dff0(clocky, S[0], R[0], D0, Q0, Q0bar);
dff dff1(clocky, S[1], R[1], D1, Q1, Q1bar);
and (w1, Q0bar, Q1);
and (w2, Q1bar, Q0);
or (D1, w1, w2);
and (D0, Q0bar,1);

endmodule

