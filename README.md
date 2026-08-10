<div align="center">

# ⚡ Verilog-to-RISC-V

### A hands-on RTL design journey — from basic logic gates to RISC-V processors and SoC architecture

[![Verilog](https://img.shields.io/badge/HDL-Verilog-1f425f?style=for-the-badge)](https://www.verilog.com/)
[![Icarus Verilog](https://img.shields.io/badge/Simulation-Icarus%20Verilog-blue?style=for-the-badge)](https://steveicarus.github.io/iverilog/)
[![GTKWave](https://img.shields.io/badge/Waveform-GTKWave-orange?style=for-the-badge)](https://gtkwave.sourceforge.net/)
![Progress](https://img.shields.io/badge/Progress-Day%2005%20%2F%2015-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=for-the-badge)

</div>

---

## 📌 About This Repo

This repository documents my hands-on journey of learning **Verilog HDL, RTL design, digital hardware architecture, processor design, and VLSI fundamentals**, progressing from basic digital logic to **RISC-V processor and SoC concepts**.

Each day focuses on **one practical digital design concept** and its implementation in Verilog. The objective is not just to write code, but to understand how RTL describes hardware, how designs are simulated, how waveforms are analyzed, and how individual hardware modules are eventually integrated into larger systems.

> 💡 Every design is implemented and verified through simulation wherever applicable, with Verilog source files, testbenches, documentation, and waveform analysis included as the project progresses.

---

## 🚀 Progress Tracker

| Day | Project                          | Core Skills Covered                                      | Status |
| :-: | -------------------------------- | -------------------------------------------------------- | :----: |
|  01 | AND Gate                         | Basic RTL, Continuous Assignment, Testbench, Simulation  |    ✅   |
|  02 | Adders                           | Half Adder, Full Adder, Combinational RTL                |    ✅   |
|  03 | Multiplexers                     | 2:1 & 4:1 MUX, Selection Logic                           |    ✅   |
|  04 | Decoder & Encoder                | Decoder, Encoder, Combinational Logic                    |    ✅   |
|  05 | 4-bit ALU                        | Arithmetic & Logic Operations, Control Signals           |    ✅   |
|  06 | Flip-Flops                       | D, SR, JK & T Flip-Flops, Sequential Logic               |    ✅   |
|  07 | Counters                         | Up, Down & Mod-10 Counters                               |    ⬜   |
|  08 | Shift Registers                  | SISO, SIPO, PISO & PIPO                                  |    ⬜   |
|  09 | Traffic Light FSM                | Finite State Machines, Sequential Control                |    ⬜   |
|  10 | Sequence Detector                | FSM Design, Pattern Detection                            |    ⬜   |
|  11 | UART Transmitter                 | Serial Communication, Timing, FSM                        |    ⬜   |
|  12 | UART Receiver                    | Serial Reception, Sampling, FSM                          |    ⬜   |
|  13 | Single-Port RAM                  | Memory Design, Read/Write Control                        |    ⬜   |
|  14 | SPI Master                       | SPI Protocol, Serial Communication                       |    ⬜   |
|  15 | RISC-V / Digital System Capstone | RTL Integration, Processor Concepts, System Architecture |    ⬜   |

**Legend:** ✅ Complete · 🔄 In Progress · ⬜ Planned

---

## 🎯 Skills I'm Building

<div align="left">

![Verilog](https://img.shields.io/badge/Verilog%20HDL-RTL%20Design-4B8BBE?style=flat-square)
![Digital Logic](https://img.shields.io/badge/Digital%20Logic-Design-4B8BBE?style=flat-square)
![RTL](https://img.shields.io/badge/RTL-Design-4B8BBE?style=flat-square)
![FSM](https://img.shields.io/badge/FSM-State%20Machines-4B8BBE?style=flat-square)
![Memory](https://img.shields.io/badge/Memory-RAM%20Design-4B8BBE?style=flat-square)
![UART](https://img.shields.io/badge/UART-Communication-4B8BBE?style=flat-square)
![SPI](https://img.shields.io/badge/SPI-Communication-4B8BBE?style=flat-square)
![RISC-V](https://img.shields.io/badge/RISC--V-Processor%20Design-4B8BBE?style=flat-square)
![Verification](https://img.shields.io/badge/RTL-Verification-4B8BBE?style=flat-square)
![SoC](https://img.shields.io/badge/SoC-System%20Architecture-4B8BBE?style=flat-square)

</div>

The project progressively develops practical understanding of:

* **Digital Logic** — gates, adders, multiplexers, decoders and encoders
* **Combinational RTL** — logic equations, arithmetic units and ALU design
* **Sequential RTL** — flip-flops, counters and shift registers
* **FSM Design** — state machines, controllers and sequence detection
* **Memory Design** — RAM structures and read/write control
* **Communication Protocols** — UART TX/RX and SPI
* **RTL Verification** — testbenches, simulation and waveform analysis
* **Processor Design** — datapath, control logic and RISC-V architecture
* **SoC Concepts** — processor, memory and peripheral integration

---

## 🧪 RTL Verification Workflow

Every design follows a practical hardware-development workflow:

```text
RTL Design
     ↓
Verilog Testbench
     ↓
Icarus Verilog
     ↓
Simulation
     ↓
VCD Waveform
     ↓
GTKWave
     ↓
Functional Verification
```

The purpose is to understand both the **RTL implementation** and the resulting **hardware behavior in simulation**.

For example, Day 01 follows:

```text
and_gate.v
     ↓
and_gate_tb.v
     ↓
iverilog
     ↓
vvp
     ↓
and_gate.vcd
     ↓
GTKWave
```

---

## 🛠️ Tools Used

| Tool               | Purpose                    |
| ------------------ | -------------------------- |
| **Verilog HDL**    | RTL hardware description   |
| **Icarus Verilog** | Compilation and simulation |
| **GTKWave**        | Waveform analysis          |
| **VS Code**        | RTL development            |
| **Git & GitHub**   | Version control            |

Additional tools will be introduced as the project progresses toward processor and VLSI-oriented design.

---

## 📚 Learning Roadmap

```text
Digital Logic
      ↓
Verilog HDL
      ↓
Combinational RTL
      ↓
Sequential RTL
      ↓
FSM Design
      ↓
Memory Design
      ↓
UART / SPI
      ↓
RTL Verification
      ↓
RISC-V Architecture
      ↓
Processor Datapath
      ↓
Pipeline Architecture
      ↓
SoC Integration
      ↓
APB / Peripheral Interfaces
      ↓
ASIC Design Flow
```

---

## 🗂️ Repo Structure

```text
Verilog-to-RISC-V/
│
├── Day01_And_gate/
│   ├── and_gate.v
│   ├── and_gate_tb.v
│   ├── and_gate.vcd
│   └── README.md
│
├── Day02_Adders/
├── Day03_Multiplexers/
├── Day04_Decoder_Encoder/
├── Day05_ALU/
├── Day06_FlipFlops/
├── Day07_Counters/
├── Day08_ShiftRegisters/
├── Day09_FSM/
├── Day10_SequenceDetector/
├── Day11_UART_TX/
├── Day12_UART_RX/
├── Day13_RAM/
├── Day14_SPI/
├── Day15_RISC_V_Capstone/
│
├── LICENSE
└── README.md
```

Each project folder contains the RTL source files, testbench, documentation and relevant simulation material.

---

## 🔬 VLSI Direction

This project is designed to build a foundation for **digital VLSI and RTL engineering**.

The concepts learned through the projects connect to larger hardware-development workflows:

```text
RTL Design
    ↓
Functional Verification
    ↓
Synthesis
    ↓
Gate-Level Netlist
    ↓
Physical Design
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
DRC / LVS
    ↓
GDSII
    ↓
Tapeout
```

The initial focus is on **RTL design, simulation, verification and processor architecture**, while gradually building an understanding of the complete ASIC design flow.

---

## 🏆 Final Goal

The long-term goal of this repository is to progress from basic Verilog modules to understanding and implementing the building blocks of a **RISC-V based digital system**.

The journey focuses on:

**Learn → Design → Simulate → Verify → Integrate → Build**

By completing this roadmap, I aim to develop a strong practical foundation in **RTL design, digital VLSI, processor architecture, verification and SoC development**.

---

## 👨‍💻 Author

<div align="center">

### **Abhishek Mohammad**

**Electronics & Communication Engineering**
**NIT Jalandhar**

</div>

---

<div align="center">

### ⭐ Building digital hardware one RTL module at a time.

</div>
