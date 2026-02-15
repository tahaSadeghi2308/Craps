#!/bin/bash

ghdl -a --std=08 src/rtl/datapath/test_logic.vhd src/tb/datapath/test_logic_tb.vhd
ghdl -e --std=08 test_logic_tb
ghdl -r --std=08 test_logic_tb --wave=test_logic_wave.ghw --stop-time=200ns
gtkwave test_logic_wave.ghw
