## What is the difference between a **Programming Model** and an **Execution Model**?

- **Programming Model**: Defines how a software developer writes code logically.
- **Execution Model**: Defines how physical hardware dynamically executes that code under the hood.

## How do **Sequential Code** and **Data Parallel Code** fundamentally differ in hardware execution?

- **Sequential Code**: Written linearly; relies on dynamic parallelization by **Out-of-Order (OoO)** CPUs.
- **Data Parallel Code**: Explicitly vectorized by compilers to run on traditional **SIMD** (Single Instruction, Multiple Data) hardware.

## What is the **SPMD (Single Program Multiple Data)** programming model?

- A model where the developer writes simple, scalar code targeted for a *single* thread.
- The system spawns millions of independent instances of this thread.
- The underlying hardware entirely abstracts the parallelization process.

## What is the **SIMT (Single Instruction, Multiple Thread)** execution model?

- An execution model that strictly maps the software-level **SPMD** programming model onto a hardware-level **SIMD** backend.

## What is a **Warp** (NVIDIA) or **Wavefront** (AMD) in GPU microarchitecture?

- A **logical grouping** of independent threads (e.g., \\(32\\) threads) dynamically formed by the hardware.
- Grouped together because they execute the exact same **Program Counter (PC)** simultaneously.
- Governed by an **Active Mask** to track thread status.

## What is the function of an **Active Mask** in a GPU **Warp**?

- A bit vector used by the hardware to strictly track which specific threads within a warp are currently valid or active for the currently executing instruction.

## What is a **Streaming Multiprocessor (SM)** in a GPU?

- The actual physical "core" of the GPU (e.g., \\(160\\) present in a Blackwell B200).
- **Functions**: Fetches instructions, schedules **warps**, and contains local caches and registers.

## What is a **Streaming Processor (SP)** or **CUDA Core**?

- An individual vector lane or **ALU** strictly located *inside* the **Streaming Multiprocessor (SM)**.
- Computes mathematical operations for exactly *one* thread of a **warp** per clock cycle.

## What are **Tensor Cores** in modern GPUs?

- Specialized execution units designed explicitly for AI/ML matrix math operations (\\(D = A \times B + C\\)).
- Support **mixed-precision computing** (e.g., taking FP16/FP8 inputs and using FP32 for accumulation).

## What are the characteristics of **Registers** in the GPU memory hierarchy?

- The fastest level of memory.
- Strictly private to each individual thread.
- **Limitation**: Excessive register usage per thread strictly limits the maximum number of concurrent **warps**.

## What is **Shared Memory** in a GPU and how is it synchronized?

- A software-programmable scratchpad cache.
- Shared among all threads *within a single block*.
- Strictly requires local software synchronization barriers (e.g., `__syncthreads()`) to prevent data races.

## What is **Global Memory (DRAM)** in a GPU?

- A large, high-latency memory pool.
- Globally accessible by all threads across the entire GPU, as well as by the Host (CPU).
- Includes specialized partitions like **Read-Only (Constant) Memory** and **Texture Memory**.

## How do GPUs hide memory latency using **Fine-Grained Multithreading (FGMT)**?

- **Warps** seamlessly interleave on the execution pipeline with absolutely zero interlocking overhead.
- If a warp stalls (e.g., due to a cache miss), the hardware **warp scheduler** instantly swaps it out for a different, ready warp.
- Masking latency relies purely on maintaining continuous computation across many warps.

## What causes **Branch Divergence** in a GPU warp and how does hardware execute it?

- **Cause**: Threads strictly within the exact same warp evaluate a branch condition (e.g., `if/else`) differently.
- **Execution**:
    - Logically splits the single warp into sequential passes.
    - Hardware executes both paths sequentially.
    - The **Active Mask** disables threads that do not belong to the currently executing path.
- **Impact**: Halves or severely drops **SIMD utilization** and overall efficiency.

## What is **Dynamic Warp Formation / Merging**?

- The hardware scheduler dynamically scans for different, waiting, divergent **warps** stalled at the exact same **Program Counter (PC)**.
- Merges partially empty warps into a single full warp.
- Actively restores the **Active Mask** to improve utilization.

## What physical constraint restricts arbitrary thread mapping during **Dynamic Warp Formation**?

- Threads cannot map to arbitrary hardware lanes.
- The physical **Register File** is strictly partitioned by lane ID, enforcing strict alignment constraints.

## What problem does **Two-Level Warp Scheduling** solve and how does it function?

- **Problem**: Standard round-robin scheduling of massive warp pools (e.g., \\(1000\\) warps) causes simultaneous long-latency memory loads, entirely stalling the **Streaming Multiprocessor (SM)**.
- **Solution**: Groups warps into smaller subgroups. The hardware processes one subgroup rapidly until it stalls, then computes the next subgroup while the first waits for memory.

## What is the **Host and Device Paradigm** in GPU programming?

- **Host**: The CPU (strictly handles sequential setup logic and branch-heavy code).
- **Device**: The GPU (strictly handles massively parallel compute kernels).
- Requires explicit data transfers between Host RAM and Device DRAM over the **PCIe bus**.

## How does the **Bulk Synchronous Parallel Model** hierarchically partition GPU workloads?

- A GPU kernel spawns a single **Grid**.
- The Grid is divided into independent **Blocks**.
- The Blocks are further divided into individual **Threads**.

## Why is there **No Global Synchronization** strictly enforced across all blocks in a GPU kernel?

