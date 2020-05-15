#!quartus_sh -t
#

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

create_base_clock -fmax 48MHz -duty_cycle 50 m_clock

set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"

set_location_assignment PIN_27 -to m_clock
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to m_clock

set_location_assignment PIN_123 -to p_reset
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p_reset




#============================================================
# Altera DE1-SoC board settings
#============================================================

set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M08SAE144C8GES
#set_global_assignment -name TOP_LEVEL_ENTITY "MAX10"

#set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name SDC_FILE MAX10.sdc

set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"

set_location_assignment PIN_27 -to CLOCK_48
set_location_assignment PIN_89 -to sdram_addr[12]
set_location_assignment PIN_88 -to sdram_addr[11]
set_location_assignment PIN_97 -to sdram_addr[10]
set_location_assignment PIN_87 -to sdram_addr[9]
set_location_assignment PIN_86 -to sdram_addr[8]
set_location_assignment PIN_85 -to sdram_addr[7]
set_location_assignment PIN_84 -to sdram_addr[6]
set_location_assignment PIN_80 -to sdram_addr[5]
set_location_assignment PIN_81 -to sdram_addr[4]
set_location_assignment PIN_100 -to sdram_addr[3]
set_location_assignment PIN_101 -to sdram_addr[2]
set_location_assignment PIN_99 -to sdram_addr[1]
set_location_assignment PIN_98 -to sdram_addr[0]
set_location_assignment PIN_62 -to GPIO_0[0]
set_location_assignment PIN_61 -to GPIO_0[1]
set_location_assignment PIN_60 -to GPIO_0[2]
set_location_assignment PIN_59 -to GPIO_0[3]
set_location_assignment PIN_58 -to GPIO_0[4]
set_location_assignment PIN_57 -to GPIO_0[5]
set_location_assignment PIN_56 -to GPIO_0[6]
set_location_assignment PIN_55 -to GPIO_0[7]
set_location_assignment PIN_52 -to GPIO_0[8]
set_location_assignment PIN_50 -to GPIO_0[9]
set_location_assignment PIN_48 -to GPIO_0[10]
set_location_assignment PIN_47 -to GPIO_0[11]
set_location_assignment PIN_46 -to GPIO_0[12]
set_location_assignment PIN_45 -to GPIO_0[13]
set_location_assignment PIN_44 -to GPIO_0[14]
set_location_assignment PIN_43 -to GPIO_0[15]
set_location_assignment PIN_41 -to GPIO_0[16]
set_location_assignment PIN_39 -to GPIO_0[17]
set_location_assignment PIN_38 -to GPIO_0[18]
set_location_assignment PIN_62 -to GPIO_0_0
set_location_assignment PIN_61 -to GPIO_0_1
set_location_assignment PIN_60 -to GPIO_0_2
set_location_assignment PIN_59 -to GPIO_0_3
set_location_assignment PIN_58 -to GPIO_0_4
set_location_assignment PIN_57 -to GPIO_0_5
set_location_assignment PIN_56 -to GPIO_0_6
set_location_assignment PIN_55 -to GPIO_0_7
set_location_assignment PIN_52 -to GPIO_0_8
set_location_assignment PIN_50 -to GPIO_0_9
set_location_assignment PIN_48 -to GPIO_0_10
set_location_assignment PIN_47 -to GPIO_0_11
set_location_assignment PIN_46 -to GPIO_0_12
set_location_assignment PIN_45 -to GPIO_0_13
set_location_assignment PIN_44 -to GPIO_0_14
set_location_assignment PIN_43 -to GPIO_0_15
set_location_assignment PIN_41 -to GPIO_0_16
set_location_assignment PIN_39 -to GPIO_0_17
set_location_assignment PIN_38 -to GPIO_0_18
set_location_assignment PIN_124 -to GPIO_1[0]
set_location_assignment PIN_127 -to GPIO_1[1]
set_location_assignment PIN_130 -to GPIO_1[2]
set_location_assignment PIN_131 -to GPIO_1[3]
set_location_assignment PIN_132 -to GPIO_1[4]
set_location_assignment PIN_134 -to GPIO_1[5]
set_location_assignment PIN_135 -to GPIO_1[6]
set_location_assignment PIN_140 -to GPIO_1[7]
set_location_assignment PIN_141 -to GPIO_1[8]
set_location_assignment PIN_3   -to GPIO_1[9]
set_location_assignment PIN_6   -to GPIO_1[10]
set_location_assignment PIN_7   -to GPIO_1[11]
set_location_assignment PIN_8   -to GPIO_1[12]
set_location_assignment PIN_10  -to GPIO_1[13]
set_location_assignment PIN_11  -to GPIO_1[14]
set_location_assignment PIN_12  -to GPIO_1[15]
set_location_assignment PIN_13  -to GPIO_1[16]
set_location_assignment PIN_14  -to GPIO_1[17]
set_location_assignment PIN_17  -to GPIO_1[18]
set_location_assignment PIN_124 -to GPIO_1_0
set_location_assignment PIN_127 -to GPIO_1_1
set_location_assignment PIN_130 -to GPIO_1_2
set_location_assignment PIN_131 -to GPIO_1_3
set_location_assignment PIN_132 -to GPIO_1_4
set_location_assignment PIN_134 -to GPIO_1_5
set_location_assignment PIN_135 -to GPIO_1_6
set_location_assignment PIN_140 -to GPIO_1_7
set_location_assignment PIN_141 -to GPIO_1_8
set_location_assignment PIN_3   -to GPIO_1_9
set_location_assignment PIN_6   -to GPIO_1_10
set_location_assignment PIN_7   -to GPIO_1_11
set_location_assignment PIN_8   -to GPIO_1_12
set_location_assignment PIN_10  -to GPIO_1_13
set_location_assignment PIN_11  -to GPIO_1_14
set_location_assignment PIN_12  -to GPIO_1_15
set_location_assignment PIN_13  -to GPIO_1_16
set_location_assignment PIN_14  -to GPIO_1_17
set_location_assignment PIN_17  -to GPIO_1_18
set_location_assignment PIN_121 -to LED[2]
set_location_assignment PIN_122 -to LED[1]
set_location_assignment PIN_120 -to LED[0]
#set_location_assignment PIN_123 -to SW


#============================================================
# End of pin and io_standard assignments
#============================================================

project_close

