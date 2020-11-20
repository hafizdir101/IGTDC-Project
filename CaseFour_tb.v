// CaseFour_tb.v for OurProjectFire.v module
//Case 4: Figure 10. (c) GTKWave waveform for Trustworthy Event Detection using PLD/User Defned Primitive (UDP) (Logic Object Domain - III) with some noise/faulty signals.
// For trustworthy fre detection, we can observe
// two out of four reliable events are detected at 150 and 500 seconds, respectively, over 870 seconds
// of simulation time. 
// In this simulation, only one faulty signal
// is fed into the humidity sensor, and the associated event information is captured.



// testbench for myproject.v module
`timescale 1s / 1ps
module stimulus;
	// Inputs
	reg Temperature;
	reg Smoke;
	reg Humidity;
	// Outputs
	wire Output;
	wire [2:0] Flag;
	// Instantiate the Unit Under Test (UUT)
	comparator uut (
		.Temperature(Temperature),
		.Smoke(Smoke), 
		.Humidity(Humidity), 
		.Output(Output),
		.Flag(Flag)
	);
	
	initial begin
		// Initialize Inputs
	$dumpfile("test.vcd");
    $dumpvars(0,stimulus);
	Temperature = 0;
	Smoke = 0;
	Humidity = 0;
	//an event occures and all sensors observed the event
	#150 Temperature = 1;
	#0  Smoke = 1;
	#0  Humidity = 1;
	#20 Temperature = 0;
	#0  Smoke = 0;
	#0  Humidity = 0;
	////////////only one sensor change due to enviroment effects
	#0 Temperature = 0;
	#0  Smoke = 0;
	#130  Humidity = 1;
	#0 Temperature = 0;
	#0  Smoke = 0;
	#20 Humidity = 0;
	//an event occures and all sensors observed the event
	#180 Temperature = 1;
	#0   Smoke = 1;
	#0   Humidity = 1;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	#180 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	
	#150;
	
    end  
	
	initial begin
	$monitor("Time=%3d, Temperature=%d,  Smoke=%d,  Humidity=%d,  Output=%d,  Flag (8421)=%b\n",$time, Temperature, Smoke, Humidity, Output, Flag);

	end
endmodule

//iverilog -o CaseFour OurProjectFire.v CaseFour_tb.v
//vvp CaseFour
//gtkwave test.vcd &


