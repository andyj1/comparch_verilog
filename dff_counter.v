`include "dff.v"
module dff_counter(clock, status, data, prev_address, address);

//−−−−−−−−−−−−−Input Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

input status;
input clock;
input [1:0] data;
input [1:0] prev_address;

//−−−−−−−−−−−−−Output Ports−−−−−−−−−−−−−−−−−−−−−−−−−−−−

output [1:0] new_address;

wire w1,w2;
and a1(w1,data[1],prev_address[1]);
and a2(w2,status,data[0],)

endmodule