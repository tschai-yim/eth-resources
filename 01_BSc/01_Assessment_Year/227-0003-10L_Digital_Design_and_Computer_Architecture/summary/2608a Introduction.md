## Fundamental Concepts of Computing

- **Purpose**: **Solve problems**, **gain insight** (Richard Hamming), **enable better life**.
- **Core Challenge**: Translate human problems to **orchestrated electrons**.
- **Von Neumann Model** (3 key components):
    - **Computation** (Processing Unit: datapath, control/sequencing).
    - **Communication** (I/O).
    - **Storage/Memory**.

## The Transformation Hierarchy

- Systematic abstraction bridging human problems to physical electrons:

| Layer                  | Short Description                                                          |
| :--------------------- | :------------------------------------------------------------------------- |
| **Problem**            | Target task or application                                                 |
| **Algorithm**          | Step-by-step procedure (finiteness, definiteness, effective computability) |
| **Program/Language**   | Code implementation                                                        |
| **System Software**    | OS, Virtual Machines                                                       |
| **SW/HW Interface**    | **ISA (Instruction Set Architecture)**: Software/hardware contract         |
| **Micro-architecture** | Specific hardware implementation of the ISA                                |
| **Logic**              | Digital circuits, logic gates                                              |
| **Devices**            | Transistors                                                                |
| **Electrons**          | Physical particles                                                         |

- **Axiom**: Highest energy efficiency and performance require cross-hierarchy co-design and maximal **specialization**.

## Computer Architecture & Modern Trends

- **Computer Architecture**: **Science and art** of designing platforms for specific goals (performance, battery, cost).
- **Current Landscape**: **Paradigm shift** driven by data hunger, power/thermal constraints, memory bottlenecks.
- **Innovation Opportunities**:
    - **Room at the Bottom** (Richard Feynman): Device physics, denser circuits, nanotechnology.
    - **Room at the Top** (Charles Leiserson): Software, algorithms, hardware architecture.
    - **Combined Axiom**: Maximum potential via communication and optimization across top and bottom.

## Emerging Computing Paradigms

- **Processing-in-Memory (PIM)**: Computation inside memory chips (reduces data movement energy).
    - **Examples**: UPMEM (DRAM), Samsung AxDIMM / HBM-PIM, SK Hynix AiM.
- **Extreme Scale ML Accelerators**:
    - **Tesla Dojo**: Co-designed chip/system/software for self-driving ML training.
    - **Cerebras WSE (Wafer Scale Engine)**: Largest ML chip (trillions of transistors, 850k+ cores).

## Hardware Platforms: General vs. Special Purpose

- **General Purpose (CPUs / Microprocessors)**:
    - **Traits**: Flexible (any program), ubiquitous, fast programming (minutes).
    - **Drawbacks**: Lower efficiency/performance for heavy workloads.
    - **Examples**: Apple M1, Intel Alder Lake.
- **Special Purpose (ASICs)**:
    - **Traits**: Mass production, maximum performance/efficiency.
    - **Drawbacks**: Inflexible (limited programs), slow development (months), custom design masks.
    - **Examples**: Google **TPU** (systolic array), ML accelerators.
- **FPGAs (Field Programmable Gate Arrays)**:
    - **Traits**: Reconfigurable hardware, flexible, ideal for prototyping.
    - **Development**: Days to program via **Verilog/VHDL** (generates bit file).
