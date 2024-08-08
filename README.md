# Eight-Bit, Two-Function Calculator

This project is an eight-bit, two-function calculator designed to perform addition and subtraction using Verilog. This calculator is implemented on a DE10-Lite FPGA board with a keypad interface.

## Features
- **Arithmetic Unit (AU):** Designed for 8-bit signed operations, handling overflow and negative results using two’s complement arithmetic.
- **Input Unit (IU):** Developed logic for real-time input processing from a keypad, including support for negative number entry and multi-digit inputs.
- **Output Unit (OU):** Managed output through hexadecimal to seven-segment conversion.
- **Control Unit (CU):** Implemented a finite state machine (FSM) in Verilog to control operation sequencing, input validation, and display output management.

<img width="471" alt="Screenshot 2024-07-20 at 8 30 30 PM" src="https://github.com/user-attachments/assets/a4448b66-76dd-4f8a-8874-241fe555b372"><br>
<img width="471" alt="image" src="https://github.com/user-attachments/assets/a09c73f9-ebee-4a7f-aa3e-d99c548bf499">

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
