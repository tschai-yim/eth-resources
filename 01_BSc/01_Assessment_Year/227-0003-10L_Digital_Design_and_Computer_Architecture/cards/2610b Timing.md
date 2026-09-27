## What are the four primary hardware design trade-offs?

- **Area**: Proportional to physical device cost.
- **Speed**: Defined by latency (delay) and throughput (operations/second).
- **Power & Energy Consumption**: Critical for mobile battery life and thermal limits (heat dissipation).
- **Design Time**: Engineering cost and time-to-market constraints.

## What physical and environmental factors cause statistical variance in combinational circuit delay?

- **Capacitance and resistance** of wires and logic gates.
- **Finite speed of light** (highly relevant at nanosecond scales).
- **Environmental variables** like operating voltage, temperature, and circuit aging.
- **Input transitions**: Direction of the change (e.g., rising \\(0 \rightarrow 1\\) versus falling \\(1 \rightarrow 0\\)).

## What is the typical timing margin added to maximum delay calculations and why?

- A **30% margin** is typically added to maximum delay calculations.
- **Reason**: To account for unpredictable **environmental variables** (like temperature fluctuations and voltage drops) that can alter physical delay.

## What is the difference between Contamination Delay and Propagation Delay in combinational circuits?

- **Contamination Delay (\\(t_{cd}\\))**: The *shortest* time from an input change to the *start* of the output change (minimum delay). Forms the **Short Path**.
- **Propagation Delay (\\(t_{pd}\\))**: The *longest* time from an input change to the *finish* of the output change (maximum delay). Forms the **Critical Path**.

## What is a glitch in a combinational circuit and what causes it?

- **Definition**: A single input transition that causes multiple erratic, temporary output transitions.
- **Cause**: Differing parallel path delays (e.g., a "fast path" and a "slow path" reaching the exact same logic gate at slightly different times).

## How are glitches fixed in combinational circuits and when can they be ignored?

- **Fix**: Add a **consensus term** (a redundant logic gate) to provide a steady parallel path that holds the output stable during the problematic input transition.
- **When to ignore**: Often ignored in **synchronous systems** if the signal settles well before the clock edge, as skipping the fix saves chip area and power.

## What are the Setup Time, Hold Time, and Aperture Time constraints of a D Flip-Flop?

- **Setup Time (\\(t_{setup}\\))**: The required time *before* the clock edge where the data (\\(D\\)) must be completely stable.
- **Hold Time (\\(t_{hold}\\))**: The required time *after* the clock edge where the data (\\(D\\)) must remain stable.
- **Aperture Time (\\(t_a\\))**: The total critical window where data cannot change (\\(t_a = t_{setup} + t_{hold}\\)).

## What causes metastability in a D Flip-Flop and what is the physical result?

- **Cause**: The data input (\\(D\\)) changes during the **aperture time** (violating setup or hold constraints).
- **Result**: The output gets physically stuck between \\(0\\) and \\(1\\) and eventually settles **non-deterministically**.

## What is the difference between Clock-to-Q Contamination Delay and Propagation Delay in a D Flip-Flop?

- **Clock-to-Q Contamination Delay (\\(t_{ccq}\\))**: The *earliest* possible time after a clock edge that the output (\\(Q\\)) *starts* changing.
- **Clock-to-Q Propagation Delay (\\(t_{pcq}\\))**: The *latest* possible time after a clock edge that the output (\\(Q\\)) *finishes* changing.

## What is the Setup Time Constraint equation between sequential registers and what does it dictate?

- **Equation**: \\(T_c > t_{pcq} + t_{pd} + t_{setup}\\).
- **Dictates**: The system's **minimum clock period (\\(T_c\\))** and maximum operational frequency (\\(f_{max} = 1 / T_c\\)).
- **Limitation**: It is heavily limited by the combinational **Critical Path (\\(t_{pd}\\))**.

## What is the Hold Time Constraint equation between sequential registers and how is a violation fixed?

- **Equation**: \\(t_{ccq} + t_{cd} > t_{hold}\\).
- **Purpose**: Ensures the receiving register avoids capturing new data meant for the *next* clock cycle.
- **Fix**: Add pure delay (e.g., dual inverters or buffers) to the combinational **Short Path (\\(t_{cd}\\))**.
- **Note**: This constraint is entirely **independent of clock cycle time (\\(T_c\\))** and cannot be fixed by slowing down the clock.

## What is Clock Skew and how is it managed in hardware design?

- **Definition**: The time difference between clock edges reaching different physical chip locations, caused by differing wire delays.
- **Management**: Mitigated by using intelligent **clock networks or meshes** to equalize wire lengths across the entire chip.

## How does Clock Skew algebraically impact the Setup and Hold time constraints?

It effectively increases the timing burden on both constraints by adding \\(t_{skew}\\) to the required timings:

- **Skew Setup Constraint**: \\(T_c > t_{pcq} + t_{pd} + t_{setup} + t_{skew}\\)
- **Skew Hold Constraint**: \\(t_{ccq} + t_{cd} > t_{hold} + t_{skew}\\)
