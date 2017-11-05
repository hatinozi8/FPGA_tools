#!quartus_sh -t
#
# $Id: mkproj-DE2-70.tcl,v 3.2 2011-09-18 18:51:22+09 knish Exp $
#

package require cmdline
set options {
	{ "project.arg" "" "project name" }
	{ "script.arg" "" "script file" }
	{ "reset.arg" "" "reset name" }
}
set usage "\[options\] \[files...\]"
array set opt [::cmdline::getoptions ::argv $options $usage]

if {$opt(project) == ""} {
	return -code error "Usage: $argv0 $usage"
}

########

project_new $opt(project) -overwrite

set_global_assignment -name TOP_LEVEL_ENTITY $opt(project)
foreach arg $argv {
	set_global_assignment -name VERILOG_FILE $arg
}

if {$opt(script) != ""} {
	set_global_assignment -name PRE_FLOW_SCRIPT_FILE "quartus_sh:$opt(script)"
}

########

set_global_assignment -name FAMILY "CYCLONE II"
set_global_assignment -name DEVICE "EP2C70F896C6"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_parameter -name CYCLONEII_SAFE_WRITE "RESTRUCTURE"

create_base_clock -fmax 50MHz -duty_cycle 50 m_clock

set_location_assignment PIN_AD15 -to m_clock

if {$opt(reset) != ""} {
	set_location_assignment PIN_T29 -to $opt(reset)
	set_location_assignment PIN_T28 -to KEY_1
	set_location_assignment PIN_U30 -to KEY_2
	set_location_assignment PIN_U29 -to KEY_3
} else {
	set_location_assignment PIN_T29 -to KEY[0]
	set_location_assignment PIN_T28 -to KEY[1]
	set_location_assignment PIN_U30 -to KEY[2]
	set_location_assignment PIN_U29 -to KEY[3]
	set_location_assignment PIN_T29 -to KEY_0
	set_location_assignment PIN_T28 -to KEY_1
	set_location_assignment PIN_U30 -to KEY_2
	set_location_assignment PIN_U29 -to KEY_3
}

########

# Table 5.1: Pin assignments for the toggle switches.
set_location_assignment PIN_AA23 -to SW[0]
set_location_assignment PIN_AB26 -to SW[1]
set_location_assignment PIN_AB25 -to SW[2]
set_location_assignment PIN_AC27 -to SW[3]
set_location_assignment PIN_AC26 -to SW[4]
set_location_assignment PIN_AC24 -to SW[5]
set_location_assignment PIN_AC23 -to SW[6]
set_location_assignment PIN_AD25 -to SW[7]
set_location_assignment PIN_AD24 -to SW[8]
set_location_assignment PIN_AE27 -to SW[9]
set_location_assignment PIN_W5   -to SW[10]
set_location_assignment PIN_V10  -to SW[11]
set_location_assignment PIN_U9   -to SW[12]
set_location_assignment PIN_T9   -to SW[13]
set_location_assignment PIN_L5   -to SW[14]
set_location_assignment PIN_L4   -to SW[15]
set_location_assignment PIN_L7   -to SW[16]
set_location_assignment PIN_L8   -to SW[17]
set_location_assignment PIN_AA23 -to SW_0
set_location_assignment PIN_AB26 -to SW_1
set_location_assignment PIN_AB25 -to SW_2
set_location_assignment PIN_AC27 -to SW_3
set_location_assignment PIN_AC26 -to SW_4
set_location_assignment PIN_AC24 -to SW_5
set_location_assignment PIN_AC23 -to SW_6
set_location_assignment PIN_AD25 -to SW_7
set_location_assignment PIN_AD24 -to SW_8
set_location_assignment PIN_AE27 -to SW_9
set_location_assignment PIN_W5   -to SW_10
set_location_assignment PIN_V10  -to SW_11
set_location_assignment PIN_U9   -to SW_12
set_location_assignment PIN_T9   -to SW_13
set_location_assignment PIN_L5   -to SW_14
set_location_assignment PIN_L4   -to SW_15
set_location_assignment PIN_L7   -to SW_16
set_location_assignment PIN_L8   -to SW_17

# Table 5.2: Pin assignments for the pushbutton switches.
#set_location_assignment PIN_T29  -to KEY[0]
#set_location_assignment PIN_T28  -to KEY[1]
#set_location_assignment PIN_U30  -to KEY[2]
#set_location_assignment PIN_U29  -to KEY[3]
#set_location_assignment PIN_T29  -to KEY_0
#set_location_assignment PIN_T28  -to KEY_1
#set_location_assignment PIN_U30  -to KEY_2
#set_location_assignment PIN_U29  -to KEY_3

