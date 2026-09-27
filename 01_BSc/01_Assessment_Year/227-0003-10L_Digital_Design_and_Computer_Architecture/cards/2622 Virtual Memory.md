## What is the **Core Abstraction** of memory presented to the programmer?

- A programmer illusion of a memory system featuring:
    - **Zero access time**
    - **Infinite capacity**
    - **Zero cost**

## What is the **System Reality** of memory management in a computer system?

- The hardware and **Operating System (OS)** cooperatively map a large **Virtual Address (VA)** space to a smaller **Physical Address (PA)** space.

## What are the three **Primary Benefits** of using virtual memory?

- **Relocation**: Allows flexible placement of code and data within physical memory.
- **Protection and Isolation**: Strictly prevents independent processes from overwriting each other's memory.
- **Sharing**: Allows multiple processes to map to the exact same physical memory (e.g., shared read-only libraries) to save space.

## What is the difference between **Virtual Pages** and **Physical Frames**?

- **Virtual pages**: Fixed-size chunks of the virtual address space (typically `\(4\text{KB}\)`, sometimes `\(16\text{KB}+\)`).
- **Physical frames**: The exact corresponding chunks located in physical memory.

## How does physical memory function conceptually regarding disk storage?

- Physical memory acts dynamically as a **fully-associative cache** for data stored on the slower disk.

## What are the constituent parts of a **Virtual Address** and a **Physical Address**?

- **Virtual Address**: Composed of a **Virtual Page Number (VPN)** and a **Page Offset**.
- **Physical Address**: Composed of a **Physical Page Number (PPN)** and a **Page Offset**.

## What is the strict translation rule regarding the **Page Offset**?

- The **Page Offset** bits strictly *never change or translate* during the virtual-to-physical mapping process.

## What is a **Page Table**?

- An in-memory dictionary data structure strictly responsible for mapping **Virtual Page Numbers (VPNs)** to **Physical Page Numbers (PPNs)**.

## What is the **Page Table Base Register (PTBR)**?

- A hardware register (e.g., `CR3` in x86 architecture) that holds the exact physical base address of the currently active process's **Page Table**.

## What are the five core bits/fields contained in a **Page Table Entry (PTE)**?

- **Valid bit**: Indicates if the page is currently present in physical memory.
- **Tag bits (PPN)**: The physical translation target address.
- **Dirty bit**: Supports write-back caching by flagging modified pages.
- **Protection bits**: Dictates access control rights (read/write/execute).
- **Replacement bits**: Tracks usage statistics for eviction algorithms.

## What is the fundamental **Size Problem** of a flat, 64-bit virtual memory page table?

- A flat page table requires an immense amount of contiguous physical memory per process (e.g., `~\(2^{54}\)` bytes), which is completely unfeasible.

## How do **Multi-Level (Hierarchical) Page Tables** solve the page table size problem?

- **Organization**: Uses a tree-based structure (e.g., 4 levels in x86-64).
- **Memory Savings**: Only the first-level table strictly requires permanent physical memory allocation; unused virtual address ranges are left completely unallocated.
- **Trade-off**: Requires `\(N\)` sequential memory accesses per translation (e.g., 4 accesses for a 4-level table).

## What strictly triggers a **Page Fault** exception?

- Triggered when a process accesses a virtual address where the corresponding **Page Table Entry (PTE)** has a **Valid bit** equal to `0` (which immediately halts execution).

## What is a **Minor Page Fault**?

- A fault where the data is actually present, allowing the **Operating System (OS)** to instantly find and allocate free physical memory without disk access.

## What is a **Major Page Fault** and how is it handled?

- **Definition**: A fault where the requested data is entirely missing from RAM and strictly resides on disk.
- **Handling**:
    - The OS exception handler invokes a disk fetch.
    - Uses **Direct Memory Access (DMA)** to transfer data from disk to RAM, actively saving CPU cycles.
    - Stalls the faulting application for milliseconds while the CPU **context switches** to execute other processes.

## Why is a **True LRU (Least Recently Used)** page replacement algorithm unfeasible in hardware?

- Tracking millions of pages exactly requires massive overhead; instead, page replacement is strictly handled by OS software taking advantage of high disk latencies to run complex approximations.

## How does the **CLOCK Algorithm** approximate page replacement?

- **Structure**: Uses a circular physical frame list and a moving scanning pointer ("hand").
- **Mechanism**:
    - Checks the hardware-set **Reference (R) bit**.
    - Replaces the first frame it finds where `R = 0`.
    - If it finds `R = 1`, it clears the bit (`R -> 0`) during traversal, effectively giving the page a "second chance".

## What is a **Translation Lookaside Buffer (TLB)**?

