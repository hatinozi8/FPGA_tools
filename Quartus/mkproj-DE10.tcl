#!quartus_sh -t
#
# mkproj-DE0
#
# 2013-07-10 Created for DE0 board

package require cmdline
set options {
	{ "project.arg" "" "project name" }
	{ "script.arg" "" "script file" }
	{ "reset.arg" "" "reset name" }
	{ "fit.arg" "" "fit name" }
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

if {$opt(fit) != ""} {
	set_global_assignment -name FITTER_EFFORT "$opt(fit)"
}


########
#============================================================
# Build by Terasic System Builder
#============================================================

set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name TOP_LEVEL_ENTITY "DE10"
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 15.1.0
set_global_assignment -name LAST_QUARTUS_VERSION 16.0.2
set_global_assignment -name PROJECT_CREATION_TIME_DATE "10:35:21 JUNE 13,2016"
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 484
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
set_global_assignment -name FORCE_CONFIGURATION_VCCIO ON
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
set_global_assignment -name INTERNAL_FLASH_UPDATE_MODE "Single Image with ERAM"

#============================================================
# NSL
#============================================================
set_location_assignment PIN_B8 -to p_reset
set_location_assignment PIN_P11 -to m_clock
#============================================================
# CLOCK
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CLK_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to MAX10_CLK1_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to MAX10_CLK2_50
set_location_assignment PIN_N5 -to ADC_CLK_10
#set_location_assignment PIN_P11 -to MAX10_CLK1_50
set_location_assignment PIN_N14 -to MAX10_CLK2_50

#============================================================
# SDRAM
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_LDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_UDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N
set_location_assignment PIN_U17 -to DRAM_ADDR[0]
set_location_assignment PIN_W19 -to DRAM_ADDR[1]
set_location_assignment PIN_V18 -to DRAM_ADDR[2]
set_location_assignment PIN_U18 -to DRAM_ADDR[3]
set_location_assignment PIN_U19 -to DRAM_ADDR[4]
set_location_assignment PIN_T18 -to DRAM_ADDR[5]
set_location_assignment PIN_T19 -to DRAM_ADDR[6]
set_location_assignment PIN_R18 -to DRAM_ADDR[7]
set_location_assignment PIN_P18 -to DRAM_ADDR[8]
set_location_assignment PIN_P19 -to DRAM_ADDR[9]
set_location_assignment PIN_T20 -to DRAM_ADDR[10]
set_location_assignment PIN_P20 -to DRAM_ADDR[11]
set_location_assignment PIN_R20 -to DRAM_ADDR[12]
set_location_assignment PIN_T21 -to DRAM_BA[0]
set_location_assignment PIN_T22 -to DRAM_BA[1]
set_location_assignment PIN_U21 -to DRAM_CAS_N
set_location_assignment PIN_N22 -to DRAM_CKE
set_location_assignment PIN_L14 -to DRAM_CLK
set_location_assignment PIN_U20 -to DRAM_CS_N
set_location_assignment PIN_Y21 -to DRAM_DQ[0]
set_location_assignment PIN_Y20 -to DRAM_DQ[1]
set_location_assignment PIN_AA22 -to DRAM_DQ[2]
set_location_assignment PIN_AA21 -to DRAM_DQ[3]
set_location_assignment PIN_Y22 -to DRAM_DQ[4]
set_location_assignment PIN_W22 -to DRAM_DQ[5]
set_location_assignment PIN_W20 -to DRAM_DQ[6]
set_location_assignment PIN_V21 -to DRAM_DQ[7]
set_location_assignment PIN_P21 -to DRAM_DQ[8]
set_location_assignment PIN_J22 -to DRAM_DQ[9]
set_location_assignment PIN_H21 -to DRAM_DQ[10]
set_location_assignment PIN_H22 -to DRAM_DQ[11]
set_location_assignment PIN_G22 -to DRAM_DQ[12]
set_location_assignment PIN_G20 -to DRAM_DQ[13]
set_location_assignment PIN_G19 -to DRAM_DQ[14]
set_location_assignment PIN_F22 -to DRAM_DQ[15]
set_location_assignment PIN_V22 -to DRAM_LDQM
set_location_assignment PIN_U22 -to DRAM_RAS_N
set_location_assignment PIN_J21 -to DRAM_UDQM
set_location_assignment PIN_V20 -to DRAM_WE_N

#============================================================
# SEG7
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[7]
set_location_assignment PIN_C14 -to HEX0[0]
set_location_assignment PIN_E15 -to HEX0[1]
set_location_assignment PIN_C15 -to HEX0[2]
set_location_assignment PIN_C16 -to HEX0[3]
set_location_assignment PIN_E16 -to HEX0[4]
set_location_assignment PIN_D17 -to HEX0[5]
set_location_assignment PIN_C17 -to HEX0[6]
set_location_assignment PIN_D15 -to HEX0[7]
set_location_assignment PIN_C18 -to HEX1[0]
set_location_assignment PIN_D18 -to HEX1[1]
set_location_assignment PIN_E18 -to HEX1[2]
set_location_assignment PIN_B16 -to HEX1[3]
set_location_assignment PIN_A17 -to HEX1[4]
set_location_assignment PIN_A18 -to HEX1[5]
set_location_assignment PIN_B17 -to HEX1[6]
set_location_assignment PIN_A16 -to HEX1[7]
set_location_assignment PIN_B20 -to HEX2[0]
set_location_assignment PIN_A20 -to HEX2[1]
set_location_assignment PIN_B19 -to HEX2[2]
set_location_assignment PIN_A21 -to HEX2[3]
set_location_assignment PIN_B21 -to HEX2[4]
set_location_assignment PIN_C22 -to HEX2[5]
set_location_assignment PIN_B22 -to HEX2[6]
set_location_assignment PIN_A19 -to HEX2[7]
set_location_assignment PIN_F21 -to HEX3[0]
set_location_assignment PIN_E22 -to HEX3[1]
set_location_assignment PIN_E21 -to HEX3[2]
set_location_assignment PIN_C19 -to HEX3[3]
set_location_assignment PIN_C20 -to HEX3[4]
set_location_assignment PIN_D19 -to HEX3[5]
set_location_assignment PIN_E17 -to HEX3[6]
set_location_assignment PIN_D22 -to HEX3[7]
set_location_assignment PIN_F18 -to HEX4[0]
set_location_assignment PIN_E20 -to HEX4[1]
set_location_assignment PIN_E19 -to HEX4[2]
set_location_assignment PIN_J18 -to HEX4[3]
set_location_assignment PIN_H19 -to HEX4[4]
set_location_assignment PIN_F19 -to HEX4[5]
set_location_assignment PIN_F20 -to HEX4[6]
set_location_assignment PIN_F17 -to HEX4[7]
set_location_assignment PIN_J20 -to HEX5[0]
set_location_assignment PIN_K20 -to HEX5[1]
set_location_assignment PIN_L18 -to HEX5[2]
set_location_assignment PIN_N18 -to HEX5[3]
set_location_assignment PIN_M20 -to HEX5[4]
set_location_assignment PIN_N19 -to HEX5[5]
set_location_assignment PIN_N20 -to HEX5[6]
set_location_assignment PIN_L19 -to HEX5[7]
#============================================================
# KEY
#============================================================
set_instance_assignment -name IO_STANDARD "3.3 V SCHMITT TRIGGER" -to KEY[0]
set_instance_assignment -name IO_STANDARD "3.3 V SCHMITT TRIGGER" -to KEY[1]
#set_location_assignment PIN_B8 -to KEY[0]
set_location_assignment PIN_A7 -to KEY[1]

#============================================================
# LED
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[9]
set_location_assignment PIN_A8 -to LEDR[0]
set_location_assignment PIN_A9 -to LEDR[1]
set_location_assignment PIN_A10 -to LEDR[2]
set_location_assignment PIN_B10 -to LEDR[3]
set_location_assignment PIN_D13 -to LEDR[4]
set_location_assignment PIN_C13 -to LEDR[5]
set_location_assignment PIN_E14 -to LEDR[6]
set_location_assignment PIN_D14 -to LEDR[7]
set_location_assignment PIN_A11 -to LEDR[8]
set_location_assignment PIN_B11 -to LEDR[9]

#============================================================
# SW
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[9]
set_location_assignment PIN_C10 -to SW[0]
set_location_assignment PIN_C11 -to SW[1]
set_location_assignment PIN_D12 -to SW[2]
set_location_assignment PIN_C12 -to SW[3]
set_location_assignment PIN_A12 -to SW[4]
set_location_assignment PIN_B12 -to SW[5]
set_location_assignment PIN_A13 -to SW[6]
set_location_assignment PIN_A14 -to SW[7]
set_location_assignment PIN_B14 -to SW[8]
set_location_assignment PIN_F15 -to SW[9]

#============================================================
# VGA
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VS
set_location_assignment PIN_P1 -to VGA_B[0]
set_location_assignment PIN_T1 -to VGA_B[1]
set_location_assignment PIN_P4 -to VGA_B[2]
set_location_assignment PIN_N2 -to VGA_B[3]
set_location_assignment PIN_W1 -to VGA_G[0]
set_location_assignment PIN_T2 -to VGA_G[1]
set_location_assignment PIN_R2 -to VGA_G[2]
set_location_assignment PIN_R1 -to VGA_G[3]
set_location_assignment PIN_N3 -to VGA_HS
set_location_assignment PIN_AA1 -to VGA_R[0]
set_location_assignment PIN_V1 -to VGA_R[1]
set_location_assignment PIN_Y2 -to VGA_R[2]
set_location_assignment PIN_Y1 -to VGA_R[3]
set_location_assignment PIN_N1 -to VGA_VS

#============================================================
# Accelerometer
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_INT[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_INT[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_SDI
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GSENSOR_SDO
set_location_assignment PIN_AB16 -to GSENSOR_CS_N
set_location_assignment PIN_Y14 -to GSENSOR_INT[0]
set_location_assignment PIN_Y13 -to GSENSOR_INT[1]
set_location_assignment PIN_AB15 -to GSENSOR_SCLK
set_location_assignment PIN_V11 -to GSENSOR_SDI
set_location_assignment PIN_V12 -to GSENSOR_SDO

#============================================================
# Arduino
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ARDUINO_IO[15]
set_instance_assignment -name IO_STANDARD "3.3 V SCHMITT TRIGGER" -to ARDUINO_RESET_N
set_location_assignment PIN_AB5 -to ARDUINO_IO[0]
set_location_assignment PIN_AB6 -to ARDUINO_IO[1]
set_location_assignment PIN_AB7 -to ARDUINO_IO[2]
set_location_assignment PIN_AB8 -to ARDUINO_IO[3]
set_location_assignment PIN_AB9 -to ARDUINO_IO[4]
set_location_assignment PIN_Y10 -to ARDUINO_IO[5]
set_location_assignment PIN_AA11 -to ARDUINO_IO[6]
set_location_assignment PIN_AA12 -to ARDUINO_IO[7]
set_location_assignment PIN_AB17 -to ARDUINO_IO[8]
set_location_assignment PIN_AA17 -to ARDUINO_IO[9]
set_location_assignment PIN_AB19 -to ARDUINO_IO[10]
set_location_assignment PIN_AA19 -to ARDUINO_IO[11]
set_location_assignment PIN_Y19 -to ARDUINO_IO[12]
set_location_assignment PIN_AB20 -to ARDUINO_IO[13]
set_location_assignment PIN_AB21 -to ARDUINO_IO[14]
set_location_assignment PIN_AA20 -to ARDUINO_IO[15]
set_location_assignment PIN_F16 -to ARDUINO_RESET_N

#============================================================
# GPIO, GPIO connect to GPIO Default
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[35]
set_location_assignment PIN_V10 -to GPIO[0]
set_location_assignment PIN_W10 -to GPIO[1]
set_location_assignment PIN_V9 -to GPIO[2]
set_location_assignment PIN_W9 -to GPIO[3]
set_location_assignment PIN_V8 -to GPIO[4]
set_location_assignment PIN_W8 -to GPIO[5]
set_location_assignment PIN_V7 -to GPIO[6]
set_location_assignment PIN_W7 -to GPIO[7]
set_location_assignment PIN_W6 -to GPIO[8]
set_location_assignment PIN_V5 -to GPIO[9]
set_location_assignment PIN_W5 -to GPIO[10]
set_location_assignment PIN_AA15 -to GPIO[11]
set_location_assignment PIN_AA14 -to GPIO[12]
set_location_assignment PIN_W13 -to GPIO[13]
set_location_assignment PIN_W12 -to GPIO[14]
set_location_assignment PIN_AB13 -to GPIO[15]
set_location_assignment PIN_AB12 -to GPIO[16]
set_location_assignment PIN_Y11 -to GPIO[17]
set_location_assignment PIN_AB11 -to GPIO[18]
set_location_assignment PIN_W11 -to GPIO[19]
set_location_assignment PIN_AB10 -to GPIO[20]
set_location_assignment PIN_AA10 -to GPIO[21]
set_location_assignment PIN_AA9 -to GPIO[22]
set_location_assignment PIN_Y8 -to GPIO[23]
set_location_assignment PIN_AA8 -to GPIO[24]
set_location_assignment PIN_Y7 -to GPIO[25]
set_location_assignment PIN_AA7 -to GPIO[26]
set_location_assignment PIN_Y6 -to GPIO[27]
set_location_assignment PIN_AA6 -to GPIO[28]
set_location_assignment PIN_Y5 -to GPIO[29]
set_location_assignment PIN_AA5 -to GPIO[30]
set_location_assignment PIN_Y4 -to GPIO[31]
set_location_assignment PIN_AB3 -to GPIO[32]
set_location_assignment PIN_Y3 -to GPIO[33]
set_location_assignment PIN_AB2 -to GPIO[34]
set_location_assignment PIN_AA2 -to GPIO[35]

#============================================================
# End of pin assignments by Terasic System Builder
#============================================================

set_global_assignment -name USE_CONFIGURATION_DEVICE OFF
set_global_assignment -name INTERNAL_FLASH_UPDATE_MODE "SINGLE IMAGE WITH ERAM"
set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
