# Day 01 - AND Gate

## Objective

Design and verify a basic 2-input AND gate using Verilog HDL.

## Description

The AND gate is a basic combinational logic circuit with two inputs, `A` and `B`, and one output `Y`.

The output is HIGH only when both inputs are HIGH.

**Logic Equation:**

`Y = A & B`

## RTL Implementation

The hardware is described using Verilog HDL.

### Files

* `and_gate.v` — RTL implementation of the AND gate
* `and_gate_tb.v` — Testbench used for functional verification
* `and_gate.vcd` — Simulation waveform generated during verification

## Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

## Simulation

The design was compiled and simulated using **Icarus Verilog**.

### Compile

```bash
iverilog -o and_gate_sim and_gate.v and_gate_tb.v
```

### Run Simulation

```bash
vvp and_gate_sim
```

### Expected Output

```text
A B | Y
---------
0 0 | 0
0 1 | 0
1 0 | 0
1 1 | 1
```

## Waveform Verification

The testbench generates a VCD waveform file using:

```verilog
$dumpfile("and_gate.vcd");
$dumpvars(0, and_gate_tb);
```

The waveform can be viewed using **GTKWave**:

```bash
gtkwave and_gate.vcd
```

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Learning Outcome

This project introduced the basic RTL design and verification workflow:

**Verilog RTL → Testbench → Simulation → VCD → GTKWave → Verification**

The project demonstrates how a simple digital logic function can be described using RTL, simulated using a testbench, and verified by examining both simulation output and waveforms.
