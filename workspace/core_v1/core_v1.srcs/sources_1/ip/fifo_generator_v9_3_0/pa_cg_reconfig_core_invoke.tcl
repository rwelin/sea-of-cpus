# Tcl script generated by PlanAhead

set reloadAllCoreGenRepositories false

set tclUtilsPath "/opt/Xilinx/14.7/ISE_DS/PlanAhead/scripts/pa_cg_utils.tcl"

set repoPaths ""

set cgIndexMapPath "/home/nilewapp/project/sea-of-cpus/workspace/core_v1/core_v1.srcs/sources_1/ip/cg_lin_index_map.xml"

set cgProjectPath "/home/nilewapp/project/sea-of-cpus/workspace/core_v1/core_v1.srcs/sources_1/ip/fifo_generator_v9_3_0/coregen.cgc"

set ipFile "/home/nilewapp/project/sea-of-cpus/workspace/core_v1/core_v1.srcs/sources_1/ip/fifo_generator_v9_3_0/dual_clk_fifo.xco"

set ipName "dual_clk_fifo"

set chains "CUSTOMIZE_CURRENT_CHAIN INSTANTIATION_TEMPLATES_CHAIN"

set bomFilePath "/home/nilewapp/project/sea-of-cpus/workspace/core_v1/core_v1.srcs/sources_1/ip/fifo_generator_v9_3_0/pa_cg_bom.xml"

set cgPartSpec "xc7k70t-3fbg484"

set hdlType "VHDL"

# generate the IP
set result [source "/opt/Xilinx/14.7/ISE_DS/PlanAhead/scripts/pa_cg_reconfig_core.tcl"]

exit $result
