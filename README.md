# IGTDC-Project: Icarus Verilog code implementation for Trustworthy for Event Detection (Fire detection and Smart Irrigation System).

####################
#
# Main test script
#
####################

This project is based upon free Icarus Verilog compiler, that works very well for windows as well as Linux. We use Intel Core i7, 16 GB RAM, Win 10, 64 Bit OS. We utilised the latest version of the Icarus Verilog (hardware description language version 10.3) for PLD programming, and GTKWave (version 3.3.104).

In order to run our project code, first we need to know about the Icarus Verilog fundamental.

####################
#
# Introduction
#
####################

Hardware Description Language (HDL) is used to model digital circuits using codes. Verilog is one such code (VHDL is another type). Icarus Verilog is a
free compiler implementation for the IEEE-1364 Verilog hardware description language. Icarus is maintained by Stephen Williams and it is released under
the GNU GPL license.

# What Is Icarus Verilog?

Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some
target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed 
by the vvp command. For synthesis, the compiler generates netlists in the desired format. The compiler proper is intended to parse and elaborate
design descriptions written to the IEEE standard IEEE Std 1364-2005. This is a fairly large and complex standard, so it will take some time to fill all the
dark alleys of the standard, but that's the goal.

# A Test Suite?

There is also a test suite available. The test suite is also accessible as the
ivtest github.com project, available here:

<https://github.com/steveicarus/ivtest>.

# Icarus Verilog for Windows:

You can find Icarus Verilog sources and binaries for most platforms at
the Icarus site FTP. The sources available here:
http://bleyer.org/icarus/


#########################################
#
# How to run our Verilog code/program?
#
#########################################

The C:/iverilog/bin subdirectory contains the executable file verilog.exe that is used to run
simulator.

In the any '.v' i.e., Verlog file can be edit with notepad or any
other text editor( I prefer free notepad++). 

In this project we have two main verilog files namely: OurProjectFire.v and OurProjectSAS.v for two different IoT scenarios, i.e., for fire detection and smart
irrigation system, and 5 testbench files (i.e., CaseOne_tb.v, CaseTwo_tb.v, CaseThree_tb, CaseFour_tb.v, and Casefive_tb.v) for OurProjectFire.v and OurProjectSAS.v module, 

Note: Full details of each moudle and testbench is given in the file "Icarus Verilog project Code user manual.pdf" such as how to run each module and what are the coresponding output etc using below link.
https://github.com/hafizdir101/IGTDC-Project/blob/main/Icarus%20Verilog%20project%20Code%20user%20manual.pdf

# Below is the brief discription how to run the firt module with the coresponding testbench.

# Go to the dos windows ( Start -> cmd) navigate to the iverilog\bin directory

C:\> cd iverilog\bin

# Compile the program using

C:\iverilog\bin>iverilog -o CaseOne OurProjectFire.v CaseOne_tb.v

# If everything goes right, it will not produce any output. If there are any syntax errors it will show some errors.

# To see the output of the stimulus, you may like to give the following command

C:\iverilog\bin>vvp CaseOne

# Note: If you want to see the output in the graphic form i.e., GTKWave then used below command

C:\iverilog\bin>gtkwave test.vcd &


# Note: The above commands can be used for Case 2, Case 3, and Case 4 and OurProjectSAS.V and Case 5 according too.


#For result/output you can check the "Icarus Verilog project Code user manual.pdf" file

https://github.com/hafizdir101/IGTDC-Project/blob/main/Icarus%20Verilog%20project%20Code%20user%20manual.pdf




Regards,
