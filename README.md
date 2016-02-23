# Team Name: 	Aardvark
# Team Members: Andy Jeong, Gordon Macshane, Brenda So

To compile, run and show waveform using gtkwave simulator:
	make –f Makefile
	
What is under Makefile?
            SOURCE = main_tb.v
            WAVE = gtkwave
            all: 
              	iverilog -o pp.vvp $(SOURCE)
              	vvp pp.vvp
                $(WAVE) pp.vcd
            clean:
	              rm -rf *.vvp *.vcd
Optional: 

To compile separately on terminal: 
	iverilog -o <objectname> main_tb.v
	
To run the compiled object file:
	vvp <objectname>
	
To change the instruction:
	change the bits in instruct.bin

