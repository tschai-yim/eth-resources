## What is a **Dispatch Stall** in an in-order execution pipeline and why is it difficult to solve with software?

- **Definition**: A pipeline stall where a non-ready instruction blocks the dispatch of all younger, potentially independent instructions.
- **Difficulty**: Usually caused by memory loads (`LD`), which have **variable latency** (e.g., \\(4\\) cycles for a cache hit vs. \\(100+\\) cycles for a cache miss). Purely software-based scheduling cannot predict these runtime delays.

## What are three alternative solutions to **Out-of-Order Execution** for handling pipeline stalls, and what are their single-thread flaws?

- **Compile-time scheduling**: Hard to optimize without knowing runtime behaviors (like cache misses).
- **Value prediction**: Hardware guesses the outcome of a stalled instruction. Incurs an extremely high performance penalty if the prediction is wrong.
- **Fine-grained multithreading**: Fetches from a different thread every cycle. Maximizes overall system throughput but destroys single-thread performance.

## What is **Out-of-Order (OoO) Execution**?

- **Definition**: A **dynamic scheduling** paradigm where instructions fire strictly based on data availability, regardless of original program order.
- **Execution Model**:
    - Externally maintains the programmer illusion of a sequential **Von Neumann model**.
    - Internally executes as a parallel **Dataflow machine**.

## What is the difference between **ISA-Level Dataflow** and **Microarchitecture-Level Dataflow**?

- **ISA-Level Dataflow**: Forces software into explicit dataflow graphs. Perfectly exposes parallelism but creates a massive programmer barrier and makes **precise state semantics** highly difficult.
- **Microarchitecture-Level Dataflow**: Hardware dynamically translates standard sequential ISA code into internal dataflow logic (this is modern **Out-of-Order Execution**).

## What are the primary benefits and tradeoffs of **Out-of-Order Execution**?

- **Benefits**:
    - **Latency tolerance**: Hides multi-cycle delays by executing independent operations concurrently (limited by the **Instruction Window Size**).
    - **Irregular parallelism**: Exploits dynamic parallel operations that static compilers miss.
- **Tradeoffs**: Requires highly complex hardware, increases power consumption, and risks lengthening the critical path (slower clock cycle).

## What are the three core hardware components of **Tomasulo's Algorithm**?

- **Register Alias Table (RAT)**: Maps architectural registers to temporary microarchitectural tags/locations.
- **Reservation Stations (RS)**: Buffers that hold stalled operations, their missing operand tags, and any ready values.
- **Common Data Bus (CDB)**: Broadcasts completed values and their unique tags back to the entire machine.

## What are the four core operations of **Tomasulo's Algorithm**?

1. **Link**: Maps consumers to producers using **Register Renaming**.
2. **Buffer**: Moves stalled instructions into **Reservation Stations (RS)**.
3. **Track Readiness**: Listens to the bus for required source operand tags.
4. **Dispatch**: Wakes up and sends the instruction to the execution unit once all operands are ready.

## How does **Double Renaming** function in **Tomasulo's Algorithm**?

- **Purpose**: Eliminates false **Anti (WAR)** and **Output (WAW)** dependencies.
- **Mechanism**: If an architectural register is overwritten multiple times, the **Register Alias Table (RAT)** updates to point *only* to the newest producing tag.
- Older dependent instructions safely retain the older tags in their **Reservation Stations**, ensuring they receive the correct historical data.

## What occurs during the **Tag Broadcast & Wake-up** phase of **Tomasulo's Algorithm**?

- **Action**: Execution units broadcast the computed value and its unique tag on the **Common Data Bus (CDB)**.
- **Wake-up**: All **Reservation Stations** and **RAT** entries simultaneously compare this tag to their missing operands.
- **Cost**: It is the most power-hungry phase and typically dictates the critical path of the processor.

## How does a modern **Out-of-Order** pipeline structure support **Precise Exceptions**?

