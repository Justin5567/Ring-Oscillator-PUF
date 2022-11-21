## This file is a general .xdc for the PYNQ-Z2 board 
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal 125 MHz

set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

##Switches

set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L7N_T1_AD2N_35 Sch=sw[0]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { in_valid }]; #IO_L7P_T1_AD2P_35 Sch=sw[1]


##LEDs

set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { out_led[0] }]; #IO_L6N_T0_VREF_34 Sch=led[0]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { out_led[1] }]; #IO_L6P_T0_34 Sch=led[1]


##Buttons

set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { challange[0] }]; #IO_L4P_T0_35 Sch=btn[0]
set_property -dict { PACKAGE_PIN D20   IOSTANDARD LVCMOS33 } [get_ports { challange[1] }]; #IO_L4N_T0_35 Sch=btn[1]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { challange[2] }]; #IO_L9N_T1_DQS_AD3N_35 Sch=btn[2]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { challange[3] }]; #IO_L9P_T1_DQS_AD3P_35 Sch=btn[3]

set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro1/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro2/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro3/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro4/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro5/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro6/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro7/w1}]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ro8/w1}]