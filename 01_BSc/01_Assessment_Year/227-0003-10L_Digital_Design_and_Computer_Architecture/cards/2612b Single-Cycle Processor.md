## What are the two main hardware components of a processor's **Execution Engine**?

- **Datapath**: Hardware that transforms data signals (e.g., **ALUs**, adders, multiplexers, registers).
- **Control Logic**: Hardware that determines the datapath routing and operations for each instruction.

## What is the **Performance Analysis Equation** for microarchitecture execution time, and what do its variables represent?

- **Equation**:
  \\\[Execution\ Time = N \times CPI \times T\\]
- **Variables**:
    - \\(N\\): Number of instructions.
    - \\(CPI\\): **Cycles Per Instruction** (strictly \\(1\\) for single-cycle designs).
    - \\(T\\): **Clock period** (determined by the critical path).

## What is the defining **Execution Paradigm** of a single-cycle datapath?

- All 6 processing phases (**Fetch**, **Decode**, **Evaluate Address**, **Fetch Operands**, **Execute**, **Store Result**) execute entirely within **one clock cycle**.

## What are the three foundational **Hardware Assumptions** for single-cycle datapath models?

- **Ultra-fast state elements**: Memory and register operations finish within one cycle.
- **Combinational read**: Output data is instantly available based on the input address.
- **Synchronous write**: Target locations update exactly on the positive clock edge.

## What are the three primary **State Elements** in a single-cycle datapath?

- **Program Counter (PC)**: A 32-bit register holding the current instruction address.
- **Instruction & Data Memory**: Implemented as completely separate structures to allow simultaneous access in one cycle (resource replication).
- **Register File**: 32-element, 32-bit storage featuring 2 read ports and 1 write port.

## How does the datapath handle source and destination registers for **R-Type ALU Instructions** (e.g., `ADD`)?

- **Register routing**: Reads two source registers (bits `[25:21]` and `[20:16]`) and writes to a destination register (bits `[15:11]`).
- **Operation control**: The ALU uses an **ALU operation** control signal derived directly from the instruction's `funct` field.

## What three key datapath components are utilized for **I-Type ALU Instructions** (e.g., `ADDI`)?

- **Sign Extension Unit**: Converts the 16-bit immediate value to a 32-bit value.
- **ALUSrc Multiplexer**: Selects the second ALU input (chooses between register data and the sign-extended immediate).
- **RegDst Multiplexer**: Switches the write-register destination from `rd` (used in R-Type) to `rt` (used in I-Type, bits `[20:16]`).

## How does the datapath handle a **Load Word (LW)** instruction?

- **Address Computation**: The ALU computes the target memory address.
- **Data Routing**: The **MemtoReg Multiplexer** routes the output from the **Data Memory** directly to the register writeback path (bypassing the ALU result).

## How does the datapath handle a **Store Word (SW)** instruction?

- **Address Computation**: The ALU computes the target memory address.
- **State Update Prevention**: Forces the `RegWrite` control signal to \\(0\\).
- **Simplification**: Because no register write occurs, the `RegDst` multiplexer state becomes a **"don't care"**, simplifying the control logic.

## How does the datapath handle a **Conditional Branch (BEQ)** instruction?

- **Target Calculation**: A dedicated adder computes the branch target as \\(PC+4 + sign\\_extend(immediate) \\times 4\\).
- **Condition Evaluation**: The ALU subtracts the two source registers and asserts the **Zero flag** if they are equal.
- **Routing**: The Control logic toggles the **PCSrc multiplexer** based on the Zero flag.

## What are **Delayed branch semantics** in control flow instructions?

- The architectural requirement to execute the next sequential instruction regardless of the actual branch outcome (necessary for pipelining).

## How does the datapath handle an **Unconditional Jump (J)** instruction?

- The target address is calculated and routed by concatenating:
    - The 4 Most Significant Bits (MSBs) strictly from the incremented **\\(PC + 4\\)**.
    - The 26-bit immediate value.
    - Two trailing zeros (`00`).

## What is the difference between **Hardwired Control** and **Sequential Control** in logic design?

- **Hardwired Control**: Control signals are generated using purely combinational logic (decoders and logic gates) based on opcodes.
- **Sequential Control (Microprogramming)**: Control signals are stored in a memory structure called a **Control Store**. This can create a critical path bottleneck.

## What is the **"Do No Harm" Principle** in control logic design?

- Control signals must actively prevent unintended hardware state changes.
- **Example**: During a `JUMP` instruction, `RegWrite` and `MemWrite` must be strictly set to \\(0\\) to prevent data corruption.

## What dictates the **clock period (\\(T\\))** in a single-cycle datapath, and which instruction typically sets it?

- The clock period is dictated by the **critical path bottleneck** (the delay of the slowest instruction).
- It is typically set by the **Load Word (LW)** instruction because it sequentially uses Instruction Memory, Register File, ALU, Data Memory, and Writeback.

## Why is a single-cycle datapath considered architecturally inefficient regarding instruction execution times?

- **Worst-case optimization**: The static clock period must accommodate the slowest instruction.
- **Wasted time**: Fast instructions (e.g., `JUMP`) finish early but must wait for the full clock cycle to complete, yielding zero global speed benefit.
- **Hardware duplication**: Requires massive resource duplication (e.g., completely separate instruction and data memories) to execute everything in one cycle.
