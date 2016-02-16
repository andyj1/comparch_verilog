module twoBitRam(sel1, sel2, out1, out2);

//−−−−−−−−−−−−−Input Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

input sel1;
input sel2;

//−−−−−−−−−−−−−Output Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−

output out1;
output out2;

//−−−−−−−−−−−−−Input ports Data Type−−−−−−−−−−−−−−−−−−−
// By rule all the input ports should be wires
wire sel1;
wire sel2;

//−−−−−−−−−−−−−Output Ports Data Type−−−−−−−−−−−−−−−−−−
// Output port can be a storage element (reg) or a wire
wire out1;
wire out2;


//−−−−−−----−-−−−−−−Instructions---−−−−−−−−−−−−−−−--−−−
/*
Instructions:
INC: 00
JNO: 01
HLT: 10

in1: INC
in2: JNO
in3: 00
in4: HLT
*/

//set the 4 inputs to the RAM Chip
//reg in1_msb = 1'b0;
//reg in1_lsb = 1'b0;
//reg in2_msb = 1'b0;
//reg in2_lsb = 1'b1;
//reg in3_msb = 1'b0;
//reg in3_lsb = 1'b0;
//reg in4_msb = 1'b1;
//reg in4_lsb = 1'b0;


//First Demux
and and1_msb(a1_msb, !sel1, !sel2, 1'b0);
and and2_msb(a2_msb, !sel1, sel2, 1'b0);
and and3_msb(a3_msb, sel1, !sel2, 1'b0);
and and4_msb(a4_msb, sel1, sel2, 1'b1);

//Second Demux
and and1_lsb(a1_lsb, !sel1, !sel2, 1'b0);
and and2_lsb(a2_lsb, !sel1, sel2, 1'b1);
and and3_lsb(a3_lsb, sel1, !sel2, 1'b0);
and and4_lsb(a4_lsb, sel1, sel2, 1'b0);

//Final Or Gate
or or_msb(out1,a1_msb,a2_msb,a3_msb,a4_msb);
or or_lsb(out2,a1_lsb,a2_lsb,a3_lsb,a4_lsb);


endmodule
