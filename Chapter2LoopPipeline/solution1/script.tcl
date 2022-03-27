############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Chapter2LoopPipeline
set_top fir
add_files ap_int.cpp
open_solution "solution1" -flow_target vivado
set_part {xcvu5p-flva2104-1-e}
create_clock -period 10 -name default
#source "./Chapter2LoopPipeline/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
