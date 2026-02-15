#!/bin/bash

ghdl -a src/rtl/datapath/adder.vhd src/tb/datapath/adder_tb.vhd
ghdl -e adder_tb
ghdl -r adder_tb --wave=adder_wave.ghw --stop-time=200ns
gtkwave adder_wave.ghw