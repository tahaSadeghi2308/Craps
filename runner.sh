#!/bin/bash

ghdl -a src/rtl/datapath/point_reg.vhd src/tb/datapath/point_reg_tb.vhd
ghdl -e point_reg_tb
ghdl -r point_reg_tb --wave=point_reg_wave.ghw --stop-time=200ns
gtkwave point_reg_wave.ghw