# Table 5.3: Pin assignments for the LEDs.
set_location_assignment PIN_AJ6  -to LEDR[0]
set_location_assignment PIN_AK5  -to LEDR[1]
set_location_assignment PIN_AJ5  -to LEDR[2]
set_location_assignment PIN_AJ4  -to LEDR[3]
set_location_assignment PIN_AK3  -to LEDR[4]
set_location_assignment PIN_AH4  -to LEDR[5]
set_location_assignment PIN_AJ3  -to LEDR[6]
set_location_assignment PIN_AJ2  -to LEDR[7]
set_location_assignment PIN_AH3  -to LEDR[8]
set_location_assignment PIN_AD14 -to LEDR[9]
set_location_assignment PIN_AC13 -to LEDR[10]
set_location_assignment PIN_AB13 -to LEDR[11]
set_location_assignment PIN_AC12 -to LEDR[12]
set_location_assignment PIN_AB12 -to LEDR[13]
set_location_assignment PIN_AC11 -to LEDR[14]
set_location_assignment PIN_AD9  -to LEDR[15]
set_location_assignment PIN_AD8  -to LEDR[16]
set_location_assignment PIN_AJ7  -to LEDR[17]
set_location_assignment PIN_AJ6  -to LEDR_0
set_location_assignment PIN_AK5  -to LEDR_1
set_location_assignment PIN_AJ5  -to LEDR_2
set_location_assignment PIN_AJ4  -to LEDR_3
set_location_assignment PIN_AK3  -to LEDR_4
set_location_assignment PIN_AH4  -to LEDR_5
set_location_assignment PIN_AJ3  -to LEDR_6
set_location_assignment PIN_AJ2  -to LEDR_7
set_location_assignment PIN_AH3  -to LEDR_8
set_location_assignment PIN_AD14 -to LEDR_9
set_location_assignment PIN_AC13 -to LEDR_10
set_location_assignment PIN_AB13 -to LEDR_11
set_location_assignment PIN_AC12 -to LEDR_12
set_location_assignment PIN_AB12 -to LEDR_13
set_location_assignment PIN_AC11 -to LEDR_14
set_location_assignment PIN_AD9  -to LEDR_15
set_location_assignment PIN_AD8  -to LEDR_16
set_location_assignment PIN_AJ7  -to LEDR_17

set_location_assignment PIN_W27  -to LEDG[0]
set_location_assignment PIN_W25  -to LEDG[1]
set_location_assignment PIN_W23  -to LEDG[2]
set_location_assignment PIN_Y27  -to LEDG[3]
set_location_assignment PIN_Y24  -to LEDG[4]
set_location_assignment PIN_Y23  -to LEDG[5]
set_location_assignment PIN_AA27 -to LEDG[6]
set_location_assignment PIN_AA24 -to LEDG[7]
set_location_assignment PIN_AC14 -to LEDG[8]
set_location_assignment PIN_W27  -to LEDG_0
set_location_assignment PIN_W25  -to LEDG_1
set_location_assignment PIN_W23  -to LEDG_2
set_location_assignment PIN_Y27  -to LEDG_3
set_location_assignment PIN_Y24  -to LEDG_4
set_location_assignment PIN_Y23  -to LEDG_5
set_location_assignment PIN_AA27 -to LEDG_6
set_location_assignment PIN_AA24 -to LEDG_7
set_location_assignment PIN_AC14 -to LEDG_8

# Table 5.4: Pin assignments for 7-segment displays.
set_location_assignment PIN_AE8  -to HEX0[0]
set_location_assignment PIN_AF9  -to HEX0[1]
set_location_assignment PIN_AH9  -to HEX0[2]
set_location_assignment PIN_AD10 -to HEX0[3]
set_location_assignment PIN_AF10 -to HEX0[4]
set_location_assignment PIN_AD11 -to HEX0[5]
set_location_assignment PIN_AD12 -to HEX0[6]
set_location_assignment PIN_AF12 -to HEX0[7]
set_location_assignment PIN_AF12 -to HEX0_DP

set_location_assignment PIN_AG13 -to HEX1[0]
set_location_assignment PIN_AE16 -to HEX1[1]
set_location_assignment PIN_AF16 -to HEX1[2]
set_location_assignment PIN_AG16 -to HEX1[3]
set_location_assignment PIN_AE17 -to HEX1[4]
set_location_assignment PIN_AF17 -to HEX1[5]
set_location_assignment PIN_AD17 -to HEX1[6]
set_location_assignment PIN_AC17 -to HEX1[7]
set_location_assignment PIN_AC17 -to HEX1_DP

set_location_assignment PIN_AE7  -to HEX2[0]
set_location_assignment PIN_AF7  -to HEX2[1]
set_location_assignment PIN_AH5  -to HEX2[2]
set_location_assignment PIN_AG4  -to HEX2[3]
set_location_assignment PIN_AB18 -to HEX2[4]
set_location_assignment PIN_AB19 -to HEX2[5]
set_location_assignment PIN_AE19 -to HEX2[6]
set_location_assignment PIN_AC19 -to HEX2[7]
set_location_assignment PIN_AC19 -to HEX2_DP

set_location_assignment PIN_P6   -to HEX3[0]
set_location_assignment PIN_P4   -to HEX3[1]
set_location_assignment PIN_N10  -to HEX3[2]
set_location_assignment PIN_N7   -to HEX3[3]
set_location_assignment PIN_M8   -to HEX3[4]
set_location_assignment PIN_M7   -to HEX3[5]
set_location_assignment PIN_M6   -to HEX3[6]
set_location_assignment PIN_M4   -to HEX3[7]
set_location_assignment PIN_M4   -to HEX3_DP

