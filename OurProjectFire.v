//OurProjectFire.v
// Example of comparator using UDP Table; For event detection (Fire).
//Case 5: Figure 9 (b) GTKWave waveform for Trustworthy Event Detection using PLD/User Defined Primitive (UDP) 
//(Logic Object Domain - I, Logic Object Domain - II, and Logic Object Domain- III) for Smart Irrigation System.
//Here we are using three different variables for three different sensors and two outputs one for the actual 
//output for an event and one for the flag (i.e., Gray Code). We use Intel Core i7, 16 GB RAM, Win 10, 64 Bit 
//OS. We utilised the latest version of the Icarus Verilog iverilog-0.9.7 
// (latest stable release) for PLD programming, and GTKWave (version 3.3.104).
 


`timescale 1ns / 1ps
module comparator(
	input Temperature,
	input Smoke,
	input Humidity,
	output Output,
	output [2:0] Flag
		
);
compare c0(Output, Temperature, Smoke, Humidity);

compare2 c20(Flag, Temperature, Smoke, Humidity);

endmodule

///The below logic table is used for the logic gate design
 
primitive compare(Output, in1, in2, in3);
	output Output;
	input in1,in2,in3;
table
// in1  in2  in3 : out
    0    0    0  :  0; 
    0    0    1  :  0; 
    0    1    0  :  0; 
    0    1    1  :  1; 
	1    0	  0  :  0;
	1    0    1  :  1;
	1    1    0  :  1; 
	1    1    1  :  1;
	
endtable
endprimitive

/// The below logic table is used for the Flag (i.e, Gray Code), it also transfer the status of all sensors such as which sensor or variables participate in the output

primitive compare2(Flag, in1, in2, in3);
	output Flag;
	input in1,in2,in3;
table
// in1  in2  in3 : out2
    0    0    0  :  0; 
    0    0    1  :  1; 
    0    1    0  :  1; 
    0    1    1  :  1; 
	1    0	  0  :  1;
	1    0    1  :  1;
	1    1    0  :  1; 
	1    1    1  :  1;
	
endtable
endprimitive


