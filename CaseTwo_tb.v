
//Case 2: Figure 10. (a) GTKWave waveform for Trustworthy Event Detection using PLD/User Defined Primitive (UDP) (Logic Object Domain - I) with some noise/faulty signals.
// The simulation runs for 870 seconds According to the logical object module for fre detection, four of the eight output values are
// sent towards the gateway for the reliable event detection, denoted in the logic table by the ’1’
// output column. An output event is produced if and only if at least two of the three or all sensors observe the
// event simultaneously. For trustworthy fre detection, we can observe
// two out of four reliable events are detected at 150 and 500 seconds, respectively, over 870 seconds
// of simulation time. Furthermore, in this simulation the temperature and a smoke sensor having defective
// or somewhat compromise signals at 700 and 300 seconds, respectively.

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
	// an event occures and all sensors observed the event
	#150 Temperature = 1;
	#0  Smoke = 1;
	#0  Humidity = 1;
	#20 Temperature = 0;
	#0  Smoke = 0;
	#0  Humidity = 0;
	////////////only one sensor change due to enviroment effects
	#0 Temperature = 0;
	#130  Smoke = 1;
	#0  Humidity = 0;
	#0 Temperature = 0;
	#20  Smoke = 0;
	#0  Humidity = 0;
   // an event occures and all sensors observed the event
	#180 Temperature = 1;
	#0   Smoke = 1;
	#0   Humidity = 1;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	////////////only one sensor change due to enviroment effects
	#180 Temperature = 1;
	#0   Smoke = 0;
	#0   Humidity = 0;
	#20 Temperature = 0;
	#0   Smoke = 0;
	#0   Humidity = 0;
	#150;
    end  
	
	initial begin
	$monitor("Time=%3d, Temperature=%d,  Smoke=%d,  Humidity=%d,  Output=%d,  Flag (8421)=%b\n",$time, Temperature, Smoke, Humidity, Output, Flag);
endmodule


//iverilog -o CaseTwo OurProjectFire.v CaseTwo_tb.v
//vvp CaseTwo
//gtkwave test.vcd &