- Hardware lacks a mid-kernel barrier across all blocks.
- **Reason**: Guarantees **Transparent Scalability** (the hardware can schedule blocks arbitrarily on any available **SM** at any time).
- To truly sync globally, the CPU must explicitly terminate the current kernel and launch a new one.

## How is a standard **1D Thread Index** mathematically calculated in CUDA?

- `Index = blockIdx.x * blockDim.x + threadIdx.x`
- Relies on matching unique thread IDs to underlying data array indices.
- *Note*: 2D indexing relies on standard row-major math (\\(\text{Row} \times \text{Width} + \text{Column}\\)).

## What are the five standard stages of a **CUDA Kernel Execution Workflow** in software?

1. **Allocate Memory**: Create buffers on the GPU (`cudaMalloc`).
2. **Copy Data**: Transfer data from CPU to GPU (`cudaMemcpyHostToDevice`).
3. **Launch Kernel**: Execute the function on the GPU asynchronously (CPU continues instantly).
4. **Synchronize & Retrieve**: Block the CPU (`cudaDeviceSynchronize`) and copy results back (`cudaMemcpyDeviceToHost`).
5. **Cleanup**: Free allocated GPU memory (`cudaFree`).

## What is **Occupancy** in GPU performance optimization?

- The strict ratio of active **warps** to the absolute maximum theoretical warps a single **Streaming Multiprocessor (SM)** can hold.
- Hard-limited by partitioned resources like **Registers**, **Shared Memory**, and available **Program Counters**.

## What is **Global Memory Coalescing** in GPUs?

- A hardware optimization where concurrent threads in a single **warp** access contiguous memory locations.
- Fits all thread requests directly into a single cache line (e.g., \\(128\\) bytes).
- Maximizes global memory bandwidth.

## Why is **AoS (Array of Structures)** detrimental for GPUs compared to **SoA (Structure of Arrays)**?

- **AoS**: Scatters thread memory accesses with large strides. Generates massive uncoalesced memory transactions, destroying memory bandwidth.
- **SoA**: Ensures contiguous threads hit contiguous data elements, naturally forcing memory coalescing.

## What are **Shared Memory Banks** and how are addresses mapped to them?

- **Banks**: Interleaved memory modules that can strictly service exactly one memory address per clock cycle.
- **Mapping**: Successive \\(32\\)-bit words are mapped to successive hardware banks (calculated via `Bank = Address % 32`).

## What causes a **Shared Memory Bank Conflict** and what is its performance penalty?

- **Cause**: Multiple threads exactly within *one warp* request *different* addresses that mathematically map to the *same* bank.
- **Penalty**: Forces hardware serialization (e.g., a 2-way bank conflict literally halves shared memory bandwidth).

## How does **Padding** resolve **Shared Memory Bank Conflicts**?

- Developers intentionally insert empty, unused bytes at the end of data rows.
- Purposefully shifts the modulo-32 math to misalign the data.
- Ensures concurrent threads naturally hit different memory banks.

## How does algorithm rewriting achieve **Control Flow Optimization** on GPUs?

- Rewrites parallel algorithms (e.g., using **tree reductions** instead of linear reductions).
- Ensures active threads remain sequentially adjacent to one another.
- Actively prevents intra-warp divergence and maintains a 100% **Active Mask**.

## What are **Atomic Operations** in GPU programming and what is their main drawback?

- Native hardware instructions that allow multiple threads to safely read/modify/write the exact same memory address.
- **Drawback**: Strictly forces serialization across threads, causing massive performance bottlenecks on heavily contested global memory addresses.

## What is **Privatization** in the context of GPU atomic operations?

- An optimization where thread blocks compute local sub-results completely within fast, local **Shared Memory**.
- Eliminates global memory contention.
- Only uses expensive **Global Memory** atomics exactly once at the end to merge the sub-results.

## What are **Asynchronous Transfers (Streams)** in collaborative GPU computing?

- Independent command queues that the GPU executes sequentially.
- Allows the hardware to actively overlap CPU-GPU PCIe communication (e.g., `cudaMemcpyAsync`) with actual kernel computation.
- Crucial for continuous processing (e.g., streaming video or live ML data).

## What is **Unified Memory** in CPU-GPU collaborative computing?

- An abstraction where the CPU and GPU share the exact identical virtual memory address space (e.g., using `cudaMallocManaged`).
- Completely eliminates the need for explicit software `cudaMemcpy` calls.

## How does the system implement **Unified Memory** dynamically behind the scenes?

- Relies strictly on **GPU page faults**.
- The operating system intercepts memory faults.
- Dynamically migrates \\(4\\)KB memory pages back and forth between Host RAM and GPU VRAM over the **PCIe bus** completely on demand.

## What is the difference between **Coarse-grained** and **Fine-grained** CPU-GPU task partitioning?

- **Coarse-grained**: Distributing entirely distinct, separate algorithms to the CPU and the GPU.
- **Fine-grained**: The CPU and GPU concurrently process strictly different chunks of the exact same data structure (relies heavily on **Unified Memory** system-wide atomics).

## What are **Persistent Thread Blocks** and what limitation do they explicitly bypass?

- A pattern that launches exactly enough blocks to fill all **Streaming Multiprocessors (SMs)** once.
- Blocks run infinite loops and dynamically pull new work from software queues.
- **Benefit**: Bypasses the strict CUDA limitation requiring kernel termination for global synchronization.