- **Frontend Engine**: Handles speculative, out-of-order execution (utilizing **Reservation Stations**).
- **Backend Engine**: Handles strictly in-order retirement (utilizing a **Reorder Buffer (ROB)**).
- **Context**: Original implementations of Tomasulo's algorithm lacked precise exceptions, severely hindering debugging.

## What are the two register maps used in modern **Out-of-Order** pipelines?

- **Frontend Register Map (Speculative)**: Updated immediately when an execution completes. Used to rename newly fetched instructions.
- **Architectural Register Map (Precise)**: Updated strictly in-order only as instructions safely retire from the **Reorder Buffer (ROB)**.

## How does hardware handle **Exceptions** in a modern **Out-of-Order** pipeline?

- The hardware **flushes** the speculative pipeline.
- It perfectly restores precise state by copying the strictly in-order **Architectural Register Map** directly over the corrupted **Frontend Register Map**.

## What is the **Value Replication Problem** in naive **Out-of-Order** implementations?

- **Problem**: Naive designs physically copy full data values (e.g., \\(64\\)-bit integers) into the RAT, Reservation Stations, and ROB simultaneously.
- **Impact**: Wastes massive amounts of silicon area and power.

## How does a **Centralized Physical Register File (PRF)** solve the value replication problem?

- Values are stored exactly once in a single, massive **PRF**.
- **Pointer Usage**: Speculative maps, architectural maps, and **Reservation Stations** only store small pointers (e.g., \\(12\\) bits) referencing the PRF.
- Instructions read actual data directly from the PRF just before entering the execution unit.

## What are the rules for allocating and freeing registers in a **Physical Register File (PRF)**?

- **Allocation**: Dynamically pulled from a **Free List** during the decode stage.
- **Reclamation (Freeing)**:
    - Safely freed only when the *next* instruction writing to the *same* architectural register safely retires.
    - Immediately freed if it was allocated speculatively on a mispredicted branch (pipeline flush).

## Why is tracking data dependencies harder for **Memory** than for **Registers** in **Out-of-Order Execution**?

- **Registers**: Dependencies are static, known immediately at decode, and mapped to a small, private space.
- **Memory**: Addresses are dynamic, unknown until partial execution is finished, map to a massive address space, and are shared across multiple threads.

## What is **Memory Disambiguation** (the Unknown Address Problem)?

- **Definition**: The conflict that arises when a younger memory Load (`LD`) computes its address before an older memory Store (`ST`) computes its address.
- **Problem**: The hardware does not immediately know if the Load and Store target the exact same memory address (creating a dependency).

## What are the three scheduling approaches for handling memory loads with unknown store addresses?

- **Conservative**: Stall the Load until all older Store addresses are fully computed (destroys performance).
- **Aggressive**: Assume the Load is independent and execute it immediately (requires pipeline flushes if an overlap is later discovered).
- **Predictive**: Hardware uses historical tracking (e.g., **Store Sets**) to predict dependencies. If historically dependent, it waits; if not, it fires aggressively.

## What is **Store-to-Load Forwarding** and what hardware queues facilitate it?

- **Definition**: The process where a younger Load (`LD`) receives the exact data written by the most recent older Store (`ST`) to the same address, bypassing slow main memory.
- **Hardware Queues**: Utilizes a **Load Queue (LQ)** and a **Store Queue (SQ)** to buffer memory instructions.
    - `LD`s search the SQ to catch pending data.
    - `ST`s search the LQ to catch overly aggressive `LD`s that fetched wrong data.

## Why is searching the **Store Queue (SQ)** highly complex and difficult to scale?

- **CAM Search**: Requires a massive **Content Addressable Memory (CAM)** search.
- **Matching Criteria**: Must match based on **Address**, **Size** (e.g., a \\(4\\)-byte load overlapping multiple \\(1\\)-byte stores), and **Age** (must pick the *youngest older* store).
- **Data Stitching**: May require stitching partial data together from the SQ and the cache.
- **Result**: Severely limits SQ size (e.g., to \\(24\\) entries) due to hardware constraints.
