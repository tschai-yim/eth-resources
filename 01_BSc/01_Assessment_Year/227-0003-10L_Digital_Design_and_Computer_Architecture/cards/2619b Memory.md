## What are the key system metrics impacted by **Memory Criticality**?

- **Performance**: Creates a **data bottleneck** (processors sit idle waiting for data).
- **Energy**: **Communication dominates arithmetic** (moving off-chip data wastes \\(>60\%\\) of system energy).
- **Robustness**: Dense memory is prone to physical errors (e.g., bitflips).
- **Cost**, **Form Factor**, and **Predictability**.

## What are the five parameters of an **Ideal Memory**?

- **Zero access time** (latency)
- **Infinite capacity**
- **Zero cost**
- **Infinite bandwidth**
- **Zero energy**

## What are the three **Physical Limitations** that oppose ideal memory parameters?

- **Bigger is slower**: Large arrays require more time to decode and route signals.
- **Faster is more expensive**: Low-latency technology costs more per byte and takes more physical chip area.
- **Higher bandwidth is expensive**: Requires more physical pins, channels, and buses.

## What is the fundamental solution to the physical limitations of memory?

- The **Memory Hierarchy**.
- Combines small/fast memory with large/slow memory to simulate ideal conditions.

## What are the characteristics of **Flip-Flops / Latches** as storage technology?

- Extremely fast.
- Extremely expensive (requires tens of transistors per single bit).

## What are the characteristics and structure of **Static RAM (SRAM)**?

- **Structure**: Stores data using two **cross-coupled inverters**.
- **Components**: Typically uses **6 transistors (6T cell)** (4 for storage, 2 for access).
- **Performance/Cost**: Fast access, lower density, higher cost (\\(< \$0.3\\) per MB).
- **Manufacturing**: **Logic-compatible** (easily manufactured directly on the processor die).
- **Volatility**: Retains data indefinitely as long as powered (requires no refresh).

## What are the characteristics and structure of **Dynamic RAM (DRAM)**?

- **Structure**: Stores data as electrical charge inside a **capacitor** (Empty = `0`, Charged = `1`).
- **Components**: Uses **1 transistor, 1 capacitor (1T1C cell)**.
- **Performance/Cost**: Slower access, high density, very low cost (\\(< \$0.006\\) per MB).
- **Refresh**: Required because the capacitor charge naturally leaks via RC paths.
- **Manufacturing**: Incompatible with standard logic chips (requires specialized processes).

## What are the speed and cost characteristics of **Flash Memory** and **Hard Disk Drives (HDD)**?

- **Flash Memory**:
    - Non-volatile.
    - Slow access (\\(~50-100 \mu s\\)).
    - Very cheap (\\(< \$0.00008\\) per MB).
- **Hard Disk Drive (HDD)**:
    - Non-volatile.
    - Extremely slow (\\(~10 ms\\)).
    - Extremely cheap (\\(< \$0.00003\\) per MB).

## What is the fundamental difference between **Charge Memory** and **Resistive Memory**?

- **Charge Memory** (e.g., DRAM, Flash):
    - Writes data by capturing charge (\\(Q\\)).
    - Reads data by detecting voltage (\\(V\\)).
- **Resistive Memory** (e.g., STT-MRAM, Memristors):
    - Writes data by pulsing current (\\(dQ/dt\\)).
    - Reads data by detecting resistance (\\(R\\)).

## What is **Phase Change Memory (PCM)** and what are its characteristics?

- A **resistive memory** using **chalcogenide glass** that exists in an amorphous state (high resistance) or crystalline state (low resistance).
- **Pros**: 
    - Higher density than DRAM (scales better, stores multiple bits per cell).
    - Non-volatile, requires no refresh.
- **Cons**: 
    - Slower access and higher write energy (requires heating/cooling).
    - **Endurance problems**: Cells wear out after millions of writes.

## How is a **Memory Array** logically organized and accessed?

