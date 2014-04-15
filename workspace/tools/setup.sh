export XILINX=/opt/Xilinx/14.7/ISE_DS
export PLATFORM=lin64
export PATH=$PATH:${XILINX}/EDK/bin/${PLATFORM}:${XILINX}/ISE/bin/${PLATFORM}:${XILINX}/common/bin/${PLATFORM}:${XILINX}/PlanAhead/bin/${PLATFORM}
export LD_LIBRARY_PATH=${XILINX}/ISE/lib/${PLATFORM}:${XILINX}/EDK/lib/${PLATFORM}:${XILINX}/common/lib/${PLATFORM}:${XILINX}/PlanAhead/lib/${PLATFORM}

. ${XILINX}/settings64.sh