set_location_assignment PIN_P1   -to HEX4[0]
set_location_assignment PIN_P2   -to HEX4[1]
set_location_assignment PIN_P3   -to HEX4[2]
set_location_assignment PIN_N2   -to HEX4[3]
set_location_assignment PIN_N3   -to HEX4[4]
set_location_assignment PIN_M1   -to HEX4[5]
set_location_assignment PIN_M2   -to HEX4[6]
set_location_assignment PIN_L6   -to HEX4[7]
set_location_assignment PIN_L6   -to HEX4_DP

set_location_assignment PIN_M3   -to HEX5[0]
set_location_assignment PIN_L1   -to HEX5[1]
set_location_assignment PIN_L2   -to HEX5[2]
set_location_assignment PIN_L3   -to HEX5[3]
set_location_assignment PIN_K1   -to HEX5[4]
set_location_assignment PIN_K4   -to HEX5[5]
set_location_assignment PIN_K5   -to HEX5[6]
set_location_assignment PIN_K6   -to HEX5[7]
set_location_assignment PIN_K6   -to HEX5_DP

set_location_assignment PIN_H6   -to HEX6[0]
set_location_assignment PIN_H4   -to HEX6[1]
set_location_assignment PIN_H7   -to HEX6[2]
set_location_assignment PIN_H8   -to HEX6[3]
set_location_assignment PIN_G4   -to HEX6[4]
set_location_assignment PIN_F4   -to HEX6[5]
set_location_assignment PIN_E4   -to HEX6[6]
set_location_assignment PIN_K2   -to HEX6[7]
set_location_assignment PIN_K2   -to HEX6_DP

set_location_assignment PIN_K3   -to HEX7[0]
set_location_assignment PIN_J1   -to HEX7[1]
set_location_assignment PIN_J2   -to HEX7[2]
set_location_assignment PIN_H1   -to HEX7[3]
set_location_assignment PIN_H2   -to HEX7[4]
set_location_assignment PIN_H3   -to HEX7[5]
set_location_assignment PIN_G1   -to HEX7[6]
set_location_assignment PIN_G2   -to HEX7[7]
set_location_assignment PIN_G2   -to HEX7_DP

# Table 5.5: Pin assignments for clock inputs.
set_location_assignment PIN_E16  -to CLK_28
set_location_assignment PIN_AD15 -to CLK_50
set_location_assignment PIN_D16  -to CLK_50_2
set_location_assignment PIN_R28  -to CLK_50_3
set_location_assignment PIN_R3   -to CLK_50_4
set_location_assignment PIN_R29  -to EXT_CLOCK

# Table 5.6: Pin assignments for LCD module.
set_location_assignment PIN_E1   -to LCD_DATA[0]
set_location_assignment PIN_E3   -to LCD_DATA[1]
set_location_assignment PIN_D2   -to LCD_DATA[2]
set_location_assignment PIN_D3   -to LCD_DATA[3]
set_location_assignment PIN_C1   -to LCD_DATA[4]
set_location_assignment PIN_C2   -to LCD_DATA[5]
set_location_assignment PIN_C3   -to LCD_DATA[6]
set_location_assignment PIN_B2   -to LCD_DATA[7]
set_location_assignment PIN_F3   -to LCD_RW
set_location_assignment PIN_E2   -to LCD_EN
set_location_assignment PIN_F2   -to LCD_RS
set_location_assignment PIN_F1   -to LCD_ON
set_location_assignment PIN_G3   -to LCD_BLON

# Table 5.8: Pin assignments for expansion headers.
set_location_assignment PIN_C30  -to GPIO0_D[0]
set_location_assignment PIN_C29  -to GPIO0_D[1]
set_location_assignment PIN_E28  -to GPIO0_D[2]
set_location_assignment PIN_D29  -to GPIO0_D[3]
set_location_assignment PIN_E27  -to GPIO0_D[4]
set_location_assignment PIN_D28  -to GPIO0_D[5]
set_location_assignment PIN_E29  -to GPIO0_D[6]
set_location_assignment PIN_G25  -to GPIO0_D[7]
set_location_assignment PIN_E30  -to GPIO0_D[8]
set_location_assignment PIN_G26  -to GPIO0_D[9]
set_location_assignment PIN_F29  -to GPIO0_D[10]
set_location_assignment PIN_G29  -to GPIO0_D[11]
set_location_assignment PIN_F30  -to GPIO0_D[12]
set_location_assignment PIN_G30  -to GPIO0_D[13]
set_location_assignment PIN_H29  -to GPIO0_D[14]
set_location_assignment PIN_H30  -to GPIO0_D[15]
set_location_assignment PIN_J29  -to GPIO0_D[16]
set_location_assignment PIN_H25  -to GPIO0_D[17]
set_location_assignment PIN_J30  -to GPIO0_D[18]
set_location_assignment PIN_H24  -to GPIO0_D[19]
set_location_assignment PIN_J25  -to GPIO0_D[20]
set_location_assignment PIN_K24  -to GPIO0_D[21]
set_location_assignment PIN_J24  -to GPIO0_D[22]
set_location_assignment PIN_K25  -to GPIO0_D[23]
set_location_assignment PIN_L22  -to GPIO0_D[24]
set_location_assignment PIN_M21  -to GPIO0_D[25]
set_location_assignment PIN_L21  -to GPIO0_D[26]
set_location_assignment PIN_M22  -to GPIO0_D[27]
set_location_assignment PIN_N22  -to GPIO0_D[28]
set_location_assignment PIN_N25  -to GPIO0_D[29]
set_location_assignment PIN_N21  -to GPIO0_D[30]
set_location_assignment PIN_N24  -to GPIO0_D[31]
set_location_assignment PIN_T25  -to GPIO0_CLKIN[0]
set_location_assignment PIN_T24  -to GPIO0_CLKIN[1]
set_location_assignment PIN_H23  -to GPIO0_CLKOUT[0]
set_location_assignment PIN_G24  -to GPIO0_CLKOUT[1]

