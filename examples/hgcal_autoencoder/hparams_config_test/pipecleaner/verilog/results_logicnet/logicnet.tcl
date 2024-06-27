set fpga_part "xcu280-fsvh2892-2L-e"
# Note: must define fpga_part for this tcl script to run
# Vivado (TM) v2015.4.1 (64-bit)
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

variable script_file
set script_file "vivadocompile.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivadocompile"]"

# Create project
create_project -force vivadocompile ./vivadocompile -part $fpga_part

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects vivadocompile]
#set_property "board_part" "xilinx.com:vc707:part0:1.2" $obj
set_property "default_lib" "xil_defaultlib" $obj
set_property "sim.ip.auto_export_scripts" "1" $obj
set_property "simulator_language" "Mixed" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
# dynamically generate list of source files
source sources.tcl
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
source headers.tcl

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "top" "$argv" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/$argv.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/$argv.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "$argv" $obj
set_property "xelab.nosort" "1" $obj
set_property "xelab.unifast" "" $obj

set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]

# do not ignore failure-level VHDL assertions
set_param synth.elaboration.rodinMoreOptions {rt::set_parameter ignoreVhdlAssertStmts false}

set obj [get_runs synth_1]

set_property -name {steps.synth_design.args.more options} -value {-mode out_of_context} -objects $obj
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
#set_property "steps.synth_design.args.flatten_hierarchy" "none" $obj
#set_property "steps.synth_design.args.fanout_limit" "400" $obj
#set_property "steps.synth_design.args.keep_equivalent_registers" "1" $obj
#set_property "steps.synth_design.args.resource_sharing" "on" $obj
#set_property "steps.synth_design.args.no_lc" "1" $obj
#set_property "steps.synth_design.args.shreg_min_size" "5" $obj
#set_property "steps.synth_design.args.max_bram" "0" $obj
#set_property "steps.synth_design.args.max_dsp" "0" $obj


# set the current synth run
current_run -synthesis [get_runs synth_1]

set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]

set obj [get_runs impl_1]
set_property "steps.write_bitstream.args.readback_file" "0" $obj
set_property "steps.write_bitstream.args.verbose" "0" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:vivadocompile"

launch_runs -jobs 8 impl_1 -to_step route_design
wait_on_run impl_1
open_run impl_1
report_utilization
report_timing
report_power

set util [report_utilization -return_string]
set util_lut [exec echo $util | grep LUT | head -n 1 | cut -d| -f3 | tr -d " "]

#set util_lut [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *LUT*}]]
set util_ff [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *.F*E*}]]
set util_dsp [llength [get_cells -hier -filter {PRIMITIVE_GROUP == DSP}]]
set util_bram [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *BRAM*}]]
#set time_wns [get_property STATS.WNS [current_run]]
set time_wns [get_property SLACK [get_timing_paths]]

puts "LUT: $util_lut FF: $util_ff DSP: $util_dsp BRAM: $util_bram"

set fp [open res.txt w]
puts $fp "LUT=$util_lut"
puts $fp "FF=$util_ff"
puts $fp "DSP=$util_dsp"
puts $fp "BRAM=$util_bram"
puts $fp "WNS=$time_wns"
close $fp


write_verilog -mode funcsim logicnet_post_synth.v
exit
