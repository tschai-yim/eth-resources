## What is **Loop Unrolling** and what are its advantages and disadvantages?

- **Definition**: Replicating a loop body multiple times per iteration.
- **Purpose**: Eliminates branch instructions (prevents stalls in **DAE**, **VLIW**, and **Systolic Arrays**).
- **Advantages**:
    - Reduces maintenance overhead (fewer index increments and condition tests).
    - Enlarges **basic blocks**, enabling better compiler scheduling.
- **Disadvantages**:
    - Requires additional edge-case handling for odd iteration counts.
    - Increases total code size.

## What is **Automatic Code Vectorization** and what is its primary limitation?

- **Definition**: A compile-time operation that reorders standard code into vector instructions (requires extensive loop dependence analysis).
- **Limitation**: Code that is fundamentally hard for a human programmer to vectorize is equally hard for the compiler to vectorize.

## What are the four categories of **Flynn's Taxonomy (1966)** for processor execution paradigms?

Categorizes systems by their instruction and data streams:

- **SISD**: Standard scalar processors.
- **SIMD**: **Array processors** and **Vector processors**.
- **MISD**: Rare architectures (e.g., **Systolic Arrays**, streaming processors).
- **MIMD**: Multiprocessors and multithreaded processors.

## How do **Data Parallelism**, **Data Flow**, and **Thread Parallelism** differ?

- **Data Parallelism**: The same operation is concurrently applied to different data (e.g., calculating dot products).
- **Data Flow**: Operations are parallelized based strictly on data readiness.
- **Thread Parallelism**: Control threads are parallelized.

## What is the **Time-Space Duality** in the **SIMD** processing paradigm?

- **Array Processor (Space)**: Multiple data elements are processed at the **same time** across **different spaces** (distinct **Processing Elements / PEs**).
- **Vector Processor (Time)**: Multiple data elements are processed in **consecutive time steps** using the **same space** (deeply pipelined units).
- *Note*: Modern **SIMD** architectures (like GPUs) combine both time (pipelining) and space (lanes).

## How do **SIMD Arrays** and **VLIW** architectures differ in their operation packing?

- **VLIW**: Packs multiple *independent, different* operations into a single instruction bundle.
- **SIMD Array**: Packs multiple *identical* operations, which efficiently amortizes fetch and decode overhead.

## What are the primary **Registers** used in **Vector Processors**?

- **Vector Registers**: Hold \\(N\\) \\(M\\)-bit values (operates as a 1D array, not a single scalar).
- **Vector Length Register (VLEN)**: Tracks the active element count (up to a maximum of \\(N\\)).
- **Vector Mask Register (VMASK)**: Stores a bitmask used for conditional execution.
- **Vector Stride Register (VSTR)**: Defines the memory distance between consecutive elements.

## How is **Stride Calculation** handled for 2D matrices in **Vector Processors**?

- Matrices are stored in linear **row-major order** in memory.
- **Fetching a Row**: Accesses strictly consecutive addresses \\(\rightarrow\\) **Stride = 1**.
- **Fetching a Column**: Skips addresses based on the row width (e.g., jumping 10 addresses for a 10-column matrix) \\(\rightarrow\\) **Stride = 10**.

## What are the main hardware advantages of **Vector Processors**?

- **Deep Pipelines**: Guaranteed no intra-vector dependencies enables 20+ stage pipelines with zero interlocking or branch flushing.
- **Energy Efficiency**: One fetched/decoded instruction yields many mathematical operations.
- **Perfect Predictability**: Known strides enable perfectly predictable memory prefetching.
- **Native Loop Handling**: Eliminates software branches entirely.

## What are the main limitations and disadvantages of **Vector Processors**?

- Strictly requires **regular parallelism** to function efficiently.
- **Programming Difficulty**: Data must rigidly map to the hardware topology (though modern GPUs abstract this away).
- **Irregular Parallelism**: Yields terrible performance on tasks like **pointer chasing** or traversing linked lists.

## What is **Memory Banking** and what is **Interleaving**?

- **Memory Banking**: Dividing a single memory into independent sub-arrays (**banks**) that process requests concurrently. Cost-efficiently simulates multi-port memory by sharing global buses.
- **Interleaving**: Mapping consecutive memory addresses to different, consecutive banks (e.g., Address \\(0 \rightarrow\\) Bank \\(0\\), Address \\(1 \rightarrow\\) Bank \\(1\\)).

## What three conditions are required to sustain optimal memory throughput (\\(1\\) element/cycle) in a vector processor?

1. **Stride = 1**: Accessing strictly sequential addresses.
2. **Interleaved Layout**: Ensures sequential addresses hit idle banks, avoiding wait times.
3. **Bank Count Limit**: \\(\text{Number of banks} \ge \text{Bank access latency}\\) (measured in cycles).

## What are **Bank Conflicts** and how can they be minimized?

- **Definition**: Occurs when multiple simultaneous memory requests target the exact same busy memory bank (e.g., memory strides exactly matching multiples of the total bank count).
- **Minimization Strategies**:
    - Hardware: Adding more banks/ports or using randomized address mapping.
    - Software: Optimizing shared (**scratchpad**) memory layouts (extensively used by GPU programmers).

## What is **Vector Chaining** in advanced vector processors?

- **Definition**: Hardware **data forwarding** applied directly across distinct functional units.
- **Advantage**: Bypasses waiting for an entire vector register to finish computing, resulting in massive speedups for dependent vector operations.

## What is **Vector Stripmining**?

- **Definition**: A compiler technique used when data arrays exceed the physical capacity of the **Vector Registers (VREGs)**.
- **Mechanism**: Splits execution into smaller vector loops (e.g., 527 elements inside 64-element VREGs \\(\rightarrow\\) 8 loops executed at \\(\text{VLEN} = 64\\) and 1 loop executed at \\(\text{VLEN} = 15\\)).

## How do **Gather / Scatter Operations** function in vector processors?

- **Purpose**: Handles **indirect memory accesses** and enables efficient work on **sparse matrices**.
- **Mechanism**: Executes loads (gather) and stores (scatter) using an **index vector** added to a base register (e.g., \\(A[i] = B[i] + C[D[i]]\\)).

## What are **Masked Operations (Predicated Execution)** in vector processing and what are their two implementations?

- **Purpose**: Replaces conditional logic (`if-else`) inside loops. Control dependences are dynamically converted into data dependences via the **Vector Mask Register (VMASK)**.
- **Simple Implementation**: Executes all operations but physically disables register writeback for masked bits (optimal when elements are mostly \\(1\\)s).
- **Density-Time Implementation**: Hardware physically skips the execution of \\(0\\)s (optimal when elements are mostly \\(0\\)s).
