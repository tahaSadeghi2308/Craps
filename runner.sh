#!/bin/bash

ghdl -a --std=08 src/rtl/datapath/random_counter.vhd src/tb/datapath/random_counter_tb.vhd
ghdl -e --std=08 random_counter_tb
ghdl -r --std=08 random_counter_tb --wave=random_counter_wave.ghw --stop-time=200ns
gtkwave random_counter_wave.ghw
