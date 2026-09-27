## What is the fundamental function of **transistors** in modern computers?

- They are the fundamental building blocks of modern computers.
- Act as simple **logical switches** (abstracts away complex analog physics).

## What does **MOS** stand for in MOS transistors?

- **Metal-Oxide Semiconductor**

## What are the characteristics and behaviors of an **N-type MOS Transistor**?

- **Gate = High Voltage (3V)**: **Circuit Closed** (Conducts/ON).
- **Gate = Low Voltage (0V)**: **Circuit Open** (OFF).
- Passes 0s well (**pulling down**); passes 1s poorly.

## What are the characteristics and behaviors of a **P-type MOS Transistor**?

- **Gate = Low Voltage (0V)**: **Circuit Closed** (Conducts/ON).
- **Gate = High Voltage (3V)**: **Circuit Open** (OFF).
- Passes 1s well (**pulling up**); passes 0s poorly.

## What is **CMOS (Complementary MOS)** and what are its two networks?

A technology combining N-type and P-type transistors:

- **Pull-up network (PMOS)**: Connects output to power (3V).
- **Pull-down network (NMOS)**: Connects output to ground (0V).

## How do parallel and series connections map to logic in **CMOS Gate Rules**?

- **Parallel connection**: Represents **OR logic** (only one needs to be ON).
- **Series connection**: Represents **AND logic** (all must be ON).

## What causes a **Short Circuit** in a **CMOS** gate and what is the result?

- Occurs when both the pull-up and pull-down networks are **ON simultaneously**.
- Burns power and damages the circuit.
- *Rule:* Exactly one network must be ON at any time.

## How are electrical voltages mapped to logic values in the **Digital Abstraction**?

- **0V (Ground)**: Mapped to Logical **0** (False).
- **3V (Power)**: Mapped to Logical **1** (True).

## What is a **Floating Output (Z)** in a logic circuit?

- Output is undefined or disconnected (open circuit).
- Occurs when both CMOS networks are **OFF**.

## What are the functions of the **Basic Logic Gates**?

- **Buffer**: Passes input unchanged.
- **NOT (Inverter)**: Inverts input.
- **AND / NAND**: Output 1 if all inputs 1 / Output 0 if all inputs 1.
- **OR / NOR**: Output 1 if any input 1 / Output 0 if any input 1.
- **XOR / XNOR**: Output 1 if inputs differ / Output 1 if inputs match.

## How is a **NOT Gate (Inverter)** implemented in **CMOS**?

- One **P-type** on top (pulls up to 1).
- One **N-type** on bottom (pulls down to 0).

## How is a **NAND Gate** implemented in **CMOS**?

- Two P-types in **parallel** (top).
- Two N-types in **series** (bottom).

## Why is an **AND Gate** less efficient to build in **CMOS** than a NAND gate?

- CMOS is inherently **inverting logic**.
- An AND Gate must be built via a **NAND Gate + Inverter**.
- This makes AND gates larger (6 transistors) compared to NAND gates (4 transistors).

## What is a **Tri-State Buffer** and how does its **Enable (E)** signal work?

A gateable switch preventing short circuits on shared wires.

- \\(E = 1 \rightarrow\\) Output = **Data**.
- \\(E = 0 \rightarrow\\) Output = **Floating signal (Z)**.

## What is a **Shared Bus** and how its access controlled?

- A shared bus is a common communication wire connecting subsystems (e.g., CPU and Memory).
- **Tri-state buffers** dictate access to ensure **at most one component is enabled** at any given time.

## How does the type of connection (**series vs. parallel**) affect circuit **latency**?

- **Series connections** are slower than **parallel connections**.
- This is due to increased resistance over an effectively longer wire.

## What is **Dynamic Power**?

- Energy required to charge capacitance during signal flips (\\(0 \leftrightarrow 1\\)).
- Formula: \\(P \propto C \cdot V^2 \cdot f\\).

## How does **Voltage (V)** impact power consumption and performance in a circuit?

- Voltage has a cubic/quadratic impact on dynamic power (\\(P \propto C \cdot V^2 \cdot f\\)).
- Lowering voltage saves massive power but reduces performance.

## What is **Static Power** in a logic circuit?

- Power consumed without signal changes.
- Caused by **leakage current**.
- Dominant in scaled-down chips.

## What is the difference between **Energy** and **TDP (Thermal Design Power)**?

- **Energy**: Power integrated over time (dictates **battery life**).
- **TDP**: Maximum expected heat dissipation (dictates **cooling requirements**).

## What is **Moore's Law** and how is it sustained today?

- **Definition**: The component count on an integrated circuit doubles approximately every two years (driving down manufacturing costs).
- **Sustained by**: New materials (Copper, Hafnium Oxide) and **Extreme Ultraviolet (EUV)** lithography.
