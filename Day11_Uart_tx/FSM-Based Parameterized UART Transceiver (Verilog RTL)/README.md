# FSM-Based Parameterized UART Transceiver (Verilog RTL)

A synthesizable Universal Asynchronous Receiver-Transmitter (UART) communication controller designed in Verilog RTL. This project implements an FSM-based UART Transmitter and Receiver with parameterized baud-rate generation and verifies end-to-end serial communication through simulation using Icarus Verilog and GTKWave.

---

## Project Overview

UART (Universal Asynchronous Receiver-Transmitter) is one of the most widely used asynchronous serial communication protocols in embedded systems, microcontrollers, SoCs, and FPGA-based designs.

This project demonstrates the complete RTL implementation of a UART Transceiver, including:

- UART Transmitter (TX)
- UART Receiver (RX)
- Parameterized Baud Rate Generator
- FSM-Based Control Logic
- System-Level Loopback Verification
- GTKWave Timing Analysis

---

## Features

- FSM-Based UART Transmitter
- FSM-Based UART Receiver
- Configurable Baud Rate using `CLKS_PER_BIT`
- 8-bit Data Frame
- 1 Start Bit
- 1 Stop Bit
- No Parity
- Synthesizable RTL
- Modular Design
- Self-checking Testbench
- GTKWave Verification

---

## Project Architecture

```

+-------------------------------+
| UART Top |
+---------------+---------------+
|
+---------+---------+
| |
| |
v v

+---------------+      tx      +---------------+
| UART TX | -------------> | UART RX |
+---------------+ +---------------+
| |
| |
+---------+---------+
|
v

Received Data

```

---

## Finite State Machine

### UART Transmitter

```

IDLE
↓

START
↓

DATA
↓

STOP
↓

IDLE

```

### UART Receiver

```

IDLE
↓

START
↓

DATA
↓

STOP
↓

IDLE

```

---

## Directory Structure

```text
FSM-Based-Parameterized-UART-Transceiver/
│
├── RTL/
│   ├── uart_tx.v
│   ├── uart_rx.v
│   └── uart_top.v
│
├── TB/
│   ├── uart_tx_tb.v
│   └── uart_system_tb.v
│
├── simulation/
│   ├── uart_tx.vcd
│   └── uart_system.vcd
│
├── images/
│   ├── uart_tx_waveform.png
│   └── uart_system_waveform.png
│
└── README.md
```

---

## Simulation Flow

```

8-bit Parallel Data
↓

UART TX

↓

Serial Data

↓

UART RX

↓

Recovered Parallel Data

```

---

## Test Cases

| Test Case | Input | Expected Output |
|-----------|-------|-----------------|
| Test 1 | 0xA5 | PASS |
| Test 2 | 0x55 | PASS |
| Test 3 | 0xAA | PASS |
| Test 4 | 0xFF | PASS |
| Test 5 | 0x00 | PASS |

---

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- Git
- GitHub

---

## Compilation

```bash
iverilog -g2012 -o uart_system_sim RTL/uart_tx.v RTL/uart_rx.v RTL/uart_top.v TB/uart_system_tb.v
```

---

## Run Simulation

```bash
vvp uart_system_sim
```

---

## Open Waveform

```bash
gtkwave simulation/uart_system.vcd
```

---

## Verification

The UART Transceiver was verified using:

- Functional Simulation
- Loopback Testing
- GTKWave Timing Analysis
- Self-checking Testbench

---

## Future Improvements

- Configurable Data Width
- Configurable Stop Bits
- Even/Odd Parity Support
- FIFO Buffers
- Interrupt Generation
- APB Bus Interface
- FPGA Implementation
- UVM-Based Verification

---

## Applications

- FPGA Communication
- Embedded Systems
- Microcontroller Interfacing
- SoC Peripheral Communication
- Industrial Automation
- Sensor Networks
- IoT Devices

---

## Author

**Abhishek Mohammad**

B.Tech Electronics and Communication Engineering

NIT Jalandhar
