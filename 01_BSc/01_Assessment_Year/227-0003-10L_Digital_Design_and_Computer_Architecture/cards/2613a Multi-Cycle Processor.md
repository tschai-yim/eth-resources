## What are the three core System Design Principles?

- **Critical path design**: Find and decrease the maximum combinational logic delay.
- **Bread and butter (common case) design**: Optimize the most frequent operations.
- **Balanced design**: Eliminate bottlenecks; avoid unnecessary hardware duplication.

## What is the core concept of a Multi-Cycle Microarchitecture?

- **Clock cycle time** is independent of total instruction execution time.
- Instructions take only **as many cycles as needed** rather than executing entirely in one clock cycle.
- Execution is broken into multiple **state transitions** per instruction.

## What is the difference between Architectural State and Microarchitectural State?

- **Architectural State**: Programmer-visible (e.g., **Registers**, **PC**, **Memory**). Updated only at instruction completion.
- **Microarchitectural State**: Programmer-invisible. Intermediate results stored in **temporary registers** (latches) between individual clock cycles.

## What are the benefits of a Multi-Cycle Microarchitecture?

- **Higher clock frequency**: Achieved via a shorter critical path.
- **Hardware reuse**: Reusing components achieves a **Balanced design**.
- **Faster execution**: Simple instructions finish in fewer cycles instead of waiting for a worst-case fixed cycle time.

## What are the downsides of a Multi-Cycle Microarchitecture?

- Additional hardware needed for intermediate state (**latches**).
- **Sequencing overhead**: Register setup/hold times are paid multiple times per instruction.
- **Limited concurrency**: Only a small part of the machine is actively utilized during any given cycle.

## How is hardware consolidated in a Multi-Cycle Datapath?

- **Single Memory**: Used for both instruction fetches and data access (accessed in different clock cycles).
- **Single ALU**: Reused for all arithmetic operations, branch target calculations, and **Program Counter (PC)** incrementing.

## What are the key Intermediate Storage Registers in a multi-cycle datapath?

- **Instruction Register (IR)**: Latches the fetched instruction for use across multiple cycles.
- **Memory Data Register (MDR)**: Buffers data read from or written to memory.
- Dedicated latches buffer intermediate **ALU outputs** (e.g., **ALUOut**).

## What is the role of the Finite State Machine (FSM) in multi-cycle control logic?

- Acts as the control unit that sequences through execution states by:
    - Setting **Multiplexer Selects** for proper data routing.
    - Asserting **Register Enables** for state updates (e.g., **PCWrite**, **IRWrite**).
    - Setting **ALUControl** to define the specific ALU operation.

## What are the 5 cycles of the `lw` (Load Word) instruction in a multi-cycle processor?

- **Cycle 1 (Fetch)**: Fetches instruction into **IR** and increments **PC**.
- **Cycle 2 (Decode)**: Decodes instruction and reads the base register.
- **Cycle 3 (Address Calculation)**: **ALU** adds the base register and sign-extended immediate to find the effective memory address.
- **Cycle 4 (Memory Read)**: Reads data from the effective address into the **MDR**.
- **Cycle 5 (Writeback)**: Writes data from **MDR** back to the destination register.

## How does a multi-cycle FSM handle real-world memory constraints?

- **Real-World Constraint**: Memory access is much slower than a single processor clock cycle.
- **Solution**: The FSM waits in a "memory access" state until the memory asserts a **Memory Ready** control bit, allowing it to dynamically handle variable memory delays.

## What is Microprogrammed Control?

- **Microprogramming**: A technique to translate a complex, high-level **ISA** into a sequence of simple, hardware-level **microinstructions**.
- It provides an abstraction layer to manage complex FSM control logic.

## What are the core components of Microprogrammed Control?

- **Microinstruction**: The set of control signals for a single FSM state; forms a user-invisible **u-ISA**.
- **Control Store**: A fast internal memory holding all microinstructions, addressed by the current FSM state number.
- **Microsequencer**: Hardware logic that determines the address of the next microinstruction (i.e., the next state).

## What are the advantages of Microprogramming?

- Bridges the **Semantic Gap** between complex ISA instructions and simple hardware.
- **Extensibility**: New instructions can be supported simply by adding new microcode.
- **Field Patching**: Hardware bugs can be fixed post-release by updating the microcode rather than replacing physical chips.
