set_property PACKAGE_PIN W5 [get_ports CLK]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

set_property PACKAGE_PIN U18 [get_ports RESET]
	set_property IOSTANDARD LVCMOS33 [get_ports RESET]

## Switches (Input Data)
## P.17 2-竭｢: SW3-0 -> D0 (0譯∫岼), SW7-4 -> D1 (1譯∫岼), ...

# D0 (0譯∫岼: SW0-SW3)
set_property PACKAGE_PIN V17 [get_ports {D0[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D0[0]}]
set_property PACKAGE_PIN V16 [get_ports {D0[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D0[1]}]
set_property PACKAGE_PIN W16 [get_ports {D0[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D0[2]}]
set_property PACKAGE_PIN W17 [get_ports {D0[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D0[3]}]

# D1 (1譯∫岼: SW4-SW7)
set_property PACKAGE_PIN W15 [get_ports {D1[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D1[0]}]
set_property PACKAGE_PIN V15 [get_ports {D1[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D1[1]}]
set_property PACKAGE_PIN W14 [get_ports {D1[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D1[2]}]
set_property PACKAGE_PIN W13 [get_ports {D1[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D1[3]}]

# D2 (2譯∫岼: SW8-SW11)
set_property PACKAGE_PIN V2 [get_ports {D2[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D2[0]}]
set_property PACKAGE_PIN T3 [get_ports {D2[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D2[1]}]
set_property PACKAGE_PIN T2 [get_ports {D2[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D2[2]}]
set_property PACKAGE_PIN R3 [get_ports {D2[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D2[3]}]

# D3 (3譯∫岼: SW12-SW15)
set_property PACKAGE_PIN W2 [get_ports {D3[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D3[0]}]
set_property PACKAGE_PIN U1 [get_ports {D3[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D3[1]}]
set_property PACKAGE_PIN T1 [get_ports {D3[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D3[2]}]
set_property PACKAGE_PIN R2 [get_ports {D3[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {D3[3]}]

## 7-Segment Display Segments (Cathodes)
## P.4 蝗櫁ｷｯ蝗ｳ縺ｫ蝓ｺ縺･縺城?咲ｽｮ (CA=W7 ... CG=U7, DP=V7)
## Verilog縺ｧ縺ｯ SEG_OUT[6:0] = g f e d c b a 縺ｮ鬆?縺ｫ蟇ｾ蠢?

set_property PACKAGE_PIN W7 [get_ports {SEG_OUT[0]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[0]}]
set_property PACKAGE_PIN W6 [get_ports {SEG_OUT[1]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[1]}]
set_property PACKAGE_PIN U8 [get_ports {SEG_OUT[2]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[2]}]
set_property PACKAGE_PIN V8 [get_ports {SEG_OUT[3]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[3]}]
set_property PACKAGE_PIN U5 [get_ports {SEG_OUT[4]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[4]}]
set_property PACKAGE_PIN V5 [get_ports {SEG_OUT[5]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[5]}]
set_property PACKAGE_PIN U7 [get_ports {SEG_OUT[6]}] 
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_OUT[6]}]

## 7-Segment Display Anodes (Common Anode Control)
## P.4 蝗櫁ｷｯ蝗ｳ縺ｫ蝓ｺ縺･縺城?咲ｽｮ (AN0=U2 ... AN3=W4)

set_property PACKAGE_PIN U2 [get_ports {ANODE[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODE[0]}]
set_property PACKAGE_PIN U4 [get_ports {ANODE[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODE[1]}]
set_property PACKAGE_PIN V4 [get_ports {ANODE[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODE[2]}]
set_property PACKAGE_PIN W4 [get_ports {ANODE[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODE[3]}]