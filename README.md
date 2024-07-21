# Eight-Bit, Two-Function Calculator

This project is an eight-bit, two-function calculator designed to perform addition and subtraction using Verilog. This calculator is implemented on a DE10-Lite FPGA board with a keypad interface.

## Features
- **Arithmetic Unit (AU):** Performs addition and subtraction operations.
- **Input Unit (IU):** Handles input from the keypad.
- **Output Unit (OU):** Displays results on the LED and seven-segment displays.
- **Control Unit (CU):** Manages the state transitions for the calculator's operation.

## Lessons Learned
- Designed, built, and tested combinational and sequential logic circuits using Verilog HDL.
- Implemented and verified the functionality on an FPGA platform.

## Demo
Watch the demo video by clicking the image below:

[![Demo Video](https://img.youtube.com/vi/icjWzKKv6iw/0.jpg)](https://youtu.be/icjWzKKv6iw)

## Table of Results

| Operand A | Operand B | Operation | Result |
|-----------|-----------|-----------|--------|
| 34        | 75        | 34+75     | 109    |
| 34        | 75        | 34-75     | -041   |
| -34       | 75        | -34+75    | 041    |
| -34       | -75       | -34-75    | -109   |
| 127       | 9         | 127+9     | -120   |
| 127       | 9         | 127-9     | 118    |
| 9         | 9         | 9+9       | 018    |
| 9         | 9         | 9-9       | 000    |
| 86        | 125       | 86-125    | -039   |
| 86        | 125       | 86+125    | -045   |

## Unresolved Problems
1. Some LEDs are partially on; grounding those LEDs could fix this issue.
2. After pressing * for negative numbers, three digits must be entered. The hex display shows gibberish numbers until the third digit is entered.

## Project Details

- **Name:** Marwan Abu Lebdeh
- **Finish date of this project:** 30th of April 2024

## Technology Used
- Verilog HDL
- DE10-Lite FPGA Board
