## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {rst}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
set_property PACKAGE_PIN V16 [get_ports {in_valid}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {in_valid}]
set_property PACKAGE_PIN W16 [get_ports {challange[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {challange[0]}]
set_property PACKAGE_PIN W17 [get_ports {challange[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {challange[1]}]
set_property PACKAGE_PIN W15 [get_ports {challange[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {challange[2]}]
set_property PACKAGE_PIN V15 [get_ports {challange[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {challange[3]}]


# LEDs
set_property PACKAGE_PIN U16 [get_ports {out_led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {out_led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_led[1]}]







set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro1/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro2/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro3/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro4/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro5/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro6/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro7/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro8/w1}]


#set_clock_uncertainty 0.05 -setup [get_clocks clk]