set_location_assignment PIN_G27  -to GPIO1_D[0]
set_location_assignment PIN_G28  -to GPIO1_D[1]
set_location_assignment PIN_H27  -to GPIO1_D[2]
set_location_assignment PIN_L24  -to GPIO1_D[3]
set_location_assignment PIN_H28  -to GPIO1_D[4]
set_location_assignment PIN_L25  -to GPIO1_D[5]
set_location_assignment PIN_K27  -to GPIO1_D[6]
set_location_assignment PIN_L28  -to GPIO1_D[7]
set_location_assignment PIN_K28  -to GPIO1_D[8]
set_location_assignment PIN_L27  -to GPIO1_D[9]
set_location_assignment PIN_K29  -to GPIO1_D[10]
set_location_assignment PIN_M25  -to GPIO1_D[11]
set_location_assignment PIN_K30  -to GPIO1_D[12]
set_location_assignment PIN_M24  -to GPIO1_D[13]
set_location_assignment PIN_L29  -to GPIO1_D[14]
set_location_assignment PIN_L30  -to GPIO1_D[15]
set_location_assignment PIN_P26  -to GPIO1_D[16]
set_location_assignment PIN_P28  -to GPIO1_D[17]
set_location_assignment PIN_P25  -to GPIO1_D[18]
set_location_assignment PIN_P27  -to GPIO1_D[19]
set_location_assignment PIN_M29  -to GPIO1_D[20]
set_location_assignment PIN_R26  -to GPIO1_D[21]
set_location_assignment PIN_M30  -to GPIO1_D[22]
set_location_assignment PIN_R27  -to GPIO1_D[23]
set_location_assignment PIN_P24  -to GPIO1_D[24]
set_location_assignment PIN_N28  -to GPIO1_D[25]
set_location_assignment PIN_P23  -to GPIO1_D[26]
set_location_assignment PIN_N29  -to GPIO1_D[27]
set_location_assignment PIN_R23  -to GPIO1_D[28]
set_location_assignment PIN_P29  -to GPIO1_D[29]
set_location_assignment PIN_R22  -to GPIO1_D[30]
set_location_assignment PIN_P30  -to GPIO1_D[31]
set_location_assignment PIN_AH14 -to GPIO1_CLKIN[0]
set_location_assignment PIN_AG15 -to GPIO1_CLKIN[1]
set_location_assignment PIN_AF27 -to GPIO1_CLKOUT[0]
set_location_assignment PIN_AF28 -to GPIO1_CLKOUT[1]

# Table 5.11: Pin assignments for ADV7123.
set_location_assignment PIN_D23  -to VGA_R[0]
set_location_assignment PIN_E23  -to VGA_R[1]
set_location_assignment PIN_E22  -to VGA_R[2]
set_location_assignment PIN_D22  -to VGA_R[3]
set_location_assignment PIN_H21  -to VGA_R[4]
set_location_assignment PIN_G21  -to VGA_R[5]
set_location_assignment PIN_H20  -to VGA_R[6]
set_location_assignment PIN_F20  -to VGA_R[7]
set_location_assignment PIN_E20  -to VGA_R[8]
set_location_assignment PIN_G20  -to VGA_R[9]
set_location_assignment PIN_A10  -to VGA_G[0]
set_location_assignment PIN_B11  -to VGA_G[1]
set_location_assignment PIN_A11  -to VGA_G[2]
set_location_assignment PIN_C12  -to VGA_G[3]
set_location_assignment PIN_B12  -to VGA_G[4]
set_location_assignment PIN_A12  -to VGA_G[5]
set_location_assignment PIN_C13  -to VGA_G[6]
set_location_assignment PIN_B13  -to VGA_G[7]
set_location_assignment PIN_B14  -to VGA_G[8]
set_location_assignment PIN_A14  -to VGA_G[9]
set_location_assignment PIN_B16  -to VGA_B[0]
set_location_assignment PIN_C16  -to VGA_B[1]
set_location_assignment PIN_A17  -to VGA_B[2]
set_location_assignment PIN_B17  -to VGA_B[3]
set_location_assignment PIN_C18  -to VGA_B[4]
set_location_assignment PIN_B18  -to VGA_B[5]
set_location_assignment PIN_B19  -to VGA_B[6]
set_location_assignment PIN_A19  -to VGA_B[7]
set_location_assignment PIN_C19  -to VGA_B[8]
set_location_assignment PIN_D19  -to VGA_B[9]
set_location_assignment PIN_D24  -to VGA_CLK
set_location_assignment PIN_C15  -to VGA_BLANK
set_location_assignment PIN_J19  -to VGA_HS
set_location_assignment PIN_H19  -to VGA_VS
set_location_assignment PIN_B15  -to VGA_SYNC

