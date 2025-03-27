# Traffic Light Controller in Verilog

## Overview
This project implements a traffic light controller using Verilog. The controller manages the traffic lights at a junction and prioritizes emergency vehicles (ambulance, police, fire truck) when detected.

## Features
- Controls traffic lights for a two-road intersection.
- Detects special vehicles and prioritizes them.
- Implements a finite state machine (FSM) with multiple states for normal and emergency conditions.
- Uses a counter for timing transitions.

## Files
- **trafic_light_controller.v**: Verilog module for the traffic light controller.
- **tb_trafic_light_controller.v**: Testbench for simulating and verifying the traffic light controller.

## Simulation Instructions (Icarus Verilog)
1. Install Icarus Verilog (`iverilog`) if not installed.
2. Open a terminal and navigate to the project directory.
3. Compile the Verilog files:
   ```
   iverilog -o trafic_light_controller_output.out trafic_light_controller.v tb_trafic_light_controller.v
   ```
4. Run the simulation:
   ```
   vvp trafic_light_controller_output.out
   ```
5. View the waveform using GTKWave:
   ```
   gtkwave trafic_light_controller.vcd
   ```

## License
This project is open-source under the MIT License.

## Author
Developed by Anurag Pal.

