## What is **Superscalar Execution** and what is its primary performance goal?

- **Definition**: Hardware fetching, decoding, executing, and retiring **multiple instructions per cycle** (\\(N\\)-wide).
- **Goal**: Achieve an **Instructions Per Cycle (IPC)** strictly greater than \\(1\\) (\\(\text{IPC} > 1\\)).

## How does **Superscalar Execution** relate to **Out-of-Order (OoO) Execution**?

- It is entirely **orthogonal** (independent).
- A processor can be explicitly designed as **In-Order Superscalar** or **OoO Superscalar**.

## How does **Dependency Detection** function in a **Superscalar** pipeline?

- Hardware must actively detect data dependencies in two dimensions:
    - **Horizontally**: Across different pipeline stages.
    - **Vertically**: Within the same concurrent fetch group.
- **Impact**: True dependencies force empty execution slots, known as **bubbles**.

## What is the **Wide Fetch Problem** in superscalar processors and what are its two main causes?

- **Alignment**: Standard cache lines may lack enough sequential instructions to fill an \\(N\\)-wide fetch block.
- **Fetch Breaks**: A branch inside a fetch block halts the fetching process until subsequent target addresses are fully resolved.

## What is a **Trace Cache** and what format does it use to store instructions?

- **Concept**: Dynamically caches **consecutively executed basic blocks (traces)** into physically contiguous internal storage.
- **Format**: Stores **already-decoded instructions** (e.g., micro-ops in the Pentium 4) that seamlessly span across branch boundaries.

## What are the tradeoffs of implementing a **Trace Cache**?

- **Pros**:
    - Massively reduces **fetch breaks**.
    - Completely bypasses complex decoders on cache hits.
- **Cons**:
    - High hardware complexity (requires a dedicated **fill unit**).
    - **Cache redundancy**: The exact same basic block might be cached multiple times in different trace combinations.