# Table 5.12: Pin assignments for Audio CODEC.
set_location_assignment PIN_F19  -to AUD_ADCLRCK
set_location_assignment PIN_E19  -to AUD_ADCDAT
set_location_assignment PIN_G18  -to AUD_DACLRCK
set_location_assignment PIN_F18  -to AUD_DACDAT
set_location_assignment PIN_D17  -to AUD_XCK
set_location_assignment PIN_E17  -to AUD_BCLK
set_location_assignment PIN_J18  -to I2C_SCLK
set_location_assignment PIN_H18  -to I2C_SDAT

# Table 5.13: Pin assignments for RS-232.
set_location_assignment PIN_D21  -to UART_RXD
set_location_assignment PIN_E21  -to UART_TXD
set_location_assignment PIN_G22  -to UART_CTS
set_location_assignment PIN_F23  -to UART_RTS

# Table 5.14: Pin assignments for PS/2.
set_location_assignment PIN_F24  -to PS2_KBCLK
set_location_assignment PIN_E24  -to PS2_KBDAT
set_location_assignment PIN_D26  -to PS2_MSCLK
set_location_assignment PIN_D25  -to PS2_MSDAT

# Table 5.15: Pin assignments for Fast Ethernet.
set_location_assignment PIN_A23  -to ENET_DATA[0]
set_location_assignment PIN_C22  -to ENET_DATA[1]
set_location_assignment PIN_B22  -to ENET_DATA[2]
set_location_assignment PIN_A22  -to ENET_DATA[3]
set_location_assignment PIN_B21  -to ENET_DATA[4]
set_location_assignment PIN_A21  -to ENET_DATA[5]
set_location_assignment PIN_B20  -to ENET_DATA[6]
set_location_assignment PIN_A20  -to ENET_DATA[7]
set_location_assignment PIN_B26  -to ENET_DATA[8]
set_location_assignment PIN_A26  -to ENET_DATA[9]
set_location_assignment PIN_B25  -to ENET_DATA[10]
set_location_assignment PIN_A25  -to ENET_DATA[11]
set_location_assignment PIN_C24  -to ENET_DATA[12]
set_location_assignment PIN_B24  -to ENET_DATA[13]
set_location_assignment PIN_A24  -to ENET_DATA[14]
set_location_assignment PIN_B23  -to ENET_DATA[15]
set_location_assignment PIN_D27  -to ENET_CLK
set_location_assignment PIN_B27  -to ENET_CMD
set_location_assignment PIN_C28  -to ENET_CS
set_location_assignment PIN_C27  -to ENET_INT
set_location_assignment PIN_A28  -to ENET_IOR
set_location_assignment PIN_B28  -to ENET_IOW
set_location_assignment PIN_B29  -to ENET_RESET

# Table 5.16: Pin assignments for TV Decoder.
set_location_assignment PIN_A6   -to TD1_D[0]
set_location_assignment PIN_B6   -to TD1_D[1]
set_location_assignment PIN_A5   -to TD1_D[2]
set_location_assignment PIN_B5   -to TD1_D[3]
set_location_assignment PIN_B4   -to TD1_D[4]
set_location_assignment PIN_C4   -to TD1_D[5]
set_location_assignment PIN_A3   -to TD1_D[6]
set_location_assignment PIN_B3   -to TD1_D[7]
set_location_assignment PIN_E13  -to TD1_HS
set_location_assignment PIN_E14  -to TD1_VS
set_location_assignment PIN_G15  -to TD1_CLK27
set_location_assignment PIN_D14  -to TD1_RESET
set_location_assignment PIN_C10  -to TD2_D[0]
set_location_assignment PIN_A9   -to TD2_D[1]
set_location_assignment PIN_B9   -to TD2_D[2]
set_location_assignment PIN_C9   -to TD2_D[3]
set_location_assignment PIN_A8   -to TD2_D[4]
set_location_assignment PIN_B8   -to TD2_D[5]
set_location_assignment PIN_A7   -to TD2_D[6]
set_location_assignment PIN_B7   -to TD2_D[7]
set_location_assignment PIN_E15  -to TD2_HS
set_location_assignment PIN_D15  -to TD2_VS
set_location_assignment PIN_H15  -to TD2_CLK27
set_location_assignment PIN_B10  -to TD2_RESET
#set_location_assignment PIN_J18  -to I2C_SCLK
#set_location_assignment PIN_H18  -to I2C_SDAT

