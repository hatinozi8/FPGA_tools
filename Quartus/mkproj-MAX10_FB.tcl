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
set_location_assignment PIN_62 -to GPIO[0]
set_location_assignment PIN_61 -to GPIO[1]
set_location_assignment PIN_60 -to GPIO[2]
set_location_assignment PIN_59 -to GPIO[3]
set_location_assignment PIN_58 -to GPIO[4]
set_location_assignment PIN_57 -to GPIO[5]
set_location_assignment PIN_56 -to GPIO[6]
set_location_assignment PIN_55 -to GPIO[8]
set_location_assignment PIN_52 -to GPIO[9]
set_location_assignment PIN_48 -to GPIO[10]
set_location_assignment PIN_47 -to GPIO[11]
set_location_assignment PIN_46 -to GPIO[12]
set_location_assignment PIN_121 -to LED[2]
set_location_assignment PIN_122 -to LED[1]
set_location_assignment PIN_120 -to LED[0]
#set_location_assignment PIN_123 -to SW


#============================================================
# End of pin and io_standard assignments
#============================================================

project_close

