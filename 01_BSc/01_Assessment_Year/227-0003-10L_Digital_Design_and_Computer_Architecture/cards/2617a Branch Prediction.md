## What are **Control Dependences** in processor pipelines?

- The next **Program Counter (PC)** is unknown for \\(N\\) pipeline stages until branch resolution.

## How is the **cost of branch misprediction** calculated and what is its impact on performance?

- **Penalty scaling**: Scales with pipeline depth (\\(N\\)) and fetch width (\\(W\\)).
- **Wasted slots**: \\(N \times W\\) instruction slots wasted per misprediction (e.g., 20 stages \\(\times\\) 5-wide = 100 slots).
- **Performance drop**: A 10% accuracy drop severely lowers superscalar **Instructions Per Cycle (IPC)**.
- **Pipeline flush**: Forces mandatory invalidation of all wrong-path instructions.

## What is pipeline **Stalling** as a branch prediction alternative and why is it problematic?

- Pauses the pipeline until the exact next **Program Counter (PC)** is known.
- **Flaw**: Results in ~50% wasted cycles, making it highly performance-prohibitive.

## How does **Fine-Grained Multithreading (FGMT)** mitigate control dependences and what is its flaw?

- Fetches from an independent thread every cycle, successfully masking control dependencies.
- **Flaw**: Severely hurts **single-thread performance**.

## What is **Multipath Execution** and what is its fatal flaw?

- Fetches both possible execution paths after a conditional branch.
- **Fatal flaw**: Causes an **exponential hardware explosion** (\\(2^k\\) paths required for \\(k\\) unresolved branches).

## What is **Delayed Branching** and how is it implemented?

- Executes the next \\(N\\) instructions (**Delay Slots**) strictly regardless of the actual branch outcome.
- **Implementation**: The compiler schedules independent, safe instructions from *before* the branch into the delay slot.
- **Advanced squashing**: Variants like **SPARC** can nullify the delay slot if the branch falls through.

## What are the primary disadvantages of **Delayed Branching**?

- Difficult compiler scheduling.
- Ties the software **Instruction Set Architecture (ISA)** strictly to a specific hardware pipeline depth.

## What is **Predicated Execution (If-Conversion)**?

- Converts a **Control Dependence** into a **Data Dependence** by eliminating branches.
- **Mechanism**: Assigns a **predicate bit** based on a condition (e.g., **CMOV** - Conditional Move).
- All instructions execute, but results only commit if the predicate is `TRUE` (otherwise acts as a `NOP`).

## What are the pros and cons of **Predicated Execution**?

- **Pros**: Eliminates hard-to-predict branches; creates larger straight-line basic blocks for compiler optimization.
- **Cons**: Creates **Useless Work** (discarded instructions); lowers performance if misprediction cost is less than the useless work cost. Requires heavy ISA/hardware support (e.g., **ARM**, **Intel Itanium**).

## What is the core goal of **Branch Prediction**?

- To guess the next fetch address in the next cycle, resulting in strictly zero wasted cycles upon a correct guess.

## What are the three **Prediction Requirements** in the pipeline fetch stage?

1. **Branch Identification**: Determine if the fetched instruction is actually a branch.
2. **Branch Direction**: Predict **Taken (T)** or **Not Taken (NT)**.
3. **Branch Target Address**: Predict the destination address if the branch is Taken.

## What is a **Branch Target Buffer (BTB)**?

- A **Program Counter (PC)**-indexed hardware cache that stores the last computed target address.
- Fulfills branch identification and target address prediction.

## What are **Indirect Branches**?

- Branches with multiple possible runtime targets (e.g., `switch-case` statements, virtual functions, returns).

## What is a **Return Address Stack (RAS)** and how does it function?

- A specialized hardware stack used for return target prediction (>95% accuracy).
- `CALL` instructions push the sequential **Program Counter (PC)** onto the stack.
- `RETURN` instructions pop the target address from the stack.

## How is **History-Based Target Prediction** implemented for non-return indirect jumps and what is its limitation?

- **Implementation**: XORs the **Global History Register (GHR)** with the **Indirect Branch PC** to index the **Branch Target Buffer (BTB)**.
- **Limitation**: Causes severe BTB capacity and conflict misses, as a single branch maps to many entries based on dynamic history.

## What are the **Always Not-Taken** and **Always Taken** static prediction strategies?

- **Always Not-Taken**: Simple prediction (~30-40% accuracy) needing no direction logic; optimized by compilers placing the likely path sequentially in memory.
- **Always Taken**: Better general accuracy (~60-70%); relies on backward loop branches being mostly taken.

## What is the **BTFN (Backward Taken, Forward Not Taken)** static branch prediction strategy?

- Predicts backward branches (e.g., loops) as **Taken**, and forward branches as **Not Taken**.

## How do **Profile-Based**, **Program-Based**, and **Programmer-Based** static branch predictions work?

- **Profile-Based**: Compilers set a **hint bit** using training runs (only accurate if profiles match real-world execution).
- **Program-Based (Heuristics)**: Compiler analysis guesses direction (e.g., backward branches `<= 0` denote error handlers \\(\rightarrow\\) Not Taken; pointers rarely equal \\(\rightarrow\\) Not Equal).
- **Programmer-Based (Pragmas)**: Manual code hints from the developer (e.g., `if (likely(x))`). Burdens programmer but leverages semantic knowledge.

