// CaseThree_tb.v Case 3: Figure 10. (b) GTKWave waveform for Trustworthy Event Detection using PLD/User Defned Primitive (UDP) (Logic Object Domain - II) without noise/faulty signals.
//For trustworthy fre detection, we can observe
// two out of four reliable events are detected at 150 and 500 seconds, respectively, over 870 seconds
// of simulation time. Furthermore, in this simulation we have no defective
// or somewhat compromise signals, it means that the obtained event is trustworthy, and the
// corresponding output signals are reliable.
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
	//an event occures and all sensors observed the event
	#150 Temperature = 1;
	#0  Smoke = 1;
	#0  Humidity = 1;
	#20 Temperature = 0;
	#0  Smoke = 0;
	#0  Humidity = 0;
	#0 Temperature = 0;
	#130  Smoke = 0;
	#0  Humidity = 0;
	#0 Temperature = 0;
	#20  Smoke = 0;
	#0  Humidity = 0;
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


//iverilog -o CaseThree OurProjectFire.v CaseThree_tb.v
//vvp CaseThree
//gtkwave test.vcd &