- **2D Array Structure**: Organized as \\(2^N\\) rows and \\(M\\) columns for efficiency.
- **Address Decoder**: Receives the address and activates exactly one row.
- **Wordline**: Horizontal wire that activates access transistors for an entire row simultaneously.
- **Bitline**: Vertical wire connecting column storage nodes to sensing logic.
- **Multiplexer (MUX)**: Selects specific requested bits from the activated row using the column address.

## What is the hierarchical structure of a **DRAM Subsystem** from largest to smallest?

1. **Channel**: Independent memory bus connecting CPU to memory.
2. **DIMM**: Physical printed circuit board (RAM stick).
3. **Rank**: Collection of memory chips operating simultaneously.
4. **Chip**: Individual integrated circuit.
5. **Bank**: Independent 2D memory array within a chip.
6. **Subarray**: Logical partition within a bank.
7. **Row/Column**: Lowest level addressing coordinates.

## How does a **Rank** operate in a DRAM subsystem?

- Operates multiple memory chips simultaneously to form a wider data bus.
- **Shared buses**: Shares Address and Command buses across chips.
- **Differentiation**: Uses a **Chip Select (CS)** signal (e.g., Front Rank vs. Back Rank).
- **Distributed data**: E.g., a 64-bit bus is formed by 8 chips outputting 8 bits each (keeps individual chips cheap and low-pin).

## What is the purpose of a **Subarray** in a DRAM Bank?

- It is an internal logical partition within a bank.
- **Purpose**: Shortens **bitlines** and **wordlines** to minimize electrical latency.

## What is a **Sense Amplifier** in DRAM and what is its function?

- Built from **cross-coupled inverters**.
- **Detection**: Detects tiny voltage deviations on the **bitline** (which is precharged to \\(1/2 V_{DD}\\)).
- **Amplification**: Amplifies the voltage to full \\(V_{DD}\\) (`1`) or \\(0\\) (`0`).
- **Destructive Read**: Reading drains the capacitor, so the amplifier must actively drive the full charge back to restore the cell state.

## What is a **Row Buffer** in DRAM?

- An array of **sense amplifiers** that holds an entire row of data.
- Acts as a temporary fast cache strictly within the DRAM bank.

## What is the three-step **Access Sequence** for internal DRAM operation?

1. **ACTIVATE**: Opens the target row and moves data into the **row buffer** (slow).
2. **READ / WRITE**: Accesses specific columns from the active **row buffer** (fast).
3. **PRECHARGE**: Closes the row, writes data back to capacitors, and resets **bitline** voltages to \\(1/2 V_{DD}\\) for the next access.

## What is the difference between a **Row Buffer Hit** and a **Row Buffer Conflict**?

- **Row Buffer Hit**: Requested row is already open in the buffer. Only requires the fast READ/WRITE column command.
- **Row Buffer Conflict**: Requested row differs from the currently open row. Requires a slow sequence: PRECHARGE (close old) \\(\rightarrow\\) ACTIVATE (open new) \\(\rightarrow\\) READ/WRITE.

## How does **Banking (Interleaving)** improve memory array performance?

- Divides a single, slow, monolithic array into multiple independent **Banks**.
- **Shared Buses**: Banks share address and data buses to drastically reduce memory chip pin counts.
- **Parallelism**: Enables concurrent overlapped operations (e.g., starting an access in Bank 1 while waiting for Bank 0's latency).

## How does **Data Mapping** function across memory banks?

- Sequential memory addresses are mapped to successive memory banks.
- **Purpose**: Ensures that sequential software accesses distribute evenly across different banks, actively preventing bottlenecks.

## What is **RowHammer** in DRAM?

- A physical hardware failure mechanism.
- Creates severe system security vulnerabilities (e.g., arbitrary privilege escalation).

## How do **Read Disturbance Errors** (RowHammer) physically occur in DRAM?

- Repeatedly reading the same row ("hammered row") causes electromagnetic interference.
- Induces rapid charge leakage in adjacent rows ("victim rows").
- **Result**: Causes predictable **Bitflips** (data corruption) in victim rows before the memory controller's natural refresh cycle can trigger.

## How does **Scaling** impact DRAM's vulnerability to Read Disturbance Errors?

- Vulnerability increases as chips scale down.
- Smaller cells, higher density, and shorter physical distances make interference much more likely.