# Table 5.17: Pin assignments for USB(ISP1362).
set_location_assignment PIN_E9   -to OTG_A[0]
set_location_assignment PIN_D8   -to OTG_A[1]
set_location_assignment PIN_H10  -to OTG_D[0]
set_location_assignment PIN_G9   -to OTG_D[1]
set_location_assignment PIN_G11  -to OTG_D[2]
set_location_assignment PIN_F11  -to OTG_D[3]
set_location_assignment PIN_J12  -to OTG_D[4]
set_location_assignment PIN_H12  -to OTG_D[5]
set_location_assignment PIN_H13  -to OTG_D[6]
set_location_assignment PIN_G13  -to OTG_D[7]
set_location_assignment PIN_D4   -to OTG_D[8]
set_location_assignment PIN_D5   -to OTG_D[9]
set_location_assignment PIN_D6   -to OTG_D[10]
set_location_assignment PIN_E7   -to OTG_D[11]
set_location_assignment PIN_D7   -to OTG_D[12]
set_location_assignment PIN_E8   -to OTG_D[13]
set_location_assignment PIN_D9   -to OTG_D[14]
set_location_assignment PIN_G10  -to OTG_D[15]
set_location_assignment PIN_E10  -to OTG_CS
set_location_assignment PIN_D10  -to OTG_OE
set_location_assignment PIN_E11  -to OTG_WE
set_location_assignment PIN_H14  -to OTG_RESET
set_location_assignment PIN_F13  -to OTG_INT0
set_location_assignment PIN_J13  -to OTG_INT1
set_location_assignment PIN_D12  -to OTG_DACK0
set_location_assignment PIN_E12  -to OTG_DACK1
set_location_assignment PIN_G12  -to OTG_DREQ0
set_location_assignment PIN_F12  -to OTG_DREQ1
set_location_assignment PIN_F7   -to OTG_FSPEED
set_location_assignment PIN_F8   -to OTG_LSPEED

# Table 5.18: Pin assignments for IrDA.
set_location_assignment PIN_W21  -to IRDA_TXD
set_location_assignment PIN_W22  -to IRDA_RXD


# Table 5.19: Pin assignments for SDRAM.
set_location_assignment PIN_AA4  -to DRAM0_A[0]
set_location_assignment PIN_AA5  -to DRAM0_A[1]
set_location_assignment PIN_AA6  -to DRAM0_A[2]
set_location_assignment PIN_AB5  -to DRAM0_A[3]
set_location_assignment PIN_AB7  -to DRAM0_A[4]
set_location_assignment PIN_AC4  -to DRAM0_A[5]
set_location_assignment PIN_AC5  -to DRAM0_A[6]
set_location_assignment PIN_AC6  -to DRAM0_A[7]
set_location_assignment PIN_AD4  -to DRAM0_A[8]
set_location_assignment PIN_AC7  -to DRAM0_A[9]
set_location_assignment PIN_Y8   -to DRAM0_A[10]
set_location_assignment PIN_AE4  -to DRAM0_A[11]
set_location_assignment PIN_AF4  -to DRAM0_A[12]
set_location_assignment PIN_AC1  -to DRAM0_D[0]
set_location_assignment PIN_AC2  -to DRAM0_D[1]
set_location_assignment PIN_AC3  -to DRAM0_D[2]
set_location_assignment PIN_AD1  -to DRAM0_D[3]
set_location_assignment PIN_AD2  -to DRAM0_D[4]
set_location_assignment PIN_AD3  -to DRAM0_D[5]
set_location_assignment PIN_AE1  -to DRAM0_D[6]
set_location_assignment PIN_AE2  -to DRAM0_D[7]
set_location_assignment PIN_AE3  -to DRAM0_D[8]
set_location_assignment PIN_AF1  -to DRAM0_D[9]
set_location_assignment PIN_AF2  -to DRAM0_D[10]
set_location_assignment PIN_AF3  -to DRAM0_D[11]
set_location_assignment PIN_AG2  -to DRAM0_D[12]
set_location_assignment PIN_AG3  -to DRAM0_D[13]
set_location_assignment PIN_AH1  -to DRAM0_D[14]
set_location_assignment PIN_AH2  -to DRAM0_D[15]
set_location_assignment PIN_AA9  -to DRAM0_BA[0]
set_location_assignment PIN_AA10 -to DRAM0_BA[1]
set_location_assignment PIN_V9   -to DRAM0_LDQM
set_location_assignment PIN_AB6  -to DRAM0_UDQM
set_location_assignment PIN_Y9   -to DRAM0_RAS
set_location_assignment PIN_W10  -to DRAM0_CAS
set_location_assignment PIN_AA8  -to DRAM0_CKE
set_location_assignment PIN_AD6  -to DRAM0_CLK
set_location_assignment PIN_W9   -to DRAM0_WE
set_location_assignment PIN_Y10  -to DRAM0_CS

