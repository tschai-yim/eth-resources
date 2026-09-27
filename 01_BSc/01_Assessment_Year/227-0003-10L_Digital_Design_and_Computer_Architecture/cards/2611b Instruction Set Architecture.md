## What is an **Instruction Set Architecture (ISA)** and what are its three main specifications?

- **Definition**: The software-hardware execution interface.
- **Specifications**:
    - **Memory organization**: Address space, addressability, alignment.
    - **Register set**: Quantity, size (e.g., 8 in **LC-3**, 32 in **MIPS**).
    - **Instruction set**: Opcodes, data types, addressing modes, formats.

## What are the tradeoffs between **large (complex)** and **small (simple)** opcodes?

- **Large (Complex) Opcodes**: Harder hardware design, but easier software mapping (better supports high-level constructs).
- **Small (Simple) Opcodes**: Simpler hardware (forms the basis of **RISC**), but requires chaining multiple basic instructions for complex operations.

## What are the three **MIPS Instruction Formats** and their characteristics?

- **R-type (Register)**: **Opcode** is always \\(0\\). The operation is defined by the bottom 6 bits (the **funct** field).
- **I-type (Immediate)**: Contains a 16-bit immediate value.
- **J-type (Jump)**: Contains a 26-bit immediate value.

## What are **Data Types** in an ISA and what types do the **LC-3** and **MIPS** architectures support?

- **Definition**: Rules for interpreting binary data.
- **LC-3**: Supports only **2's complement integers** (where negative \\(X = \text{NOT}(X) + 1\\)).
- **MIPS**: Supports **2's complement**, **unsigned integers**, and **floating point**.

## What is **Binary Coded Decimal (BCD)** and what are its characteristics?

- **Definition**: A data type where decimal digits are individually encoded using a fixed number of bits (often used in digital clocks).
- **Characteristics**: Highly human-readable, but highly **ALU-inefficient**.

## What are the tradeoffs of supporting **more versus fewer data types** in an ISA?

- **More types**: Provides better mapping to High-Level Languages (e.g., matrices), resulting in smaller code and fewer instructions.
- **Fewer types**: Reduces the workload and complexity of the microarchitecture (hardware).

## What is the **Semantic Gap** in processor architecture?

- **Definition**: The proximity of an architecture's instructions and data types to a **High-Level Language (HLL)**.

## What characterizes a **Small Semantic Gap (Complex ISAs)** and what are its pros and cons?

- **Characteristics**: Features complex instructions (e.g., matrix multiply, string copy). Example: **VAX**.
- **Pros**: Denser encoding, smaller code footprints, better cache hit rates, and simpler compilers.
- **Cons**: Highly complex hardware and limited opportunities for fine-grained compiler optimization.

## What characterizes a **Large Semantic Gap (Simple ISAs)** and what are its pros and cons?

- **Characteristics**: Features basic primitive instructions (e.g., **ADD**, **XOR**). Example: Early **RISC** processors.
- **Pros**: Very simple hardware implementation.
- **Cons**: Requires executing a higher number of instructions to complete complex tasks.

## What is an **Addressing Mode** and what is the general tradeoff of adding more modes?

- **Definition**: The mechanism used to specify the location of an operand.
- **Tradeoff**: Adding more modes improves mapping to High-Level Languages (like arrays and pointers) but heavily increases **hardware complexity** and **compiler overhead**.

## How does the **PC-Relative Addressing Mode** (e.g., LC-3 LD/ST) calculate addresses and what is its limitation?

- **Calculation**: \\(\text{Incremented PC} + \text{sign\_extend(PCoffset9)}\\).
- **Hardware**: Requires a dedicated address calculation adder.
- **Limitation**: Has a restricted physical range (can only reach \\(+255\\) to \\(-256\\) memory locations away).

## How does the **Indirect Addressing Mode** (e.g., LC-3 LDI/STI) calculate addresses and what is its hardware impact?

