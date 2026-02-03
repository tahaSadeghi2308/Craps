#!/bin/bash

ghdl -a src/rtl/datapath/comparator.vhd src/tb/datapath/comparator_tb.vhd
ghdl -e comparator_tb
ghdl -r comparator_tb --wave=comparator_wave.ghw --stop-time=200ns
gtkwave comparator_wave.ghw