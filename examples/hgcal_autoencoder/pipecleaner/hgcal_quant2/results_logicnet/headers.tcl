set file "$origin_dir/dummy_nachiket_fooling_zsh_for_loops.h"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property "file_type" "Verilog Header" $file_obj
