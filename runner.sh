#!/bin/bash

RTL_FILES=(
    "src/rtl/datapath/random_counter.vhd"
    "src/rtl/datapath/adder.vhd"
    "src/rtl/datapath/point_reg.vhd"
    "src/rtl/datapath/comparator.vhd"
    "src/rtl/datapath/test_logic.vhd"
    "src/rtl/datapath/sevenseg.vhd"
    "src/rtl/control_unit/cu.vhd"
    "src/rtl/CrapsGame.vhd"
)

TB_FILES=(
    "src/tb/CrapsGame_tb.vhd"
)

for file in "${RTL_FILES[@]}"; do
    echo "  Analyzing: $file"
    ghdl -a --std=08 "$file"
done

for file in "${TB_FILES[@]}"; do
    echo "  Analyzing: $file"
    ghdl -a --std=08 "$file"
done

ghdl -e --std=08 CrapsGame_tb

ghdl -r --std=08  CrapsGame_tb --wave=CrapsGame_wave.ghw --stop-time=5us

gtkwave CrapsGame_wave.ghw