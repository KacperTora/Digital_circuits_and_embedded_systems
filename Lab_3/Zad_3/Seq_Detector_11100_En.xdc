set_property PACKAGE_PIN D7  [get_ports {CLK_100MHz_P}]
set_property PACKAGE_PIN D6  [get_ports {CLK_100MHz_N}]
set_property IOSTANDARD LVDS [get_ports CLK_100MHz_*]
create_clock -period 10.000 -name Clk_100MHz [get_ports CLK_100MHz_P]

set_property PACKAGE_PIN AF5 [get_ports {Y}]
set_property IOSTANDARD LVCMOS12 [get_ports {Y}]

set_property PACKAGE_PIN AE12 [get_ports {OLED_SCL}]
set_property PACKAGE_PIN AF12 [get_ports {OLED_SDA}]
set_property IOSTANDARD LVCMOS33 [get_ports OLED_*]

set_property PACKAGE_PIN AA8  [get_ports {ROT_A}]
set_property PACKAGE_PIN Y9   [get_ports {ROT_B}]
set_property IOSTANDARD LVCMOS33 [get_ports ROT_*]
