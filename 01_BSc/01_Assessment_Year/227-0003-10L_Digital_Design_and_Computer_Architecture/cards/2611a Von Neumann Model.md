## What is the **von Neumann Model** and what are its five fundamental components?

- **Definition**: The fundamental execution model for modern general-purpose computers (e.g., ARM, x86, RISC-V).
- **Five Components**:
    - **Memory**: Stores both programs and data.
    - **Processing Unit**: Performs the actual computations.
    - **Control Unit**: Orchestrates step-by-step execution.
    - **Input**: Peripherals for receiving data (e.g., keyboard).
    - **Output**: Peripherals for sending data (e.g., monitor).

## What are the two key properties of the **von Neumann Model**?

- **Stored Program**:
    - Instructions and data share a unified, linear memory.
    - The interpretation of values depends strictly on control signals at the time they are fetched.
- **Sequential Instruction Processing**:
    - Processes exactly one instruction at a time.
    - The **Program Counter** advances sequentially unless explicitly modified by control transfer instructions.

## How do **Address Space** and **Addressability** differ in memory systems?

- **Address Space**: The total number of uniquely identifiable memory locations.
    - **LC-3**: 16-bit addresses (\\(2^{16}\\) locations).
    - **MIPS**: 32-bit addresses (\\(2^{32}\\) locations).
- **Addressability**: The number of bits stored per unique location.
    - **Word-addressable**: 1 address = 1 full data word.
    - **Byte-addressable**: 1 address = 8 bits (1 byte). Used by MIPS (requires multiplying offsets to access full words).

## What is **Endianness** and what is the difference between **Big Endian** and **Little Endian**?

- **Definition**: The byte ordering convention within a data word (only relevant when exchanging data between different systems).
- **Big Endian**: The **Most Significant Byte (MSB)** is stored in the lowest byte address.
- **Little Endian**: The **Least Significant Byte (LSB)** is stored in the lowest byte address (used by x86 and MIPS).

## How do the **MAR** and **MDR** registers facilitate memory access operations?

- **Memory Address Register (MAR)**: Holds the target memory address.
- **Memory Data Register (MDR)**: Holds the data being read from or written to memory.
- **Read Operation**: Load target address into **MAR** \\(\rightarrow\\) memory places the requested data into **MDR**.
- **Write Operation**: Load target address into **MAR** \\(\rightarrow\\) load data into **MDR** \\(\rightarrow\\) activate the **Write Enable** signal.

## What is an **Arithmetic Logic Unit (ALU)** and what is its **word length**?

- **Definition**: The hardware component that executes arithmetic and logic operations (e.g., ADD, AND, NOT).
- **Word length**: The fixed chunk size of data processed by the ALU.
    - **LC-3**: 16 bits.
    - **MIPS**: 32 bits.

## What is a **Register File** and how do the LC-3 and MIPS implementations differ?

- **Definition**: Fast, temporary, programmer-visible storage located close to the ALU for intermediate results (bypassing slow memory access).
- **LC-3 Registers**:
    - 8 **General Purpose Registers (GPRs)** (`R0` to `R7`).
    - 3-bit identifier, 16-bit size.
- **MIPS Registers**:
    - 32 **GPRs**.
    - 5-bit identifier, 32-bit size.
    - Follows specific conventions (e.g., `Register 0` is hardwired to \\(0\\)).

## What are the specific roles of the **Instruction Register (IR)** and the **Program Counter (PC)**?

- Both are core registers within the **Control Unit**.
- **Instruction Register (IR)**: Holds the current instruction being actively processed.
- **Program Counter (PC)** (or Instruction Pointer): Holds the memory address of the current (or next) instruction to be fetched.

## What constitutes the **Programmer Visible (Architectural) State** of a processor?

- **Definition**: The complete system snapshot available to, and modifiable by, programmers.
- **Components**:
    - **Memory**
    - **Registers** (Register File)
    - **Program Counter (PC)**
- Instructions explicitly transform the values within these three components.

## What are the six phases of the **Instruction Processing Cycle**?

A step-by-step execution sequence (not all phases are required for every instruction):

1. **FETCH**: Obtains instruction from memory \\(\rightarrow\\) loads into **IR**.
2. **DECODE**: Identifies the instruction (via decoder) \\(\rightarrow\\) generates control signals.
3. **EVALUATE ADDRESS**: Computes target memory addresses (e.g., adding an offset).
4. **FETCH OPERANDS**: Obtains source operands from the **Register File** or Memory.
5. **EXECUTE**: Performs the operation inside the **ALU**.
6. **STORE RESULT**: Writes the final computed result to the designated destination.

## How does a **Finite State Machine (FSM)** orchestrate instruction execution?

- **FSM Orchestration**: Directs the step-by-step execution of instructions by generating specific **datapath control signals**.
- The FSM branches to different states based on the instruction type, where each state activates a unique combination of hardware gates to route data, perform ALU operations, or trigger memory accesses.

## How does the LC-3 FSM execute a **`JMP` (Jump)** instruction across its processing phases?

- **FETCH Phase**:
    - Routes **PC** into **MAR** and concurrently increments **PC**.
    - Waits for memory access.
    - Routes fetched data from **MDR** into **IR**.
- **DECODE Phase**:
    - Reads the opcode (top 4 bits of **IR**) to branch the FSM to the `JMP` execution path.
- **EXECUTE Phase**:
    - Performs an unconditional branch via **register addressing mode** (\\(PC \leftarrow \text{Base Register}\\)).
    - Reads the Base Register from the **Register File** and routes it directly to the **PC**, overwriting the sequentially incremented value.
