// For trustworthy event detection (smart irrigation), we can observe
// three out of four reliable events are detected at 39600, 81200,  and 16400 seconds, respectively, over 173200 seconds (48.1 Hours)
// of simulation time. 
// In this simulation, only one faulty signal
// is fed into the Soil Temperature sensor, and the associated event information is captured too at 132000 Seconds.



// testbench for comparator module
`timescale 1s / 1ps
module stimulus;
	// Inputs
	reg AirTemperature;
	reg SoilTemprature;
	reg AirHumidity;
	reg SoilMoisture;
	// Outputs
	wire Output;
	wire [2:0] Flag;
	
	
	
	// Instantiate the Unit Under Test (UUT)
	comparator uut (
		.AirTemperature(AirTemperature),
		.SoilTemprature(SoilTemprature), 
		.AirHumidity(AirHumidity), 
		.SoilMoisture(SoilMoisture), 
		.Output(Output),
		.Flag(Flag)
	);
	
	
	
	initial begin
		// Initialize Inputs
	$dumpfile("test.vcd");
    $dumpvars(0,stimulus);
	
	AirTemperature = 0;
	SoilTemprature = 0;
	AirHumidity = 0;
	SoilMoisture = 0;
	// an event occures and all sensors observed the event
	#39600 AirTemperature = 1;
	#0  SoilTemprature = 1;
	#0  AirHumidity = 1;
	#0  SoilMoisture = 1;
	#2000 AirTemperature = 0;
	#0  SoilTemprature = 0;
	#0  AirHumidity = 0;
	#0  SoilMoisture = 0;
	// an event occures and all sensors observed the event
	#39600 AirTemperature = 1;
	#0  SoilTemprature = 1;
	#0  AirHumidity = 1;
	#0  SoilMoisture = 1;
	#2000 AirTemperature = 0;
	#0  SoilTemprature = 0;
	#0  SoilMoisture = 0;
	#0 AirHumidity = 0;
	////////////only one sensor change due to enviroment effects
	#0 AirTemperature = 0;
	#48800  SoilTemprature = 1;
	#0  SoilMoisture = 0;
	#0 AirHumidity = 0;
	#0 AirTemperature = 0;
	#2000  SoilTemprature = 0;
	#0  SoilMoisture = 0;
	#0 AirHumidity = 0;
	// an event occures and all sensors observed the event
	#30400 AirTemperature = 1;
	#0   SoilTemprature = 1;
	#0   AirHumidity = 1;
	#0  SoilMoisture = 1;
	#2000 AirTemperature = 0;
	#0   SoilTemprature = 0;
	#0   AirHumidity = 0;
	#0  SoilMoisture = 0;
	#0 AirTemperature = 0;
	#0   SoilTemprature = 0;
	#0   AirHumidity = 0;
	#0  SoilMoisture = 0;
	
	#6800;
	
    end  
	
	
	
	
	initial begin
	$monitor("Time=%3d, AirTemperature=%d,  SoilTemprature=%d,  AirHumidity=%d, SoilMoisture=%d,  Output=%d,  Flag (8421)=%b\n",$time, AirTemperature, SoilTemprature, AirHumidity,  SoilMoisture, Output, Flag);
	
    //$monitor("Time=%3d, AirTemperature =%d,  SoilTemprature =%d,  AirHumidity =%d,  Output =%d\n",$time, AirTemperature, SoilTemprature, AirHumidity, Output);
	
	//$monitor("time = %2d, CIN =%1b, IN1=%1b, IN2=%1b, COUT=%1b, OUT=%1b", $time,carryin,input2, input1,carryout,out);
	end
endmodule


//iverilog -o CaseFive OurProjectSAS.v CaseFive_tb.v
//vvp CaseFive
//gtkwave test.vcd &


