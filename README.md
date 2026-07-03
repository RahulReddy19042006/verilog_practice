# Verilog Practice Repository

*A structured collection of Verilog HDL implementations covering fundamental Digital Design and RTL concepts.*

---

## Overview

This repository contains my Verilog HDL practice programs developed while learning **Digital Design**, **RTL Design**, and **Verilog HDL**. It documents my learning journey through the implementation of fundamental digital circuits, finite state machines, memory elements, datapath designs, and pipelined architectures.

Each topic is organized into its own folder and includes the Verilog source code (`.v`) along with a corresponding testbench (`_tb.v`) for simulation and functional verification.

---

## Repository Highlights

- 30+ Verilog design examples
- Parameterized RTL modules
- Individual testbenches for verification
- Combinational and Sequential circuit implementations
- Finite State Machine (FSM) examples
- Memory, Datapath, and Pipeline implementations
- Simulated using Icarus Verilog and GTKWave

---

## Simulation Tools

- **Icarus Verilog** – Compilation and simulation
- **GTKWave** – Waveform visualization

---

## Topics Covered

### 01. Combinational Circuits

- Basic Logic Gates
-   Arithmetic Gates (XOR/XNOR)
- Half Adder
- Full Adder
- Multiplexers
- Hierarchical 16-bit Adder
- Hierarchical 16:1 Multiplexer
- Decoder
- Priority Encoder
- N-bit Comparator
- BCD to 7-Segment Display
- Arithmetic Logic Unit (ALU)

### 02. Sequential Circuits

- SR Latch
- D Flip-Flop
- Shift Register
- Universal Shift Register
- Binary Counter
- Ring Counter
- Up/Down Counter

### 03. Verilog Features

- Signed Numbers
- Net Strength
- Generate Statement
- User Defined Primitives (UDP)

### 04. Memory

- RAM
- Register Bank

### 05. Finite State Machines

- Sequence Detector
- Parity Generator
- Cyclic Lamp Controller

### 06. Datapath and Pipeline

- Datapath and Control Path – GCD Implementation
- Pipeline Implementation Examples

---

## Repository Structure

```text
Verilog-Practice/
│
├── 01_Combinational_Circuits/
├── 02_Sequential_Circuits/
├── 03_Verilog_Features/
├── 04_Memory/
├── 05_Finite_State_Machines/
├── 06_Datapath_and_Pipeline/
│
├── README.md
└── .gitignore
```

---

## Directory Contents

Each design folder typically contains:

- Verilog source code (`.v`)
- Testbench (`_tb.v`)
- README file (for advanced examples)
- Architecture diagrams (where applicable)
- Simulation waveforms (for selected designs)

---

## Objectives

- Practice Verilog HDL through hands-on RTL implementation.
- Strengthen understanding of Digital Logic Design concepts.
- Build a well-organized collection of reusable RTL examples.
- Prepare for VLSI internships, coursework, and RTL design projects.

---

## Simulation

Compile:

```bash
iverilog -o output.vvp design_file.v testbench_file.v
```

Run:

```bash
vvp output.vvp
```

View waveform:

```bash
gtkwave output.vcd
```

---

## Note

This repository is intended for **learning and practicing Verilog HDL and fundamental RTL design concepts**. Therefore, the examples are kept focused on individual concepts and small implementations rather than complete systems.

I plan to create a **separate GitHub repository dedicated to RTL and Digital Design projects**, where I will upload more advanced designs with comprehensive documentation, architecture diagrams, datapath/control-path illustrations, simulation results, and project reports.

---

## Author

**Rahul Reddy**

Electronics and Communication Engineering (ECE)

Interested in **Digital Design**, **RTL Design**, **Verilog/SystemVerilog**, and **VLSI Design**.
