#!/usr/bin/env bash
###############################################################################
##
##       filename: hawks.sh
##    description: 
##        created: 2026/06/19
##         author: ticktechman
##
###############################################################################

make CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=hawks
riscv64-linux-gnu-objcopy -O verilog --verilog-data-width=1 ./build/platform/hawks/firmware/fw_payload.elf sbi.hex

###############################################################################
