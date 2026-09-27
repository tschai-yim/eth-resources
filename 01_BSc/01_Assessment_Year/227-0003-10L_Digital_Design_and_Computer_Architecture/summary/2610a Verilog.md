## Hardware Complexity & HDLs

- **Transistor Scaling**: Massive complexity growth.
    - Examples: Intel Kaby Lake ($1.75$B), Apple M1 ($16$B), Cerebras Wafer Scale Engine (trillions).
- **Hardware Description Languages (HDLs)**: Enable hardware specification, simulation, and synthesis.
    - **Seamless Parallelism**: Native representation of concurrent logic.
    - **Verilog**: Developed in 1984, popular in the US (used in this course).
    - **VHDL**: Developed in 1981, popular in Europe.
- **Hardware Synthesis**: Mapping synthesizable HDL into **low-level cell libraries** (gates/wires).
    - Tools optimize but **cannot guarantee optimal solutions** (placement/routing is computationally expensive).
- **Simulation**: Verifying functionality and timing via waveforms without manufacturing.

## Hierarchical Design

- **Goal**: Control complexity via module abstraction (like software functions).
- **Top-Down Methodology**: Define **top-level module** $\rightarrow$ subdivide into **sub-modules** $\rightarrow$ reach **leaf-cells** (primitive logic gates).
- **Bottom-Up Methodology**: Start with available **building blocks** $\rightarrow$ build upwards to top-level module.

## Verilog Syntax & Data Types

- **Basic Syntax**:
    - **Case sensitive** (`Name` $\neq$ `name`).
    - No leading numbers for names.
    - Whitespace ignored.
    - **Comments**: `//` (single-line), `/* ... */` (multiline).
- **Number Representation**:
    - Format: `<Number of bits>'<Base><Value>` (e.g., `8'b0000_1001`).
    - **Bases**: `b` (binary), `h` (hexadecimal), `d` (decimal), `o` (octal).
    - **Default**: $32$ bits (if undeclared).
    - Underscores (`_`) improve readability.
- **Signal States**:
    - **Don't Care (`X`)**: Unknown/irrelevant value.
        - *Example*: `assign y = 1'bx;`
    - **Floating Signal (`Z`)**: Not driven, open circuit, **high impedance**.
        - Handled by **Tri-state buffers** (bus sharing).
        - *Example*: `assign y = en ? a : 1'bz;`
    - **Logic Propagation**: ANDing with `Z` or `X` yields `X` (unless strictly forced to `0`).
- **Arrays & Buses**:
    - **Packed Arrays (Buses)**: Contiguous bits. Declared *before* the name.
        - *Example*: `wire [31:0] data;`
        - **Good Practice**: Use **MSB to LSB** ordering (`[31:0]`, not `[0:31]`).
    - **Unpacked Arrays**: Arrays of distinct elements. Declared *after* the name.
        - *Example*: `reg [3:0] memory [0:1023];` (1024 elements of 4 bits).
- **Manipulating Bits**:
    - **Bit Slicing**: Extracting subsets (`assign short = bus[12:5];`).
    - **Concatenation**: Joining bits (`assign y = {a[2], a[1]};`).
    - **Duplication**: Multiple copies (`assign y = {4{a[0]}};`).

## Modeling Styles

- **Structural (Gate-Level) Modeling**: Low-level interconnection of modules/gates.
    - **Predefined Primitives**: Built-in gates (`and`, `or`, `not`).
    - **Module Instantiation**: Mapping sub-module ports to local wires.
    - **Explicit Port Mapping**: Always map by name (`.A(local_A)`), never by position (avoids maintainability issues).
    - Tedious for large designs.
- **Behavioral Modeling**: High-level mathematical and logical abstraction.
    - High productivity; exact gate mapping handled by synthesis tool.
    - Most practical designs mix both structural and behavioral.

## Behavioral Modeling Constructs

- **Operators**:
    - **Bitwise**: Map directly to hardware gates: `&` (AND), `|` (OR), `^` (XOR), `~` (NOT).
    - **Reduction**: Reduce $N$-bit bus to $1$-bit output (`assign y = &a;` logically ANDs all bits of `a`).
    - **Precedence**: **Highest** = `NOT` (`~`), **Lowest** = Ternary (`?:`). Use parentheses extensively.
- **Conditional Assignments**:
    - **Ternary Operator (`?:`)**: `assign y = s ? d1 : d0;`.
    - Nested ternaries synthesize into **multiplexer trees**.
- **Control Flow Statements** (Requires `always` blocks):
    - **If / Else**: Standard branching (`if (en) a = 1; else a = 0;`).
    - **Switch Case**: Cleaner multi-way branching (`case (sel) ... endcase`). Includes `casex` to handle don't-cares.
    - **For Loops**: Iterative logic generation (`for (i=0; i<8; i=i+1)`). Fully unrolled during synthesis.

## Parameterized Modules

- **Purpose**: Create scalable, generic blocks (e.g., $N$-bit adder instead of fixed $4$-bit).
- **Syntax**: `#(parameter width = 8)` defined before port list.
- **Instantiation**: Override default values dynamically (`mux2 #(.width(12)) my_mux (...);`).

## Sequential Logic Implementation

- **Sequential Concept**: Combinational logic + Memory. Transitions triggered by **Clock**.
- **The `always` Block**: Executes on **sensitivity list** changes (`always @(posedge clk)`).
    - Variables assigned inside **must** be `reg` (does not guarantee physical register synthesis).
    - **Never** use `assign` inside `always`.
- **Edge-Triggering (Flip-Flops)**: Use `posedge clk` or `negedge clk`.
- **Control Signals**:
    - **Asynchronous Reset**: Immediate. Included in sensitivity list.
    - **Synchronous Reset**: On clock edge. Inside `if (reset)`; *not* in sensitivity list.
    - **Enable**: Synchronous. Inside `if (en)`; *not* in sensitivity list.
- **Simple Flip-Flop Example**:

  ```verilog
  always @(posedge clk) begin
      if (reset) 
          q <= 0;      // Synchronous reset
      else if (en) 
          q <= d;      // Synchronous enable
  end
  ```

## Combinational Logic in `always` Blocks

- Can implement complex combinational logic (nested `if..else`, `case`).
- **Sensitivity List**: Must include *all* inputs (`always @(a, b, sel)` or `always @(*)`).
- **The Unintentional Latch Pitfall**:
    - Synthesizes to pure combinational logic **only if outputs are assigned in ALL paths**.
    - Unassigned conditions (e.g., missing `else`) force hardware to "remember" state $\rightarrow$ infers a **Sequential Latch**.
    - **Good Practice**: Always provide a `default:` case in `case` statements.

## Assignment Types

- **Blocking Assignments (`=`)**:
    - Execute **sequentially** (blocks next line evaluation).
    - Used strictly for **combinational logic** (`always @(*)`).
- **Non-blocking Assignments (`<=`)**:
    - Evaluated immediately, assigned **concurrently at block end**.
    - Used strictly for **synchronous sequential logic** (`always @(posedge clk)`).
- **Critical Rule**: **Do not** mix both in one block, and **do not** assign the same signal in multiple blocks.

## Good Practices & Hardware Mindset

- **Hardware $\neq$ Software**: General-purpose programming approaches map inefficiently.
- **Paper First**: Sketch hardware blocks and datapath wiring before coding.
- **Simulation Timing**: Explicit delays (`#5`) are **only for simulation**; ignored by synthesis.
- **Code Organization**:
    - Consistent naming style.
    - **One module per file**.
    - Match filename to module name (e.g., `TryThis.v` for `module TryThis`).
