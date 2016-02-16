module twoBitRam(sel1, sel2, out1, out2);

//Specifying input and output
input sel1, sel2;
output out1, out2;

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
reg in1_msb = 0;
reg in1_lsb = 0;
reg in2_msb = 0;
reg in2_lsb = 1;
reg in3_msb = 0;
reg in3_lsb = 0;
reg in4_msb = 1;
reg in4_lsb = 0;

//Muxing things together
not inv1(sel1_bar, sel1);
not inv2(sel2_bar, sel2);

//First Demux
and and1_msb(a1_msb, sel1_bar, sel2_bar, in1_msb);
and and2_msb(a2_msb, sel1, sel2_bar, in2_msb);
and and3_msb(a3_msb, sel1_bar, sel2, in3_msb);
and and4_msb(a4_msb, sel1, sel2, in4_msb);

//Second Demux
and and1_lsb(a1_lsb, sel1_bar, sel2_bar, in1_lsb);
and and2_lsb(a2_lsb, sel1, sel2_bar, in2_lsb);
and and3_lsb(a3_lsb, sel1_bar, sel2, in3_lsb);
and and4_lsb(a4_lsb, sel1, sel2, in4_lsb);

//Final Or Gate
or or_msb(out1,a1_msb,a2_msb,a3_msb,a4_msb);
or or_lsb(out2,a1_lsb,a2_lsb,a3_lsb,a4_lsb);

endmodule
