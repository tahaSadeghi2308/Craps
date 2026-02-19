# Craps Game - VHDL Implementation

A digital hardware implementation of the classic casino dice game "Craps" written in VHDL.

## Overview

This project implements a Craps game using VHDL. The design follows a structural architecture with a control unit (FSM) and datapath components.

## Game Rules

1. **First Roll (Come-out Roll):**
   - Roll 7 or 11: **WIN**
   - Roll 2, 3, or 12: **LOSE**
   - Roll any other number (4, 5, 6, 8, 9, 10): That number becomes the **Point**

2. **Point Round:**
   - Continue rolling until:
     - Roll the Point: **WIN**
     - Roll 7: **LOSE**

## Project Structure

```
Craps/
├── README.md
├── runner.sh              # Test bench runner script
├── docs/
│   └── project_document.pdf
├── src/
│   ├── rtl/               # RTL source files
│   │   ├── CrapsGame.vhd  # Top-level entity
│   │   ├── control_unit/
│   │   │   └── cu.vhd     # Control unit (FSM)
│   │   └── datapath/
│   │       ├── adder.vhd          # N-bit adder
│   │       ├── comparator.vhd     # N-bit comparator
│   │       ├── point_reg.vhd      # Point register
│   │       ├── random_counter.vhd # Random counter (dice simulator)
│   │       ├── sevenseg.vhd       # 7-segment display decoder
│   │       └── test_logic.vhd     # Game logic tester
│   ├── tb/                # Test bench files
│   │   ├── CrapsGame_tb.vhd
│   │   ├── control_unit/
│   │   │   └── cu_tb.vhd
│   │   └── datapath/
│   │       ├── adder_tb.vhd
│   │       ├── comparator_tb.vhd
│   │       ├── point_reg_tb.vhd
│   │       ├── random_counter_tb.vhd
│   │       ├── sevenseg_tb.vhd
│   │       └── test_logic_tb.vhd
│   └── waveform/
│       ├── images/        # Waveform screenshots
│       └── waves/         # GHDL waveform files
└── work/                  # GHDL working directory
```

## Entity Interface

### CrapsGame (Top Level)

| Port     | Direction | Type                  | Description                 |
| -------- | --------- | --------------------- | --------------------------- |
| clk      | in        | std_logic             | System clock                |
| reset    | in        | std_logic             | Active-high reset           |
| roll     | in        | std_logic             | Roll button (active-high)   |
| seg1     | out       | std_logic_vector(6:0) | 7-segment display for die 1 |
| seg2     | out       | std_logic_vector(6:0) | 7-segment display for die 2 |
| win_led  | out       | std_logic             | Win indicator LED           |
| lose_led | out       | std_logic             | Lose indicator LED          |

## Architecture

The design uses a structural architecture with:

- **Control Unit (cu.vhd):** 6-state FSM controlling game flow
  - s0: Initial/Idle state
  - s1: Rolling state
  - s2: Win state
  - s3: Lose state
  - s4: Point established state
  - s5: Rolling for point state

- **Datapath Components:**
  - `random_counter`: Simulates dice roll (values 1-6)
  - `adder`: Sums two dice values
  - `point_reg`: Stores the point value
  - `comparator`: Compares sum with point
  - `test_logic`: Detects win/lose conditions (7, 11, 2, 3, 12)
  - `sevenseg`: Drives 7-segment displays

## Simulation

### Prerequisites

- [GHDL](https://ghdl.github.io/ghdl/) - VHDL simulator
- [GTKWave](http://gtkwave.sourceforge.net/) - Waveform viewer (optional)

### Running Tests

Run the complete test bench:

```bash
chmod +x runner.sh
./runner.sh
```

This will:
1. Compile all RTL files in dependency order
2. Compile the test bench
3. Run simulation for 5µs
4. Generate waveform file `CrapsGame_wave.ghw`

### Viewing Waveforms

```bash
gtkwave CrapsGame_wave.ghw
```

### Individual Component Tests

Each component has its own test bench in `src/tb/datapath/`:

```bash
# Example: Run adder test bench
ghdl -a --std=08 src/rtl/datapath/adder.vhd src/tb/datapath/adder_tb.vhd
ghdl -e --std=08 adder_tb
ghdl -r --std=08 adder_tb --wave=adder_wave.ghw
gtkwave adder_wave.ghw
```

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## Author
VHDL Craps Game Implemented by me and my dear friend [Kasra Alirezaei](https://github.com/kasra-git)