set_location_assignment PIN_T5   -to DRAM1_A[0]
set_location_assignment PIN_T6   -to DRAM1_A[1]
set_location_assignment PIN_U4   -to DRAM1_A[2]
set_location_assignment PIN_U6   -to DRAM1_A[3]
set_location_assignment PIN_U7   -to DRAM1_A[4]
set_location_assignment PIN_V7   -to DRAM1_A[5]
set_location_assignment PIN_V8   -to DRAM1_A[6]
set_location_assignment PIN_W4   -to DRAM1_A[7]
set_location_assignment PIN_W7   -to DRAM1_A[8]
set_location_assignment PIN_W8   -to DRAM1_A[9]
set_location_assignment PIN_T4   -to DRAM1_A[10]
set_location_assignment PIN_Y4   -to DRAM1_A[11]
set_location_assignment PIN_Y7   -to DRAM1_A[12]
set_location_assignment PIN_U1   -to DRAM1_D[0]
set_location_assignment PIN_U2   -to DRAM1_D[1]
set_location_assignment PIN_U3   -to DRAM1_D[2]
set_location_assignment PIN_V2   -to DRAM1_D[3]
set_location_assignment PIN_V3   -to DRAM1_D[4]
set_location_assignment PIN_W1   -to DRAM1_D[5]
set_location_assignment PIN_W2   -to DRAM1_D[6]
set_location_assignment PIN_W3   -to DRAM1_D[7]
set_location_assignment PIN_Y1   -to DRAM1_D[8]
set_location_assignment PIN_Y2   -to DRAM1_D[9]
set_location_assignment PIN_Y3   -to DRAM1_D[10]
set_location_assignment PIN_AA1  -to DRAM1_D[11]
set_location_assignment PIN_AA2  -to DRAM1_D[12]
set_location_assignment PIN_AA3  -to DRAM1_D[13]
set_location_assignment PIN_AB1  -to DRAM1_D[14]
set_location_assignment PIN_AB2  -to DRAM1_D[15]
set_location_assignment PIN_T7   -to DRAM1_BA[0]
set_location_assignment PIN_T8   -to DRAM1_BA[1]
set_location_assignment PIN_M10  -to DRAM1_LDQM
set_location_assignment PIN_U8   -to DRAM1_UDQM
set_location_assignment PIN_N9   -to DRAM1_RAS
set_location_assignment PIN_N8   -to DRAM1_CAS
set_location_assignment PIN_L10  -to DRAM1_CKE
set_location_assignment PIN_G5   -to DRAM1_CLK
set_location_assignment PIN_M9   -to DRAM1_WE
set_location_assignment PIN_P9   -to DRAM1_CS

# Table 5.20: Pin assignments for SSRAM.
set_location_assignment PIN_AG8  -to SRAM_A[0]
set_location_assignment PIN_AF8  -to SRAM_A[1]
set_location_assignment PIN_AH7  -to SRAM_A[2]
set_location_assignment PIN_AG7  -to SRAM_A[3]
set_location_assignment PIN_AG6  -to SRAM_A[4]
set_location_assignment PIN_AG5  -to SRAM_A[5]
set_location_assignment PIN_AE12 -to SRAM_A[6]
set_location_assignment PIN_AG12 -to SRAM_A[7]
set_location_assignment PIN_AD13 -to SRAM_A[8]
set_location_assignment PIN_AE13 -to SRAM_A[9]
set_location_assignment PIN_AF14 -to SRAM_A[10]
set_location_assignment PIN_AG14 -to SRAM_A[11]
set_location_assignment PIN_AE15 -to SRAM_A[12]
set_location_assignment PIN_AF15 -to SRAM_A[13]
set_location_assignment PIN_AC16 -to SRAM_A[14]
set_location_assignment PIN_AF20 -to SRAM_A[15]
set_location_assignment PIN_AG20 -to SRAM_A[16]
set_location_assignment PIN_AE11 -to SRAM_A[17]
set_location_assignment PIN_AF11 -to SRAM_A[18]
set_location_assignment PIN_AH10 -to SRAM_D[0]
set_location_assignment PIN_AJ10 -to SRAM_D[1]
set_location_assignment PIN_AK10 -to SRAM_D[2]
set_location_assignment PIN_AJ11 -to SRAM_D[3]
set_location_assignment PIN_AK11 -to SRAM_D[4]
set_location_assignment PIN_AH12 -to SRAM_D[5]
set_location_assignment PIN_AJ12 -to SRAM_D[6]
set_location_assignment PIN_AH16 -to SRAM_D[7]
set_location_assignment PIN_AK17 -to SRAM_D[8]
set_location_assignment PIN_AJ17 -to SRAM_D[9]
set_location_assignment PIN_AH17 -to SRAM_D[10]
set_location_assignment PIN_AJ18 -to SRAM_D[11]
set_location_assignment PIN_AH18 -to SRAM_D[12]
set_location_assignment PIN_AK19 -to SRAM_D[13]
set_location_assignment PIN_AJ19 -to SRAM_D[14]
set_location_assignment PIN_AK23 -to SRAM_D[15]
set_location_assignment PIN_AJ20 -to SRAM_D[16]
set_location_assignment PIN_AK21 -to SRAM_D[17]
set_location_assignment PIN_AJ21 -to SRAM_D[18]
set_location_assignment PIN_AK22 -to SRAM_D[19]
set_location_assignment PIN_AJ22 -to SRAM_D[20]
set_location_assignment PIN_AH15 -to SRAM_D[21]
set_location_assignment PIN_AJ15 -to SRAM_D[22]
set_location_assignment PIN_AJ16 -to SRAM_D[23]
set_location_assignment PIN_AK14 -to SRAM_D[24]
set_location_assignment PIN_AJ14 -to SRAM_D[25]
set_location_assignment PIN_AJ13 -to SRAM_D[26]
set_location_assignment PIN_AH13 -to SRAM_D[27]
set_location_assignment PIN_AK12 -to SRAM_D[28]
set_location_assignment PIN_AK7  -to SRAM_D[29]
set_location_assignment PIN_AJ8  -to SRAM_D[30]
set_location_assignment PIN_AK8  -to SRAM_D[31]
set_location_assignment PIN_AK9  -to SRAM_DP[0]
set_location_assignment PIN_AJ23 -to SRAM_DP[1]
set_location_assignment PIN_AK20 -to SRAM_DP[2]
set_location_assignment PIN_AJ9  -to SRAM_DP[3]
set_location_assignment PIN_AD7  -to SRAM_CLK
set_location_assignment PIN_AH19 -to SRAM_CE1
set_location_assignment PIN_AG19 -to SRAM_CE2
set_location_assignment PIN_AD22 -to SRAM_CE3
set_location_assignment PIN_AG17 -to SRAM_ADSC
set_location_assignment PIN_AC18 -to SRAM_ADSP
set_location_assignment PIN_AD16 -to SRAM_ADV
set_location_assignment PIN_AD18 -to SRAM_OE
set_location_assignment PIN_AG18 -to SRAM_GW
set_location_assignment PIN_AF18 -to SRAM_BWE
set_location_assignment PIN_AC21 -to SRAM_BW[0]
set_location_assignment PIN_AC20 -to SRAM_BW[1]
set_location_assignment PIN_AD20 -to SRAM_BW[2]
set_location_assignment PIN_AH20 -to SRAM_BW[3]

