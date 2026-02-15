#!/bin/bash

ghdl -a --std=08 src/rtl/datapath/sevenseg.vhd src/tb/datapath/sevenseg_tb.vhd
ghdl -e --std=08 sevenseg_tb
ghdl -r --std=08 sevenseg_tb --wave=sevenseg_wave.ghw --stop-time=200ns
gtkwave sevenseg_wave.ghw
