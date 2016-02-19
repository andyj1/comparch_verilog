
//////////////////////////////////////////////////////////////////////////////////
// Module Name: 2-bit fulladder 
// Description: This is last updated 2/19/2016 3:11 am. When ran this should 
// print out only the increment logic
// Author: Andy Jeong
// Note: in this adder, one is always adding 1 to the previous number
//////////////////////////////////////////////////////////////////////////////////

`include "twoBitRam.v"
`include "two_bit_fa.v"
module test_tb(); 
reg status; // status register
reg clock; // clock register
reg s1; // program counter LSB
reg s2; // program counter MSB
reg [0:1] out; 
wire [0:1] adder_to_out;
wire adder_to_stat;
wire [0:1] instruct; // output instruction from RAM (LSB)


initial begin

	//print out things to monitor
	$monitor ("time = %g s1 = %b s2 = %b instruct1 = %b instruct2 = %b out1 = %b out2 = %b stat = %b", $time, s1, s2, instruct[0], instruct[1],out[0], out[1],status);

	clock = 0; //initialize clock to be 0
	status = 0; //initialize status to be 0
	out[0] = 0; // initialize LSB to be 0
	out[1] = 0; // initialize MSB to be 0

	//following two lines are also for testing purposes
	s1 = 0;
	s2 = 0;
	#10 s2 = 1;
	//let the simulation run for 15 seconds
	#15 $finish;
end


//only when the instructions are 00
always @(posedge clock & !instruct[0] & !instruct[1])
begin
	out[0] <= adder_to_out[0];
	out[1] <= adder_to_out[1];
end


//set the status such that once the status turns 1 it would never change back
//to zero
always @(posedge clock & !instruct[0] & !instruct[1] &!status)
begin
	status <= adder_to_stat;
end


//Set the clock to alter every second
always begin
	#1 clock = ~clock; // Generate clock
end

//Connect twoBitRam to test bench
twoBitRam ram1(
s1, 
s2,
instruct
);

//Connect fullAdder to test bench
fulladder adder1(
adder_to_stat,
adder_to_out,
out
);


endmodule

