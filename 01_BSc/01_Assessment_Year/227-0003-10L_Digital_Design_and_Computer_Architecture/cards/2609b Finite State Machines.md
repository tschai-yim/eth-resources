## What is a **Finite State Machine (FSM)** and what are its five theoretical elements?

- **Definition**: A discrete-time model of a stateful system.
- **Five Theoretical Elements**:
    - Finite **states**.
    - Finite **external inputs**.
    - Finite **external outputs**.
    - Explicit **state transitions** (movement between states).
    - Explicit determination of **external output values**.

## What are the three hardware components of a **Finite State Machine (FSM)**?

- **State Register**: A sequential circuit storing the current state (**D Flip-Flops**).
- **Next State Logic**: A combinational circuit calculating the upcoming state (based on inputs and the current state).
- **Output Logic**: A combinational circuit generating the external outputs.

## What are the characteristics and diagram representation of a **Moore FSM**?

- Outputs depend **only** on the current state.
- **Diagram representation**: Outputs are written directly inside the state circles.

## What are the characteristics, diagram representation, and timing of a **Mealy FSM**?

- Outputs depend on **both** the current state and current inputs.
- **Diagram representation**: Outputs are written on the transition arcs.
- **Timing**: Outputs react immediately to input changes mid-cycle (combinational logic delay makes output changes asynchronous relative to the clock edge).

## What is **Binary Encoding (Full Encoding)** in FSMs and what is its main trade-off?

- Uses the minimum possible bits: \\(\log_2(\text{num\_states})\\).
- **Trade-off**: Minimizes the number of flip-flops needed, but complicates the **next-state logic** and **output logic**.

## What is **One-Hot Encoding** in FSMs and what is its main trade-off?

- Uses one distinct bit per state (e.g., \\(0001, 0010, 0100, 1000\\)).
- Exactly **1 bit** is active ("hot") simultaneously.
- **Trade-off**: Maximizes the number of flip-flops needed, but massively simplifies **next-state logic** and is highly automatable.

## What is **Output Encoding** in FSMs and what is its main trade-off?

- State bits perfectly match the desired output bits (e.g., Green = \\(001\\), Yellow = \\(010\\)).
- **Trade-off**: Eliminates the need for separate **output logic**, but is restricted strictly to **Moore FSMs**.

## What are the six steps of the **FSM Design Procedure**?

- **1. Determine States**: Identify all conditions (start with a safe **Reset State**).
- **2. State Transition Diagram**: Map nodes (states) and directed arcs (input-triggered transitions) (e.g., transitioning sequentially only upon scanning an exact bit sequence).
- **3. State Transition Table**: Tabulate current states/inputs against next states.
- **4. Pick Encoding**: Assign binary values to named states (e.g., \\(S_0 = 00\\)).
- **5. Derive Boolean Logic**: Extract **Sum-of-Products (SOP)** equations for next-state and output bits.
- **6. Draw Schematic**: Wire logic gates to **D Flip-Flops**.
