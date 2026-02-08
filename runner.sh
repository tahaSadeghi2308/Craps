#!/bin/bash

ghdl -a --std=08 src/rtl/control_unit/cu.vhd src/tb/control_unit/cu_tb.vhd
ghdl -e --std=08 cu_tb
ghdl -r --std=08 cu_tb --wave=cu_wave.ghw --stop-time=200ns
gtkwave cu_wave.ghw