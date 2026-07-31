# ⚡ Verilog-to-RISC-V

A hands-on RTL and digital design challenge — from basic logic gates to a 5-stage pipelined RISC-V processor and SoC concepts.

**Verilog RTL Progress** · **Icarus Verilog** · **GTKWave** · **Yosys**

## 📌 About This Repo

This repository documents my hands-on journey of learning digital hardware design and RTL development using Verilog HDL, progressing from basic combinational logic to processor architecture and RISC-V based SoC design.

Each project focuses on one practical digital design concept. The goal is not just to write Verilog code, but to understand how RTL describes hardware, how designs are simulated and verified, and how individual modules are eventually integrated into larger digital systems.

The journey progresses from fundamental digital logic through sequential circuits, FSMs, memories and communication protocols, and finally toward RISC-V processor design, pipelining, verification and SoC architecture.

Every design is implemented, simulated and verified as part of the learning process.

## 🚀 Progress Tracker

| Day | Project             | Core Skills Covered                                     | Status |
| --- | ------------------- | ------------------------------------------------------- | ------ |
| 01  | AND Gate            | Basic RTL, Continuous Assignment, Testbench, Simulation | ✅      |
| 02  | Adders              | Half Adder, Full Adder, Combinational RTL               | ⬜      |
| 03  | Multiplexers        | 2:1 & 4:1 MUX, Selection Logic                          | ⬜      |
| 04  | Decoder & Encoder   | Combinational Logic, Encoders, Decoders                 | ⬜      |
| 05  | 4-bit ALU           | Arithmetic & Logic Operations, Control Signals          | ⬜      |
| 06  | Flip-Flops          | D, SR, JK & T Flip-Flops, Sequential Logic              | ⬜      |
| 07  | Counters            | Up, Down & Mod-10 Counters                              | ⬜      |
| 08  | Shift Registers     | SISO, SIPO, PISO & PIPO                                 | ⬜      |
| 09  | FSM                 | Traffic Light Controller, State Machines                | ⬜      |
| 10  | Register File       | 32×32-bit Registers, Read/Write Ports, x0               | ⬜      |
| 11  | RISC-V Basics       | ISA, RV32I, Instructions, Datapath                      | ⬜      |
| 12  | Single-Cycle RISC-V | PC, Decoder, ALU, Memory, Write Back                    | ⬜      |
| 13  | 5-Stage RISC-V      | IF, ID, EX, MEM, WB, Pipeline Registers                 | ⬜      |
| 14  | Pipeline Hazards    | RAW Hazards, Forwarding, Stalling, Flushing             | ⬜      |
| 15  | RISC-V SoC          | CPU, Memory, Peripherals, APB & Integration             | ⬜      |

**Legend:** ✅ Complete · 🔄 In Progress · ⬜ Planned

## 🎯 Skills I'm Building

**Digital Logic** · **Verilog HDL** · **RTL Design** · **Sequential Logic** · **FSMs** · **Memory Design** · **UART** · **SPI** · **RISC-V** · **Processor Architecture** · **Pipelining** · **Verification** · **SoC Design** · **APB** · **ASIC Flow**

By the end of this journey, the project will cover the fundamental RTL concepts required to progress toward digital VLSI and processor design.

### Foundational Digital Design

Logic gates, multiplexers, decoders, encoders, adders, ALUs, flip-flops, registers and counters.

### Sequential & Control Logic

Finite State Machines, traffic-light controllers, sequence/control logic and synchronous digital systems.

### Memory & Communication

Register files, RAM, UART transmission/reception and SPI communication concepts.

### Processor Architecture

RISC-V ISA, instruction formats, datapath design, control logic, register files, instruction memory and data memory.

### Pipelined Processor Design

5-stage pipeline architecture:

`IF → ID → EX → MEM → WB`

Pipeline registers, data hazards, RAW hazards, forwarding, stalls and control hazards.

### SoC & VLSI Concepts

CPU and peripheral integration, memory-mapped I/O, APB communication and the basic RTL-to-ASIC design flow.

## 🧪 Verification Workflow

Each RTL module is tested using a dedicated Verilog testbench.

The basic workflow is:

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

The objective is to understand not only whether the code works, but why the generated hardware behaves as observed in simulation.

## 🛠️ Tools Used

* **Verilog HDL** — RTL hardware description
* **Icarus Verilog** — Compilation and simulation
* **GTKWave** — Waveform analysis
* **Yosys** — RTL synthesis
* **VS Code** — Development environment
* **Git & GitHub** — Version control

## 🗂️ Repository Structure

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
├── Day10_Register_File/
├── Day11_RISC_V_Basics/
├── Day12_Single_Cycle_RISC_V/
├── Day13_5_Stage_RISC_V/
├── Day14_Pipeline_Hazards/
├── Day15_RISC_V_SoC/
│
├── .gitignore
└── README.md
```

Each project folder contains the relevant RTL source files, testbench, documentation and simulation-related material where appropriate.

## 📚 Learning Roadmap

```text
Digital Logic
      ↓
Verilog HDL
      ↓
RTL Design
      ↓
Combinational Logic
      ↓
Sequential Logic
      ↓
FSM & Memory
      ↓
Communication Protocols
      ↓
RISC-V ISA
      ↓
Single-Cycle Processor
      ↓
5-Stage Pipeline
      ↓
Hazard Handling
      ↓
Verification
      ↓
SoC Architecture
      ↓
APB Peripherals
      ↓
ASIC Design Flow
```

## 🔬 VLSI Direction

The long-term objective of this repository is to build a foundation for practical digital VLSI work.

The concepts explored here connect to a typical ASIC development flow:

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

The repository will focus primarily on RTL design, verification and processor architecture while building conceptual understanding of the later ASIC stages.

## 🏆 Final Goal

The final objective is to progress from writing simple Verilog modules to understanding and implementing the fundamental architecture of a RISC-V based digital system.

The project emphasizes:

**Learn → Design → Simulate → Verify → Integrate → Understand**

This repository is a practical record of that journey.

## 👨‍💻 Author

**Abhishek Mohammad**

Electronics & Communication Engineering

NIT Jalandhar

---

⭐ This repository is a continuous learning project. More modules, processor components and SoC concepts will be added as the journey progresses.
