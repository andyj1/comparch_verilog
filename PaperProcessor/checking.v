module checking(checked, enabling, check);

//−−−−−−−−−−−−−Input Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

input [1:0] check; 	//input a 2 bit register from JNO
input enabling;

//−−−−−−−−−−−−−Output Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−

output [1:0] checked;

//−−−−−−−−−−−−−Input ports Data Type−−−−−−−−−−−−−−−−−−−
// By rule all the input ports should be wires
wire [1:0] check;
wire enabling;

//−−−−−−−−−−−−−Output Ports Data Type−−−−−−−−−−−−−−−−−−
// Output port can be a storage element (reg) or a wire
wire [1:0] checked;

//−−−−−−−−−−−−−Intermediate Wires----−−−−−−−−−−−−−−−−−−


//−−−−−−----−-−−−−−−Instructions---−−−−−−−−−−−−−−−--−−−

or o1(checked[1], enabling, check[1]);
or o2(checked[0], enabling, check[0]);


endmodule