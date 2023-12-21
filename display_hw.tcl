# TCL File Generated by Component Editor 21.1
# Tue Nov 21 20:46:36 MSK 2023
# DO NOT MODIFY


# 
# display "display" v1.0
#  2023.11.21.20:46:36
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module display
# 
set_module_property DESCRIPTION ""
set_module_property NAME display
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME display
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL segment_7
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file segment_7.vhd VHDL PATH components/segment_7.vhd


# 
# parameters
# 
add_parameter CLK_FREQ_HZ INTEGER 50000000
set_parameter_property CLK_FREQ_HZ DEFAULT_VALUE 50000000
set_parameter_property CLK_FREQ_HZ DISPLAY_NAME CLK_FREQ_HZ
set_parameter_property CLK_FREQ_HZ TYPE INTEGER
set_parameter_property CLK_FREQ_HZ UNITS None
set_parameter_property CLK_FREQ_HZ ALLOWED_RANGES -2147483648:2147483647
set_parameter_property CLK_FREQ_HZ HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point dig_sel
# 
add_interface dig_sel conduit end
set_interface_property dig_sel associatedClock clock
set_interface_property dig_sel associatedReset reset
set_interface_property dig_sel ENABLED true
set_interface_property dig_sel EXPORT_OF ""
set_interface_property dig_sel PORT_NAME_MAP ""
set_interface_property dig_sel CMSIS_SVD_VARIABLES ""
set_interface_property dig_sel SVD_ADDRESS_GROUP ""

add_interface_port dig_sel dig_sel dig_sel Output 4


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset en reset_n Input 1


# 
# connection point data_in
# 
add_interface data_in conduit end
set_interface_property data_in associatedClock clock
set_interface_property data_in associatedReset reset
set_interface_property data_in ENABLED true
set_interface_property data_in EXPORT_OF ""
set_interface_property data_in PORT_NAME_MAP ""
set_interface_property data_in CMSIS_SVD_VARIABLES ""
set_interface_property data_in SVD_ADDRESS_GROUP ""

add_interface_port data_in in_data data_7seg Input 8


# 
# connection point seg7_code
# 
add_interface seg7_code conduit end
set_interface_property seg7_code associatedClock clock
set_interface_property seg7_code associatedReset reset
set_interface_property seg7_code ENABLED true
set_interface_property seg7_code EXPORT_OF ""
set_interface_property seg7_code PORT_NAME_MAP ""
set_interface_property seg7_code CMSIS_SVD_VARIABLES ""
set_interface_property seg7_code SVD_ADDRESS_GROUP ""

add_interface_port seg7_code seg7_code seg7_code Output 8

