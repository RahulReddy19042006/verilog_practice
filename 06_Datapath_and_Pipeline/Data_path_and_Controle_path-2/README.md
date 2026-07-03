# Greatest Common Divisor (GCD) Using Datapath and Control Path (Verilog)

## Overview

This project implements the **Greatest Common Divisor (GCD)** algorithm using the **Datapath-Control Path design methodology** in Verilog HDL.

The design follows the subtraction-based Euclidean algorithm and demonstrates how a Finite State Machine (FSM) controller can coordinate operations in a datapath.

The project is useful for understanding:

* Datapath and Control Path separation
* FSM-based controller design

---

## Algorithm

The GCD is computed using repeated subtraction:

```text
Load A
Load B

while (A != B)
{
    if (A > B)
        A = A - B;
    else
        B = B - A;
}

GCD = A
```

Example:

```text
A = 24
B = 18

24 - 18 = 6
18 - 6  = 12
12 - 6  = 6

GCD = 6
```

---

## Datapath Components

The datapath consists of:

### Registers

* Register A
* Register B

### Functional Units

* Two 2:1 Multiplexers for selecting subtractor inputs
* One Subtractor
* One Comparator

### Comparator Outputs

* `lt` → A < B
* `gt` → A > B
* `eq` → A == B

### Control Signals

| Signal | Function                  |
| ------ | ------------------------- |
| ldA    | Load Register A           |
| ldB    | Load Register B           |
| sel1   | Select Subtractor Input X |
| sel2   | Select Subtractor Input Y |
| sel_in | Select Bus Source         |
| done   | GCD Computation Complete  |

---

## Datapath and Control Path

![Datapath and Control Path](datapath and controlpath.png)

## Controller FSM

The controller is implemented as a Moore Finite State Machine.

### States

| State | Description     |
| ----- | --------------- |
| S0    | Idle            |
| S1    | Load A          |
| S2    | Load B          |
| S3    | Compare A and B |
| S4    | A ← A − B       |
| S5    | B ← B − A       |
| S6    | Done            |

---

## Simulation

### Compile

```bash
iverilog -o GCD.vvp testbench.v
```

### Run

```bash
vvp GCD.vvp
```

### View Waveforms

```bash
gtkwave GCD.vcd
```

---

## Sample Test Case

### Input

```text
A = 24
B = 18
```

### Output

```text
GCD = 6
```

---

## Learning Outcomes

This project demonstrates:

* Finite State Machine Design
* Datapath and Control Path Methodology

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Visual Studio Code

---

