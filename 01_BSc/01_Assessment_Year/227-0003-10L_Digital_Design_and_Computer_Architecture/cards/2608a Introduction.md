## What are the three key components of the **Von Neumann Model**?

- **Computation** (Processing Unit: datapath, control/sequencing)
- **Communication** (I/O)
- **Storage/Memory**

## What are the layers of the **Transformation Hierarchy** from problem to physical particles?

A systematic abstraction bridging problems to physical electrons:

- **Problem** (Target task or application)
- **Algorithm**
- **Program/Language** (Code implementation)
- **System Software** (OS, Virtual Machines)
- **SW/HW Interface** (**ISA**)
- **Micro-architecture** (Hardware implementation of ISA)
- **Logic** (Digital circuits, logic gates)
- **Devices** (Transistors)
- **Electrons** (Physical particles)

## What is the **Instruction Set Architecture (ISA)**?

It acts as the **software/hardware contract** at the **SW/HW Interface** layer of the Transformation Hierarchy.

## What are the traits, drawbacks, and examples of **General Purpose hardware** (CPUs / Microprocessors)?

- **Traits**: Flexible (runs any program), ubiquitous, fast programming (minutes).
- **Drawbacks**: Lower efficiency and performance for heavy workloads.
- **Examples**: Apple M1, Intel Alder Lake.

## What are the traits, drawbacks, and examples of **Special Purpose hardware (ASICs)**?

- **Traits**: Mass production, maximum performance and efficiency.
- **Drawbacks**: Inflexible (limited programs), slow development (months), requires custom design masks.
- **Examples**: Google **TPU** (systolic array), ML accelerators.

## What are the traits and development process of **FPGAs (Field Programmable Gate Arrays)**?

- **Traits**: Reconfigurable hardware, flexible, ideal for prototyping.
- **Development**: Takes days to program via **Verilog/VHDL**, which generates a **bit file**.
