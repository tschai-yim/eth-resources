## What is the **Memory Hierarchy Principle** and what two types of **locality** does it exploit?

- **Definition**: Combines multiple memory levels to create the illusion of a memory system as fast as the top level and as large as the bottom level.
- **Temporal Locality**: Accessing the exact same memory location repeatedly in a short timeframe (e.g., loop counters).
- **Spatial Locality**: Accessing adjacent memory locations sequentially (e.g., array traversals, sequential instructions).

## What is **Tail Latency** in the context of memory hierarchy?

- **Definition**: Rare, maximum latency spikes that occur despite high average cache hit rates.
- **Impact**: Critical systems must actively account for these spikes to maintain reliability.

## What is the **Recursive Formula** for hierarchical latency analysis and what do its variables represent?

- **Formula**: \\(T\_i = t\_i + m\_i \cdot T\_{i+1}\\)
- **Variables**:
    - \\(T\_i\\): Perceived access time at level \\(i\\).
    - \\(t\_i\\): Intrinsic access time at level \\(i\\).
    - \\(m\_i\\): Miss rate at level \\(i\\).

## How are hit and miss rates calculated for a specific cache level \\(i\\)?

- They are strictly calculated *only* from the memory requests that missed at the preceding level, \\(L\_{i-1}\\).

## Why might a weaker **L1 Cache** demand a highly aggressive **L2 Cache**?

- **Balancing Levels**: A slight drop in L1 hit rate (e.g., \\(99\%\\) down to \\(95\%\\)) pushes significantly more misses down the hierarchy, strictly requiring an aggressive L2 cache to maintain a comparable overall access latency.

## What is the physical structure of a **Cache** and how does it interpret a 64-bit memory address?

- **Structure**: An automatically managed hardware component memoizing frequently or recently accessed blocks.
- **Address Breakdown** (three contiguous fields):
    - **Index**: Row/set location mapping memory blocks via modulo math.
    - **Tag**: Unique identifier resolving modulo collisions (verifies *which* specific block occupies the index).
    - **Byte Offset**: Identifies the exact byte location strictly within the cache block.

## What is the **Direct-Mapped** cache mapping strategy and what is its main vulnerability?

- **Structure**: 1 block \\(\rightarrow\\) 1 set.
- **Capacity**: Only **one** block per modulo equality class can be cached concurrently.
- **Vulnerability**: Highly susceptible to **Conflict Misses** because any two addresses mapping to the same index instantly evict each other.

## What is the **Set-Associative** cache mapping strategy?

- **Structure**: 1 block \\(\rightarrow\\) 1 set, but placed in \\(N\\) different **ways**.
- **Capacity**: Up to **\\(N\\)** blocks per modulo equality class can be cached concurrently.
- **Benefit**: Balances hardware latency with conflict reduction.

## What is the **Fully-Associative** cache mapping strategy and its primary tradeoff?

- **Structure**: 1 block \\(\rightarrow\\) any location.
- **Mechanism**: Strictly uses no **Index** bits.
- **Tradeoff**: Entirely eliminates modulo conflict limits, but requires heavily power-hungry, parallel **Tag** comparators for every single cache slot.

## What is the flexibility regarding the number of ways in **Cache Associativity**?

- There is strictly **no power-of-2 requirement**.
- **Example**: Intel Lion Cove uses 3-way or 12-way caches to explicitly maximize physical die area utilization.

## What are the **Random** and **LRU (Least Recently Used)** cache replacement policies?

- **Random**: Evicts any block. Highly effective against **set thrashing** (where the active working set strictly exceeds the cache associativity).
- **LRU**: Evicts the oldest accessed block, directly exploiting temporal locality.

## Why is exact **LRU (Least Recently Used)** difficult to implement in highly associative caches and how is it approximated?

- **Complexity**: Tracking exact mathematical LRU order requires \\(O(N!)\\) states, which is too complex for fast hardware.
- **Approximations**: Modern processors use simplified hardware approximations like **Not MRU** or **Hierarchical LRU**.

## What is **Belady's OPT** replacement policy and why is it not optimal for execution time?

- **Definition**: A theoretical optimal policy replacing the block needed furthest in the future.
- **Limitation**: It minimizes the overall *miss rate*, but ignores highly variable fetch latencies/costs across different memory tiers, making it sub-optimal for raw *execution time*.

## What are the **Write-Through** and **Write-Back** cache write policies?

- **Write-Through**: Writes immediately to the next memory level. It is highly bandwidth-intensive but drastically simplifies **cache coherence**.
- **Write-Back**: Defers writes until block eviction (flagged via a **Dirty Bit**). Saves massive bandwidth through write combining.

## What are the **Allocate** and **No-Allocate** cache write allocation policies?

- **Allocate**: Brings the target memory block strictly into the cache upon a write miss.
- **No-Allocate**: Writes directly to main memory. Actively saves cache space if the written data lacks spatial or temporal locality.

## Why are **L1 Caches** almost always split while **L2/L3 Caches** are unified?

- **L1 Caches**: Split into independent Instruction and Data caches due to **pipeline constraints** (fetching and execution physically occur at strictly opposite ends of the processor).
- **L2/L3 Caches**: Unified to allow dynamic, highly flexible capacity sharing between instructions and data.

## What is a **Subblocked (Sectored) Cache** and what are its core benefits?

