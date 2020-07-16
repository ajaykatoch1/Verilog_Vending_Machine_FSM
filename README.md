# Verilog_Vending_Machine_FSM
In this project I created a vending machine program by utilizing Verilog and Vivado. 
The core design of the datapath was achieved through a finite state machine with multiple states based on user input to the machine. 
The resulting outputs were then implemented on an Xilinx FPGA.

To use this, create a project in Vivado and import the files coresspoding by file types. The .xdc is a contraint and the .tb files are testbenches while the .v are source files. 
Once imported run synthesis and implementation on Vivado and then run on the FPGA. The specified board is xc7a100tcsg. 
The buttons mapped can be found in the constraint files.
