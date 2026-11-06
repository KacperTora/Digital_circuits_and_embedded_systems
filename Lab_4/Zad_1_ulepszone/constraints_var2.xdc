set_property PACKAGE_PIN D7  [get_ports {CLK_100MHz_P}]
set_property PACKAGE_PIN D6  [get_ports {CLK_100MHz_N}]
set_property IOSTANDARD LVDS [get_ports CLK_100MHz_*]
create_clock -period 10.000 -name Clk_100MHz [get_ports CLK_100MHz_P]

set_property PACKAGE_PIN AF5 [get_ports {Y}]
set_property IOSTANDARD LVCMOS12 [get_ports {Y}]

set_property PACKAGE_PIN AB10 [get_ports {PS2A_Data}]
set_property PACKAGE_PIN AB9  [get_ports {PS2A_Clk}]
set_property IOSTANDARD LVCMOS33 [get_ports PS2A_*]