- A small, extremely fast hardware cache that stores recent **Page Table Entries (PTEs)** to explicitly bypass slow, full page table walks.

## What are the pros and cons of a **Hardware-Managed TLB** (e.g., x86)?

- **Mechanism**: Hardware strictly handles the page table walk upon a TLB miss.
- **Pros**: Extremely fast, naturally overlaps with computation, and requires no OS exceptions.
- **Cons**: High hardware complexity, and forces the OS to be locked into a static, hardware-defined page table layout.

## What are the pros and cons of a **Software-Managed TLB** (e.g., MIPS)?

- **Mechanism**: Hardware raises a fault exception on a miss; the OS manually walks the table and inserts the PTE.
- **Pros**: Grants the OS total flexibility over layout and replacement algorithms.
- **Cons**: Carries a massive performance penalty due to pipeline flushes and context switching.

## What is a **Hardware Page Table Walker (PTW)**?

- A per-core hardware state machine that transparently resolves **TLB** misses by automatically performing the page walk without requiring any OS context switches.

## What are **Page Walk Caches (PWC)**?

- Low-latency hardware caches strictly storing intermediate, non-leaf page table pointers to drastically accelerate repetitive page walks.

## What is the primary benefit and drawback of using **Multiple Page Sizes** (e.g., \\(4\text{KB}\\), \\(2\text{MB}\\), \\(1\text{GB}\\))?

- **Benefit**: Drastically reduces the total **Page Table Entry (PTE)** count.
- **Drawback**: Introduces high tail latency when zeroing-out large `\(2\text{MB}\)` pages for security purposes compared to fast `\(4\text{KB}\)` pages.

## How does the **L1 Data TLB** handle hardware lookups for multiple page sizes?

- Utilizes separate hardware structures strictly divided per page size.
- Employs **Parallel Lookup**: Probes all L1 TLBs simultaneously because the exact page size and offset bits are unknown beforehand.

## How does an **L2 Unified TLB** use **N-Step Index Re-Calculation (Pseudo-Associativity)**?

- **Mechanism**: Caches all page sizes in one structure. Assumes `\(4\text{KB}\)` first (calculates index, checks tag). On a miss, assumes `\(2\text{MB}\)` (recalculates index, checks tag).
- **Pros**: Very simple hardware implementation.
- **Cons**: Creates variable hit latency (slower for `\(2\text{MB}\)` hits) and sequential testing directly lengthens the critical path on a miss.

## How is **Page-Level Protection** architecturally implemented and scoped?

- Implemented via access control privilege **Rings** (e.g., Ring 0 = Supervisor/Kernel, Ring 3 = User).
- **Page Directory Entry (PDE)** scope: Protects all 1024 downstream pages simultaneously.
- **Page Table Entry (PTE)** scope: Protects only a single specific page.

## How does the **RowHammer Page Table Exploit** function to grant kernel privileges?

- **Mechanism**: Exploits physical DRAM unreliability by rapidly accessing memory (via `clflush`) to induce bit flips in adjacent rows.
- **Spraying**: The attacker heavily fills physical memory with their own **Page Table Entries (PTEs)**.
- **Exploitation**: Flips a **PPN** bit inside a PTE, mapping it to *another* page table.
- **Result**: Grants the user process read/write access to system page tables, yielding **kernel privileges**.

## What is the **Homonym Problem** in Cache-VM interaction and how is it solved?

- **Definition**: Occurs when the exact same **Virtual Address (VA)** maps to different **Physical Addresses (PAs)** (e.g., two different programs using identical VAs).
- **Solution**: Virtually-addressed cache lines are strictly tagged with a unique **Process ID (PID)**.

## What is the **Synonym Problem** in Cache-VM interaction?

- **Definition**: Occurs when entirely different **Virtual Addresses (VAs)** map to the exact same **Physical Address (PA)** (e.g., shared libraries).
- **Risk**: The exact same physical data exists in multiple virtually-addressed cache locations, strictly causing data inconsistency upon modification.

## What are the two specific **Emerging Workload Overheads** related to virtual memory?

- **Short-Running Workloads** (e.g., Function-as-a-Service): Suffer massive **Memory Allocation** overheads because OS setup time is unamortized over the short runtime.
- **Long-Running Workloads** (e.g., Graph Analytics): Suffer massive **Address Translation** overheads because highly irregular memory accesses cause constant TLB misses.

## What are three **Future Scaling Trends** for memory management architectures?

- **Unified Virtual Memory**: Spanning high-bandwidth GPU memory and high-capacity CPU memory seamlessly.
- **Direct Storage Access**: Completely bypassing the OS to allow hardware byte-addressable SSD access.
- **Memory Disaggregation**: Utilizing network-accessed, independent memory nodes physically separated in data centers.
