## What is **Sequential Logic** and how does it handle invalid inputs?

- **Definition**: Logic circuits that remember past inputs.
- **State**: A snapshot of all relevant system elements at a specific moment.
- **Error Handling**: Invalid inputs reset the sequence to a safe baseline (e.g., **Reset State**).

## What are the speed, cost, and characteristics of **Latches & Flip-Flops**?

- **Speed**: Very fast.
- **Cost / Size**: **Very expensive** (tens of transistors per bit).
- **Characteristics**: Allows true parallel access.

## What are the speed, cost, and characteristics of **Static RAM (SRAM)**?

- **Speed**: Fast.
- **Cost / Size**: **Expensive** (\\(6+\\) transistors per bit).
- **Use Cases**: Used primarily for on-chip caches.

## What are the speed, cost, and characteristics of **Dynamic RAM (DRAM)**?

- **Speed**: Slower than SRAM.
- **Cost / Size**: **Cheap** (\\(1\\) transistor + \\(1\\) capacitor per bit).
- **Characteristics**: Requires periodic **refresh** (reading the data destroys the content).

## What are the speed, cost, and characteristics of **Non-volatile storage** (Flash, HDD, Tape)?

- **Speed**: Much slower than RAM.
- **Cost / Size**: **Very cheap**.
- **Characteristics**: **Non-volatile** (retains data without power).

## What are **Cross-Coupled Inverters** and what are their possible states?

- **Definition**: The fundamental bistable circuit.
- **Stable States**: Exactly two valid states (\\(Q=1\\) or \\(Q=0\\)).
- **Metastable State**: An undesirable state where outputs oscillate between \\(0\\) and \\(1\\).
- **Limitation**: Has no built-in control mechanism to explicitly set \\(Q\\).

## How is an **R-S Latch (Reset-Set)** constructed and what does it store?

- **Construction**: Built using two **cross-coupled NAND gates**.
- **Storage**: Stores the data value at \\(Q\\) and its inverse at \\(Q'\\).

## What are the standard operations and control inputs of an **R-S Latch**?

Operates via control inputs **S (Set)** and **R (Reset)**:

- **Quiescent (idle)**: \\(S=1, R=1\\) (holds current state).
- **Set**: Drive \\(S=0\\) (with \\(R=1\\)) \\(\rightarrow Q=1\\).
- **Reset**: Drive \\(R=0\\) (with \\(S=1\\)) \\(\rightarrow Q=0\\).

## What is the **Forbidden State** of an **R-S Latch** and why is it problematic?

Occurs when both inputs are driven low (\\(S=0, R=0\\)).

- Both \\(Q\\) and \\(Q'\\) settle to \\(1\\) (violating the required \\(Q \neq Q'\\) invariant).
- Simultaneously returning inputs to \\(1\\) triggers **metastability** (random oscillation before settling).

## How does a **Gated D Latch** architecture solve the R-S Latch forbidden state?

- **Architecture**: Adds two front-end NAND gates to a standard R-S Latch.
- **Inputs**: Uses a single **Data (D)** input and a **Write Enable (WE)** signal.
- **WE = 1**: Output \\(Q\\) strictly takes the value of \\(D\\).
- **WE = 0**: Latch securely holds its previous value (idle state).

## What is a hardware **Register** and how is it constructed?

- **Definition**: A multi-bit data storage unit (e.g., a \\(4\\)-bit array \\(Q[3:0]\\)).
- **Construction**: Built using multiple parallel **D latches**.
- **Control**: Uses a **single WE signal** to write to all bits simultaneously.

## What do the terms **Address**, **Addressability**, and **Address Space** mean in memory terminology?

- **Address**: The unique index for each memory location.
- **Addressability**: The bit capacity stored per location.
- **Address Space**: The total number of unique memory locations (e.g., \\(4\\) locations require \\(\log_2(4) = 2\\) address bits).

## How are **Rows** and **Columns** structured in a **Memory Array**?

- **Structure**: A grid/matrix layout of storage elements.
- **Rows**: Represent unique addresses. They are activated via specific **Wordlines**.
- **Columns**: Represent the data bits for the selected address. They are routed via **Bitlines**.

## How does a system read data from a **Memory Array**?

- **Address Decoder**: Translates an \\(N\\)-bit address input to activate exactly one **Wordline** (row).
- **Multiplexer (MUX)**: Routes the data bits from the currently active row to the output.

## How does a system write data to a **Memory Array**?

- Combines the **Address Decoder** output with a global **Write Enable (WE)** signal.
- External data (\\(D_i\\)) is written *strictly* to the active row, and only if \\(WE=1\\).
- Unselected rows safely retain their previous values.

## What is a **Memory-Based Lookup Table (LUT)** and how is it mapped?

- **Concept**: A memory array functioning as a combinational logic circuit. A \\(2^N\\)-location, \\(M\\)-bit memory block can replicate *any* \\(N\\)-input, \\(M\\)-output Boolean function.
- **Mapping**:
    - **Address inputs**: Serve as the logic variables (representing truth table rows).
    - **Stored data**: Serve as the pre-calculated logic outputs.
- **Applications**: They are the core building blocks of **FPGAs** (Field Programmable Gate Arrays).

## What are the behavior and trade-offs of **Asynchronous Machines**?

- **Behavior**: State transitions occur immediately upon input changes.
- **Trade-offs**: High performance (no clock overhead) but highly error-prone in complex systems due to parallel **race conditions**.

## What are the behavior and critical timing constraints of **Synchronous Machines**?

- **Behavior**: State transitions occur strictly at fixed, discrete time intervals.
- **Clock**: Synchronizes the system using a signal that alternates between \\(0\\) and \\(1\\).
- **Critical Timing Constraint**: The **combinational logic delay** must be strictly less than the **clock cycle time**.

## What is the **Transparency Problem** in latches?

- Occurs because latches are **level-triggered**.
- While the clock is high (\\(WE = 1\\)), inputs (\\(D\\)) continuously propagate to outputs (\\(Q\\)).
- This captures intermediate logic glitches mid-cycle, violating strict synchronous boundaries and preventing the latch from acting as a safe standalone state register.

## What is the difference between **Level-Triggered** and **Edge-Triggered** storage elements?

- **Level-Triggered (Latches)**: Continually capture data as long as the clock signal is active (high).
- **Edge-Triggered (Flip-Flops)**: Capture data *strictly* at the exact moment of a clock transition (e.g., rising edge).

## How is a **D Flip-Flop** constructed and how does it operate across a clock edge?

An edge-triggered storage element that solves the transparency problem.

- **Construction**: Two series-connected **Gated D Latches** (the first uses an inverted clock, the second uses a normal clock).
- **Clock low (\\(0\\))**: The first latch accepts \\(D\\), while the second latch holds \\(Q\\).
- **Rising edge (\\(0 \rightarrow 1\\))**: The first latch locks the value, and the second latch passes \\(D\\) to \\(Q\\).
