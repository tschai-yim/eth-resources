## What is the shared general behavior of both **Exceptions** and **Interrupts**?

- They force a program stop to switch to a **handler routine**.
- This process strictly requires **architectural state preservation**.

## What are **Exceptions** in processor architecture and when are they handled?

- **Source**: Internal to the running program (e.g., divide by zero, page fault, undefined opcode).
- **Handling**: Processed immediately upon detection (if non-speculative).

## What are **Interrupts** in processor architecture and when are they handled?

- **Source**: External events (e.g., I/O requests, timers, power failures).
- **Handling**: Processed when convenient (except for critical hardware failures).

## What is a **Precise Exception** and what are its two rules for precise state?

- **Definition**: A strict requirement ensuring a perfectly consistent processor state before exception handling.
- **Two Rules**:
    - All older instructions are completely **retired** (finished and committed).
    - No younger instructions are retired or allowed to modify state.

## What is the purpose of maintaining **Precise Exceptions** in processor architecture?

- Preserves the **Von Neumann sequential execution model**.
- **Crucial for software debugging**: Breakpoints show predictable, sequentially accurate register values.
- Enables seamless recovery, restartable processes, and software-emulated traps.

## How does hardware handle **Precise Exceptions** in a pipelined architecture?

- Out-of-order completion destroys precise state if older instructions throw exceptions.
- Hardware waits until the exception-causing instruction is the **oldest instruction ready to retire**.
- Hardware flushes younger instructions, saves the **Program Counter (PC)** to the **Exception PC (EPC)**, saves the cause, and jumps to the handler.

## What is a **Reorder Buffer (ROB)** and what is its instruction lifecycle?

- **Definition**: A hardware circular queue allowing out-of-order completion but forcing **in-order retirement**.
- **Lifecycle**:
    - **Decode**: Allocate the next sequential **ROB** entry.
    - **Execute**: Complete out-of-order; write the result to the assigned **ROB** entry.
    - **Retire**: Commit the value to the architectural register file once the instruction is the oldest in the **ROB** and exception-free.

## What is **Register Renaming** and what data dependences does it eliminate?

- **Definition**: Mapping architectural register IDs to physical **Reorder Buffer (ROB)** entries via tags/pointers.
- **Effect**: Eliminates **Anti dependence (WAR)** and **Output dependence (WAW)** name dependences.

## How does the register file access the **Reorder Buffer (ROB)** via indirection?

- The register file uses **Tags** instead of slow **Content Addressable Memory (CAM)** for **ROB** searches.
- Invalid registers point directly to specific producing **ROB** entry IDs (enables fast, direct access).

## How does a **History Buffer (HB)** operate as an alternative state recovery mechanism?

- **Optimistic execution**: Updates the architectural register file immediately upon completion.
- Logs *old* register values in the **HB**.
- Unwinds the **HB** tail-to-head on an exception to restore precise state (increases recovery latency).

## How does the **Future File (FF) + ROB** mechanism manage processor state recovery?

- Maintains two separate register files:
    - **Future File**: Speculative, updated as soon as possible.
    - **Architectural File**: Updated strictly in-order via the **Reorder Buffer (ROB)**.
- The **Architectural File** overwrites the **Future File** upon an exception.

## What is **Checkpointing** in processor state recovery?

- **Definition**: Taking full snapshots of the frontend register state at critical points (e.g., branches).
- **Advantage**: Enables extremely fast branch misprediction recovery by immediately restoring the checkpoint.
