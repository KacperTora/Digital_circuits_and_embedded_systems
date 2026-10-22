set_property PACKAGE_PIN AB6 [get_ports {clk}]
set_property IOSTANDARD LVCMOS12 [get_ports {clk}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

set_property PACKAGE_PIN AB1 [get_ports {X}]
set_property IOSTANDARD LVCMOS12 [get_ports {X}]

set_property PACKAGE_PIN AF2 [get_ports {Y}]
set_property IOSTANDARD LVCMOS12 [get_ports {Y}]

set_property PACKAGE_PIN AF5 [get_ports {Q_out[0]}]
set_property PACKAGE_PIN AE7 [get_ports {Q_out[1]}]
set_property PACKAGE_PIN AH2 [get_ports {Q_out[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {Q_out[*]}]
