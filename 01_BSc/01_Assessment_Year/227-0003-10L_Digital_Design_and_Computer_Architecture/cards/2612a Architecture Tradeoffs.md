## What is **Computer Architecture** composed of?

- The combination of an **Instruction Set Architecture (ISA)** and a **Microarchitecture**.

## What is an **Instruction Set Architecture (ISA)** in the context of processor design?

- **Definition**: The hardware/software interface (represents the programmer's view).
- Rarely changes because it requires strict **backwards compatibility**.
- *Analogy*: Acts as the gas pedal (interface) of a car.

## What is a **Microarchitecture (Implementation)**?

- **Definition**: The hidden hardware execution engine.
- Consists of internal, software-invisible choices (e.g., adder type, pipeline stages, cache sizes, cycle counts).
- *Analogy*: Acts as the engine internals (implementation) of a car.

## What is **Microarchitecture Independence**?

- The ability of a **Microarchitecture** to execute instructions internally in any order (e.g., out-of-order, parallel).
- The only requirement is that the execution engine must **strictly obey ISA semantics** for all programmer-visible results.

## How are **Semantic Gap Tradeoffs** managed between complex ISAs and simple hardware?

- By bridging them using **Software or Hardware Translators**.
- **Examples**:
    - **Rosetta 2**: Software translation (x86 code to ARM).
    - **Intel and AMD**: Hardware translation (complex x86 to simple internal **Micro-operations**).
    - **NVIDIA Denver**: Dynamic software optimization (ARM to internal format).
    - **Transmeta**: Software translation (Code Morphing) to a proprietary **VLIW ISA**.

## What is the **Register Quantity Tradeoff** in processor design?

- **Many registers**: Allows for better compiler allocation and fewer memory accesses (higher performance).
- **Few registers**: Results in smaller instruction encoding and a smaller, faster, lower-power register file.

## What is the **Application Space** in processor architecture?

- **Definition**: The target workloads that influence architecture design (e.g., machine learning, genome analysis).

## What is the **Dataflow Execution Model**?

- **Definition**: A data-driven alternative to the traditional **Von Neumann model**.

## What are the three key properties of the **Dataflow Execution Model**?

- Execution happens strictly in **data flow order** (there is no **Program Counter**).
- Instructions "fire" immediately upon receiving all necessary operands ("tokens").
- It is **inherently parallel** (allows simultaneous execution of ready instructions).

## What are **Dataflow Nodes** and how are they used to represent programs?

- **Definition**: A graphical program representation using discrete operations (e.g., copy, multiply, decrement, branch).
- *Example*: A looping network of branch, decrement, and multiply nodes can be used to compute \\(N!\\) (factorial).