- **Use case**: Ideal for **pointer chasing**.
- **Calculation**: \\(\text{Memory}\[\text{PC} + \text{sign\_extend(PCoffset9)}\]\\).
- **Hardware Impact**: Highly expensive as it requires **two memory accesses** (one to fetch the address pointer, another to fetch the actual target data).
- *Note*: Explicitly omitted in **MIPS** to keep hardware simple.

## How does the **Base+Offset Addressing Mode** (e.g., LC-3 LDR/STR, MIPS lw/sw) calculate addresses and what advantage does it provide?

- **Calculation**: \\(\text{Base Register} + \text{sign\_extend(offset)}\\). Offsets are 6 bits in **LC-3** and 16 bits in **MIPS**.
- **Advantage**: Allows the processor to address data anywhere in memory (overcoming PC-Relative range limits) by using a cached base register.

## How do the **Immediate / Literal Addressing Modes** function in the **LC-3 (LEA)** and **MIPS (lui)**?

- **Load Effective Address (LC-3 LEA)**: Calculates \\(\text{PC} + \text{offset9}\\) and stores it directly into a register. It **does not access memory** (used for pointer arithmetic).
- **Load Upper Immediate (MIPS lui)**: Loads a 16-bit immediate value into the upper half of a register and sets the lower half to \\(0\\) (used to build 32-bit constants).

## How is the **NOT Instruction** implemented across **LC-3**, **LC-3b**, and **MIPS** architectures?

- **LC-3**: Features a natively supported unary **NOT** operation.
- **LC-3b**: Replaces **NOT** with **XOR** (achieves NOT by XORing the value with all \\(1\\)s).
- **MIPS**: Lacks a dedicated **NOT** instruction (achieves it via **NOR** or **XOR** with all \\(1\\)s).

## How does the **LC-3** architecture implement **Operate Instructions with Literals (Immediates)**?

- **Purpose**: Avoids wasting register space for small constants (like \\(+1\\) or \\(-1\\)).
- **Implementation**: Uses bit 5 of the instruction as a **steering bit**.
    - **Bit \\(5 = 0\\)**: Uses the second source register.
    - **Bit \\(5 = 1\\)**: Uses a **sign-extended** 5-bit immediate (**imm5**).
- **Hardware**: Controlled by a multiplexer that selects the correct ALU input based on bit 5.

## What is **Sign Extension** in hardware operations?

- **Definition**: The process of replicating the **Most Significant Bit (MSB)** of a smaller binary value across its newly added upper bits to maintain its correct mathematical value when expanding to system-width compatibility.

## What is the tradeoff between **MIPS** and **LC-3** regarding the **Subtraction** operation?

- **MIPS**: Uses a native `sub` instruction (takes \\(1\\) instruction). Yields denser code encoding.
- **LC-3**: Lacks a native subtract; requires \\(4\\) instructions (NOT, ADD #1, ADD). Simplifies hardware control logic by eliminating the need for a subtraction ALU.

## What are the **Condition Codes** in the **LC-3** architecture?

- **Definition**: Three single-bit registers representing **N (Negative)**, **Z (Zero)**, and **P (Positive)**.
- **Behavior**: They are updated automatically every time data is written to a General Purpose Register (GPR). Strictly **one code** is set to \\(1\\) at any given time.

## How does **Conditional Branching (LC-3 BR)** operate and what are its two edge cases?

- **Operation**: The instruction contains three test bits (\\(n, z, p\\)). It branches if any test bit matches the currently active condition code.
- **Edge Case 1 (\\(n=z=p=1\\))**: Acts as an **Unconditional Jump** (always branches).
- **Edge Case 2 (\\(n=z=p=0\\))**: Acts as a **NOP** (No Operation; simply proceeds to the next instruction).

## What is the tradeoff between **MIPS** and **LC-3** regarding **Branching Equality**?

- **MIPS (`beq`)**: Compares two source registers in \\(1\\) instruction. Minimizes instruction count but forces the active ALU comparison inside the branch routing logic.
- **LC-3**: Requires \\(4\\) instructions to test equality. Costs software performance but drastically simplifies the microarchitecture, as branch logic only needs to check status bits.
