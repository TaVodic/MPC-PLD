# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Temp\240703\PLD\PC11\ARM_demo\SDK\rp_zynq_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Temp\240703\PLD\PC11\ARM_demo\SDK\rp_zynq_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {rp_zynq_wrapper}\
-hw {C:\Temp\240703\PLD\PC11\ARM_demo\rp_zynq_wrapper.xsa}\
-out {C:/Temp/240703/PLD/PC11/ARM_demo/SDK}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {rp_zynq_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
domain active {zynq_fsbl}
bsp reload
bsp reload
platform generate
