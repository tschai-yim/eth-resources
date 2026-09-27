## Superscalar Execution & Wide Fetch

- **Superscalar Definition**: Hardware fetching, decoding, executing, and retiring **multiple instructions per cycle** ($N$-wide). Goal: **IPC** $> 1$.
- **Orthogonality**: Independent of OoO execution (e.g., In-Order Superscalar vs. OoO Superscalar).
- **Vertical Dependency Detection**: Hardware must detect dependencies horizontally (across stages) and vertically (within concurrent fetch group). True dependencies force empty slots (**bubbles**).
- **The Wide Fetch Problem**:
    - **Alignment**: Cache lines may lack enough sequential instructions for $N$-wide fetch.
    - **Fetch Breaks**: Branch inside a fetch block halts fetching until subsequent target addresses resolve.
- **Trace Cache**:
    - **Concept**: Dynamically caches **consecutively executed basic blocks (traces)** into physically contiguous internal storage.
    - **Format**: Stores already-decoded instructions (e.g., micro-ops in Pentium 4) across branch boundaries.
    - **Pros**: Massively reduces fetch breaks; completely bypasses complex decoders on cache hits.
    - **Cons**: High hardware complexity ("fill unit"); cache redundancy (same basic block cached multiple times in different trace combinations).