## What is the common disadvantage of all **Static Branch Prediction** strategies?

- They cannot dynamically adapt to runtime branch behavior changes.

## How does a **Last-Time Predictor** operate and what is its main flaw?

- **Operation**: A 1-bit predictor (stored in the **Branch Target Buffer (BTB)**) that guesses the exact same outcome as the last execution.
- **Loop Accuracy**: \\((N-2)/N\\) for \\(N\\) iterations (mispredicts both the first and last iterations).
- **Flaw (Hysteresis Issue)**: Flip-flops prediction instantly upon a single different outcome.

## How does a **Two-Bit Counter (2BC) / Bimodal Predictor** function?

- Uses a 2-bit saturating counter (11 Strongly Taken, 10 Weakly Taken, 01 Weakly Not Taken, 00 Strongly Not Taken).
- **Hysteresis**: Requires two consecutive mistakes to flip a strong prediction.
- **Loop Accuracy**: \\((N-1)/N\\) for \\(N\\) iterations.
- **General Accuracy**: ~85-90% (which is insufficient for deep, wide superscalar pipelines).

## What is the core concept of **Two-Level Branch Prediction**?

- Branch outcomes correlate globally (based on other recent branches) or locally (based on their own past outcomes).

## What is a **Pattern History Table (PHT)**?

- A shared table of 2-bit counters indexed by history registers, used in both global and local two-level prediction schemes.

## How does **Global Branch Correlation** operate in two-level prediction?

- Uses a **Global History Register (GHR)**: An \\(N\\)-bit shift register tracking the exact Taken/Not-Taken history of recent dynamic branches program-wide.
- **Function**: Indexes the **Pattern History Table (PHT)** to learn global patterns (e.g., if branches A and B are Taken, C is Not Taken).

## How does **Local Branch Correlation** operate in two-level prediction and what is its main challenge?

- **First Level**: PC-indexed **Local History Registers** track specific history for individual branches (excellent for short repeating loops).
- **Second Level**: Shared **Pattern History Table (PHT)** indexed by specific local history.
- **Challenge**: Storing millions of local histories; PC hashing causes interference.

## What is **PHT Interference** in branch prediction?

- Occurs when multiple branches map to the exact same **Pattern History Table (PHT)** entry, leading to positive, negative, or neutral prediction impacts.

## What is a **Gshare Predictor** and what are its tradeoffs?

- **Optimization**: XORs the **Global History Register (GHR)** with the **Branch PC** to index the **Pattern History Table (PHT)**.
- **Pros**: Adds context (distinguishes branches sharing global history), effectively utilizes the PHT, and drastically reduces interference.
- **Cons**: Adds slight access latency due to the XOR gate.

## What is **Branch Filtering**?

- Routing highly biased branches (e.g., branches Taken 99% of the time) to simple static or last-time predictors to prevent **Pattern History Table (PHT)** pollution.

## How does an **Agree Predictor** reduce branch interference?

- **Pattern History Table (PHT)** counters track *agreement* with a static bias bit (stored in the **Branch Target Buffer (BTB)**).
- Converts negative interference into positive or neutral interference.

## How does a **Gskew Predictor** reduce branch interference?

- Uses multiple **Pattern History Tables (PHTs)** indexed with different hash functions.
- The final prediction is determined via a majority vote, effectively randomizing interference.

## What is a **Hybrid / Tournament Predictor**?

- **Concept**: Combines multiple prediction algorithms because no single predictor fits all scenarios.
- **Choice Predictor**: A meta-predictor that dynamically tracks and selects the most accurate sub-predictor (e.g., Global vs. Local) for each individual branch.

## What is a **Perceptron Predictor** and what are its pros and cons?

- **Concept**: A simple neural network (binary classifier) applied to branch prediction.
- **Math**: \\(\text{Output} = \text{Weight} \cdot X + \text{Bias} > 0\\) (where \\(X\\) is branch history mapped to \\(1\\) or \\(-1\\)).
- **Pros**: Scales to extremely long histories and is highly accurate (used in **AMD Zen**).
- **Cons**: High latency (requires an adder tree) and fails on XOR correlations because it is limited to **linearly separable functions**.

## What is a **TAGE Predictor (Tagged Geometric History Length)** and its tradeoffs?

- **Concept**: Uses multiple **Pattern History Tables (PHTs)** indexed by **Global History Registers (GHRs)** of geometrically increasing lengths (e.g., 2, 4, 8... up to thousands of bits).
- **Pros**: Dynamically selects the absolute "best" history length per branch (used in **AMD Zen 2**).
- **Cons**: High hardware complexity (requires complex hash functions and tag matching).

## How are **Convolutional Neural Nets (BranchNet)** used in branch prediction?

- CNNs parse extremely deep, noisy global histories to expose hidden correlations for the hardest-to-predict branches.

## What is **Branch Confidence Estimation**?

- A hardware mechanism that estimates the likelihood of a correct branch prediction based on recent correct/incorrect execution patterns.

## What is **Pipeline Gating** based on branch confidence?

- **Application**: Halts instruction fetching on execution paths with low prediction confidence.
- **Benefit**: Yields massive power and energy savings by actively preventing useless speculative execution (though it risks pipeline stalls).