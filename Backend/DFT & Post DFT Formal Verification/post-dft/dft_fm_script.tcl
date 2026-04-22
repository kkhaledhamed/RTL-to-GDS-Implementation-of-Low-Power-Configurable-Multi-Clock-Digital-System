
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP_dft

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../DFT/$top_module.svf"


######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set fh [open /home/IC/Projects/System/Backend/DFT/system.lst r+]
set rtl [read $fh]
set designs ""
regsub -all "\n" $rtl " " designs

######################### Reference Container ############################

## Read Reference Design Files
read_verilog -container Ref $designs

## Read Reference technology libraries
set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## set the top Reference Design 
set_reference_design SYS_TOP_dft
set_top SYS_TOP_dft

######################## Implementation Container #########################

## Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
read_verilog -container Imp -netlist "/home/IC/Projects/System/Backend/DFT/netlists/SYS_TOP_dft.v"
 
## set the top Implementation Design
set_implementation_design SYS_TOP_dft
set_top SYS_TOP_dft

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
set_dont_verify_points -type port Ref:/WORK/*/SI*
set_dont_verify_points -type port Imp:/WORK/*/SI*

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO*
set_dont_verify_points -type port Imp:/WORK/*/SO*

############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
