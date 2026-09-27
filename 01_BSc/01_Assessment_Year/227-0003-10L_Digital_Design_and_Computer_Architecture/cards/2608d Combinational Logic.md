## What are the two types of logic circuits and how do they differ regarding memory?

- **Combinational Logic**: **Memoryless** circuits. Outputs are strictly dependent on current inputs.
- **Sequential Logic**: Circuits with memory (history). Outputs depend on current and past inputs.

## What are the two specifications used to describe a logic circuit?

- **Functional Specification**: The input-to-output relationship (unique mapping, no memory).
- **Timing Specification**: The delay between input changes and output responses.

## What is the goal of logic simplification and what hardware metrics does it improve?

- **Goal**: Reduce gate/input counts.
- **Improves**: Hardware **area, cost, latency**, and **energy**.

## What is the Uniting Theorem in logic simplification?

- Eliminates redundant variables (input changes that do not affect the output).
- Formula: \\(F = A\overline{B} + AB = A\\).

## What is a Don't Care (X) condition in logic simplification?

- An input state that does not affect the output.

## What are Karnaugh Maps (K-Maps)?

- A pictorial method for visual **logic simplification**.

## What is the core function, mapping, output type, and primary use cases of a **Decoder**?

- **Function**: Acts as an **input pattern detector**.
- **Mapping**: Maps \\(N\\) inputs \\(\rightarrow 2^N\\) outputs.
- **Output Type**: Produces a **One-Hot Output** (exactly one output is **1** to match the input pattern, all others are **0**).
- **Use Cases**: **Memory Address decoding** (row selection) and **Instruction decoding** (opcode translation).

## What is the core function of a Multiplexer (MUX) and how does it route inputs?

- Acts as a **selector**.
- Routes exactly one of \\(N\\) data inputs to a single output.
- Requires \\(\log_2 N\\) **select bits**.
- Features modular construction (e.g., building a 4:1 MUX from three 2:1 MUXes).

## How does a Lookup Table (LUT) map a truth table into hardware?

- Uses a **MUX** implementation.
- **Data inputs** are hardwired to constant truth table outputs (0/1).
- **Dynamic variables** act as select lines.

## What specific logic functions dictate the Sum and Carry-out in a Full Adder?

- Adds two bits (\\(a_i, b_i\\)) and a carry-in (\\(carry_i\\)).
- **Sum (\\(s_i\\))**: Uses a **3-input XOR function**.
- **Carry-out (\\(carry_{i+1}\\))**: Uses a **3-input majority function** (evaluates to 1 if \\(\geq 2\\) inputs are 1).

## How do Ripple Carry Adders and Carry Lookahead Adders differ in architecture and performance?

- **Ripple Carry Adder**: Chains 1-bit full adders. High latency (carry sequentially "ripples" upwards).
- **Carry Lookahead Adder**: Uses **logic specialization** for fast parallel carry calculation. Trades larger area for higher speed.

## What is a Programmable Logic Array (PLA) and how is it structured?

- A generalized structure for two-level **Sum of Products (SOP)**.
- **Array of AND gates** (generates minterms) \\(\rightarrow\\) **Array of OR gates** (sums minterms).
- Requires \\(2^N\\) AND gates.
- Programmed by connecting specific AND outputs to OR inputs.

## How is a Comparator hardware module built to check equality between two values?

- Acts as an **Equality Checker** for two \\(N\\)-bit values.
- Uses an **XNOR gate** per bit pair (outputs 1 if matching).
- Bit pair results are combined via a massive **AND gate**.
- Native PLA implementations are inefficient (requires custom blocks).

## What is an Arithmetic Logic Unit (ALU) and how does it select operations?

- A centralized module for arithmetic (ADD/SUB) and logical (AND/OR) operations.
- Uses an internal **MUX** and a control input to select exactly one function at a time.
- Enables **modular processor design**.
