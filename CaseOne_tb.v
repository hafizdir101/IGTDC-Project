//CaseOne TestBench for OurProjectFire.v module
// The simulation runs for 250 seconds According to the logical object module for fre detection, four of the eight output values are
// sent towards the gateway for the reliable event detection, denoted in the logic table by the ’1’
// output column. The reliable event information will be sent towards the upstream node, if and
// only if, at least two sensors or all sensors sense an event simultaneously, i.e., temperature, smoke,
// and humidity sensor exceed the threshold. For trustworthy fre detection, we can observe
// two of the three reliable events are detected at 60 and 180 seconds, respectively, over 250 seconds
// of simulation time. 
// CaseOne_tb.v is a testbench for myproject.v module; we have 4 different Test 
//Cases for fire detections such as shown in our main manuscript Figure 9 (a) 
//GTKWave waveform for Trustworthy Event Detection using PLD/User //Defined Primitive (UDP) (Logic Object Domain - I, Logic Object Domain - II, 
//and Logic Object Domain- III) for fire detection and smart irrigation system.  
// testbench for comparator module
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
    // an event occures and all sensors observed the event
	#60 Temperature = 1;
	#0  Smoke = 1;
	#0  Humidity = 1;
	#20 Temperature = 0;
	#0  Smoke = 0;
	#0  Humidity = 0;
	////////////only one sensor change due to enviroment effects
	#40 Temperature = 1;
	#0  Smoke = 0;
	#0  Humidity = 0;
	#20 Temperature = 0;
	#0  Smoke = 0;
	#0  Humidity = 0;
	////////////only one sensor change due to enviroment effects
	#10 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 1;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	// an event occures and all sensors observed the event
	#10 Temperature = 1;
	#0   Smoke = 1;
	#0   Humidity = 1;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	#50;
    end  
	initial begin
	$monitor("Time=%3d, Temperature=%d,  Smoke=%d,  Humidity=%d,  Output=%d,  Flag (8421)=%b\n",$time, Temperature, Smoke, Humidity, Output, Flag);
	end
endmodule

//iverilog -o CaseOne OurProjectFire.v CaseOne_tb.v
//vvp CaseOne
//gtkwave test.vcd &