# Table 5.21: Pin assignments for Flash memory.
set_location_assignment PIN_AF24 -to FLASH_A[0]
set_location_assignment PIN_AG24 -to FLASH_A[1]
set_location_assignment PIN_AE23 -to FLASH_A[2]
set_location_assignment PIN_AG23 -to FLASH_A[3]
set_location_assignment PIN_AF23 -to FLASH_A[4]
set_location_assignment PIN_AG22 -to FLASH_A[5]
set_location_assignment PIN_AH22 -to FLASH_A[6]
set_location_assignment PIN_AF22 -to FLASH_A[7]
set_location_assignment PIN_AH27 -to FLASH_A[8]
set_location_assignment PIN_AJ27 -to FLASH_A[9]
set_location_assignment PIN_AH26 -to FLASH_A[10]
set_location_assignment PIN_AJ26 -to FLASH_A[11]
set_location_assignment PIN_AK26 -to FLASH_A[12]
set_location_assignment PIN_AJ25 -to FLASH_A[13]
set_location_assignment PIN_AK25 -to FLASH_A[14]
set_location_assignment PIN_AH24 -to FLASH_A[15]
set_location_assignment PIN_AG25 -to FLASH_A[16]
set_location_assignment PIN_AF21 -to FLASH_A[17]
set_location_assignment PIN_AD21 -to FLASH_A[18]
set_location_assignment PIN_AK28 -to FLASH_A[19]
set_location_assignment PIN_AJ28 -to FLASH_A[20]
set_location_assignment PIN_AE20 -to FLASH_A[21]
set_location_assignment PIN_AF29 -to FLASH_D[0]
set_location_assignment PIN_AE28 -to FLASH_D[1]
set_location_assignment PIN_AE30 -to FLASH_D[2]
set_location_assignment PIN_AD30 -to FLASH_D[3]
set_location_assignment PIN_AC29 -to FLASH_D[4]
set_location_assignment PIN_AB29 -to FLASH_D[5]
set_location_assignment PIN_AA29 -to FLASH_D[6]
set_location_assignment PIN_Y28  -to FLASH_D[7]
set_location_assignment PIN_AF30 -to FLASH_D[8]
set_location_assignment PIN_AE29 -to FLASH_D[9]
set_location_assignment PIN_AD29 -to FLASH_D[10]
set_location_assignment PIN_AC28 -to FLASH_D[11]
set_location_assignment PIN_AC30 -to FLASH_D[12]
set_location_assignment PIN_AB30 -to FLASH_D[13]
set_location_assignment PIN_AA30 -to FLASH_D[14]
set_location_assignment PIN_AE24 -to FLASH_D[15]
set_location_assignment PIN_Y29  -to FLASH_BYTE
set_location_assignment PIN_AG28 -to FLASH_CE
set_location_assignment PIN_AG29 -to FLASH_OE
set_location_assignment PIN_AH28 -to FLASH_RESET
set_location_assignment PIN_AH30 -to FLASH_RY
set_location_assignment PIN_AJ29 -to FLASH_WE
set_location_assignment PIN_AH29 -to FLASH_WP

# Table ?.??: Pin assignments for SD card.
set_location_assignment PIN_T26  -to SD_CLK
set_location_assignment PIN_W28  -to SD_CMD
set_location_assignment PIN_W29  -to SD_DAT0
set_location_assignment PIN_Y30  -to SD_DAT3

########

project_close