- **Structure**: Divides a standard cache block into smaller internal sectors. Uses strictly \\(1\\) shared **Tag** per block, but tracks separate **Valid/Dirty bits** per subblock.
- **Benefit**: Actively avoids transferring full \\(64\\)-byte blocks for small operations. Permits fetching/writing specific chunks, massively saving bus bandwidth.

## What are the three strict types of **Hierarchy Inclusivity** between caches?

- **Inclusive**: L1 blocks *must* strictly reside in L2. Simplifies coherence but wastes total capacity.
- **Exclusive**: L1 blocks *cannot* reside in L2. Maximizes effective, combined memory capacity.
- **Non-Inclusive**: Imposes no strict rules. Significantly relaxes hardware design constraints.

## What is the **Critical-Word First** cache fetch optimization?

- **Mechanism**: The hardware explicitly pulls the specific requested word from main memory first.
- **Benefit**: The CPU immediately resumes execution using that word while the rest of the cache block naturally fills in the background.

## What two data characteristics does **Cache Compression** exploit to increase effective capacity?

- **Low Dynamic Range**: Extremely small numerical differences between adjacent stored values.
- **Common Patterns**: Sequences of Zero, Repeated, or very Narrow Values.

## What is **Base-Delta-Immediate (BΔI) Compression** in caches and how does it achieve fast decompression?

- **Structure**: Stores a \\(4\\)-byte base plus multiple \\(1\\)-byte deltas. Uses exactly two bases (the first data element and \\(0\\)).
- **Decompression**: Achieves extremely fast decompression via simple hardware **vector addition**. Yields a \\(~2\times\\) capacity increase with minimal hardware overhead.

## What are the four main types of **Cache Misses** (Miss Classification)?

- **Compulsory Miss**: First reference to an address (unfixable natively by caching).
- **Capacity Miss**: Cache is strictly too small for the active working set (fixable via software tiling).
- **Conflict Miss**: Eviction forced by limited modulo associativity (fixable via more ways or hashing).
- **Coherence Miss**: Block externally invalidated by another processor in a multi-core system.

## What are the **Restructuring Access Patterns** and **Blocking / Tiling** software cache optimizations?

- **Restructuring Access Patterns**: Aligning nested loops directly to hardware memory layouts (e.g., **Loop Interchange** for column-major data).
- **Blocking / Tiling**: Dividing massive array loops into distinctly smaller computation chunks that fit completely within the cache/scratchpad to entirely prevent thrashing.

## What is the **Restructuring Data Layout** software cache optimization?

- **Mechanism**: Physically separating **hot** (frequently accessed) and **cold** (rarely accessed) data into entirely different data structures (structs).
- **Example**: Separating linked-list keys from their heavy payload data to prevent active cache pollution.

## How does **Bypassing** function as a memory optimization in modern GPUs?

- Allows direct data copies from the **L2 cache** directly to the local **scratchpad**.
- Completely bypasses the **L1 cache** and **register files** to save massive internal bandwidth.

## What is **Memory Level Parallelism (MLP)**?

- **Definition**: The concurrent generation and servicing of multiple memory accesses at exactly the same time (driven heavily by internal out-of-order execution engines).

## Why does minimizing overall cache miss count not equate to maximizing performance regarding **Memory Level Parallelism (MLP)**?

- Eliminating one **isolated miss** saves significantly more execution time than eliminating one **parallel miss**.
- **Reason**: The stall latency of a parallel miss is naturally hidden behind other concurrently ongoing memory misses.

## What is an **MLP-Aware Cache Replacement** policy?

- A hybrid hardware policy that intentionally retains blocks causing **isolated misses**.
- It intentionally evicts blocks causing **parallel misses**, vastly improving total execution time despite creating a mathematically higher total miss count.

## What is **Off-Chip Prediction** in the context of memory level parallelism?

- **Mechanism**: Hardware predictors (e.g., machine learning perceptrons) explicitly identify long-latency loads early in the pipeline.
- **Action**: Routes these predicted misses directly to main memory, actively overlapping their enormous latency with ongoing processor computations.

## What is the difference between **Private** and **Shared Caches** in multi-core systems?

- **Private Cache**: Dedicated exclusively to exactly one core. Fast, but inherently underutilizes overall system space.
- **Shared Cache**: Used by multiple cores simultaneously. Improves utilization and inter-thread latency, but introduces severe resource contention that actively destroys **performance isolation** (causing unfairness/QoS degradation).

## Why is hardware **Cache Coherence** absolutely necessary in shared-memory multi-core processors?

- **Necessity**: Purely software-based coherence management requires excessive synchronization overhead, which completely destroys system performance.

## What is a **Broadcast-Based (Snoopy Bus)** cache coherence protocol?

- Cores continuously broadcast their data writes/updates over a shared bus.
- Other attached caches snoop this bus to instantly invalidate or update their own local copies.
- **Limitation**: Scales extremely poorly to high core counts due to immense bus traffic.

## What is a **Directory-Based** cache coherence protocol and what is the function of the **Exclusive Bit**?

- **Mechanism**: A central directory strictly tracks cache block locations using \\(P+1\\) bits (\\(P\\) total processors + \\(1\\) **Exclusive bit**).
- **Exclusive Bit**: Indicates that exactly one single cache holds the *only* valid copy of a block. This permits silent data modifications by that core, entirely avoiding slow broadcast traffic across the network.
