## What is **Pipelining** in computer architecture?

- **Definition**: An execution paradigm overlapping multiple instructions to increase overall system **throughput**.

## What concepts does the **Laundry Analogy** illustrate regarding pipelining?

- Steps are sequentially dependent per load (e.g., wash \\(\rightarrow\\) dry \\(\rightarrow\\) fold).
- There is **no dependence** between *independent* loads.
- Enables simultaneous use of different resources.
- **Throughput limit**: The slowest step strictly determines the maximum pipeline throughput.

## What are the three **Ideal Pipeline Requirements**?

- Repetition of **identical operations**.
- Repetition of **independent operations**.
- **Uniformly partitionable suboperations** (equal latency per stage).

## What is the **Throughput and Cost Mathematics** for single-cycle and \\(k\\)-stage pipelines?

- **Single-cycle throughput**: \\(1 / (T + S)\\) (where \\(T\\) = combinational delay, \\(S\\) = sequencing/register overhead).
- **\\(k\\)-stage pipeline throughput**: \\(1 / (T/k + S)\\).
- **Maximum theoretical throughput**: Limited strictly by \\(S\\) (diminishing returns for infinite stages).
- **Cost**: Scales with pipeline registers: \\(\text{Cost} = G + Rk\\) (where \\(G\\) = gates, \\(R\\) = register cost).

## What are the five stages of the **MIPS Pipeline** and why is its speedup sub-5x?

- **5 Stages**:
    - **Fetch (IF)**: Retrieves the next instruction from memory using the **Program Counter**.
    - **Decode (ID)**: Identifies the operation and reads source operands from the **Register File**.
    - **Execute (EX)**: Performs arithmetic/logic operations or calculates memory addresses via the **ALU**.
    - **Memory (MEM)**: Performs data memory accesses for **Load** or **Store** instructions.
    - **Writeback (WB)**: Commits the final result back into the **Register File**.
- **Sub-5x speedup**: Caused by uneven stage latencies and pipeline overhead.

## What is the purpose of **Pipeline Registers** and what is their crucial requirement?

- **Purpose**: Act as buffers (e.g., `IF/ID`, `ID/EX`) between stages to prevent younger instructions from overwriting older data.
- **Crucial requirement**: Data needed later (e.g., the `WriteReg` address) must explicitly propagate down through the pipeline registers.

## What are the two options for **Control Signal Propagation** in a pipeline?

- **Option 1 (Typical)**: Decode once in the **Decode (`ID`)** stage and propagate the control signals down the pipeline.
- **Option 2**: Propagate the raw instruction word and decode it locally per stage.

## What is the difference between **External** and **Internal Fragmentation** in pipelines?

- **External fragmentation**: Idle pipeline stages caused by instructions needing different or fewer stages.
- **Internal fragmentation**: Fast stages wasting time by waiting for the worst-case clock cycle time to finish.

## What is a **Structural Hazard (Resource Contention)** and what are its two main solutions?

- **Definition**: The simultaneous demand for the exact same hardware resource by multiple pipeline stages.
- **Solution 1**: Duplicate resources (e.g., using separate Instruction and Data caches).
- **Solution 2**: Stall one contending stage.

## How is the **Register File** designed to avoid structural hazards in a pipeline?

- It is designed to perform **writes** in the first half of the clock cycle and **reads** in the second half.

## What are the three types of **Data Dependences** in pipelining?

- **Flow dependence (RAW - Read-After-Write)**: A **true data dependence** where the consumer strictly needs the producer's value.
- **Anti dependence (WAR - Write-After-Read)**: A **name dependence** existing only due to limited architectural registers (not a true data link).
- **Output dependence (WAW - Write-After-Write)**: Another **name dependence** existing due to limited architectural registers.

## What is **Interlocking (Stalling)** in a pipeline and how is it implemented?

- **Definition**: Hardware-based dependence detection that pauses the pipeline until data is ready.
- **Implementation**:
    - Disables **Program Counter (PC)** and `IF/ID` register updates.
    - Inserts invalid instructions (**bubbles** or **nops**) downstream via `CLR` or `INV` signals.

## What does the acronym **MIPS** originally stand for regarding pipeline interlocking?

- **Microarchitecture without Interlocked Pipeline Stages** (because the architecture originally relied purely on compiler scheduling instead of hardware interlocking).

## What is **Data Forwarding (Bypassing)** and what are its standard routing paths?

- **Definition**: Resolves flow dependences without stalling by routing data from later stages to earlier ones.
- **Routing Paths**: Routes data from `ALUOut` (end of **Execute (`EX`)**) or the **Memory (`MEM`)** output directly back to the **ALU** inputs.

## What is the **Priority Rule** for data forwarding when multiple stages match?

- The **Memory (`MEM`)** stage has priority over the **Writeback (`WB`)** stage for matching registers because it holds the *most recent* definition of the data.

## What is a **Load-Use Stall** and why is it necessary despite data forwarding?

- **Limitation**: Cannot forward data immediately after a **Load (`lw`)** instruction.
- **Reason**: The data is unavailable until the end of the **Memory (`MEM`)** stage. Forwarding it to the start of the **Execute (`EX`)** stage breaks the **critical path**, strictly requiring a 1-cycle stall.

## What is **Branch Prediction** and what is the **Branch Misprediction Penalty**?

- **Branch Prediction**: The processor guesses the next **Program Counter (PC)** before the branch outcome is resolved.
- **Branch Misprediction Penalty**: The hardware must **flush** (invalidate) incorrectly fetched instructions upon a wrong prediction.

## What is **Early Branch Resolution** and what are its pros and cons?

- **Definition**: Moves target calculation and condition evaluation to the **Decode (`ID`)** stage.
- **Pros**: Reduces the flush penalty to 1 cycle and lowers **CPI (Cycles Per Instruction)**.
- **Cons**: Adds hardware/forwarding complexity, can lengthen the **critical path**, and hurts overall clock frequency.

## What is **Fine-Grained Multithreading (FGMT)**?

- **Definition**: An advanced pipeline execution concept that fetches an instruction from a completely different, independent thread every cycle.

## What are the pros, cons, and examples of **Fine-Grained Multithreading (FGMT)**?

- **Pros**: Masks control and data dependences (no forwarding, stalling, or prediction needed) and yields high system throughput.
- **Cons**: Drastically reduces single-thread performance and requires massive register duplication per thread.
- **Examples**: Modern **GPUs** (NVIDIA Warps hiding memory latencies) and the CDC 6600.
