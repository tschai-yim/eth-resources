## What is the core concept of the **PageRank** algorithm?

- **Innovation**: The primary driver behind Google's search success.
- **Ranking Concept**: Represents a **third way** of ranking documents (distinct from probabilistic IR and language models).
- **Core Idea**: **Ranking pages in order to display them** based on inherent authority, rather than just query relevance.

## How is **Page Impact** distributed in the Web Graph?

- The web is modeled as a massive **Weighted Graph** connected via **hypertext links**.
- **Page Impact**: A measure of a page being **popular or relevant** (e.g., Wikipedia).
- **Impact Division**: Total impact is split evenly across all outgoing links as fractional weights:
    - 1 link: Target receives \\(1\\) (full impact).
    - 2 links: Targets receive \\(1/2\\) each.
    - 3 links: Targets receive \\(1/3\\) each.

## What is the **Random Surfer Model**?

- **Thought Experiment**: Simulates a user clicking links completely at random infinitely.
- **Resulting Metric**: Generates a **distribution over the pages** based directly on visit frequency, forming the foundation of the ranking.

## What is the mathematical abstraction of the **Random Surfer Model**?

- **Probability Vector** (\\(X\\)): A column vector (\\(x_1 \dots x_n\\)) representing the current page visit probability/score.
- **Transition Matrix** (\\(M\\)): A **stochastic matrix** encoding the graph's edge weights.
- **Matrix Property**: The sum of every column is exactly \\(1\\) (represents 100% of outgoing weights).
- **State Calculation**: The probability for step \\(k+1\\) is calculated by multiplying the transition matrix with the previous step's vector:
    - \\(X_{k+1} = M X_k\\)

## What is **Convergence** in the Random Surfer Model?

- **Simulation**: Represents a continuous N-steps simulation created by repeated multiplication by the transition matrix (\\(M^k\\)).
- **Definition**: The state where probabilities stabilize over time and **converge to a fixed point** (a stationary distribution).
- **Mathematical Representation**: Expressed via the fixed point equation **\\(MX = X\\)**.

## How is the **fixed point** mathematically solved in PageRank?

- Solved using the **diagonalization problem** in linear algebra.
- The fixed point corresponds exactly to the **eigenvector associated with the eigenvalue one**.
- *Note*: Google was initially built entirely on diagonalizing these massive matrices.

## What is the purpose of **Damping** and **Random Teleportation** in PageRank?

- **The Issue**: A random surfer can easily **get stuck** in dead-ends or infinite loops.
- **The Solution (Damping)**: Acts as a **reset button** (smoothing mechanism) to prevent traps.
- **Random Teleportation**: Introduces a probability \\(p\\) to instantly **teleport uniformly at random** to any web page in the graph.

## What is the standard configuration and formula for the **Damping** model?

- **Standard Configuration**:
    - **85% chance**: Follow standard links (\\(1-p = 0.85\\)).
    - **15% chance**: Teleport randomly (\\(p = 0.15\\)).
- **Damping Formula**: Combines the transition matrix \\(M\\) with a uniform matrix to ensure a non-zero visit probability for every page:
  \\[X_{k+1} = \\left( 0.85M + \\frac{0.15}{n} \\begin{pmatrix} 1 & \\dots & 1 \\\\ \\dots & \\dots & \\dots \\\\ 1 & \\dots & 1 \\end{pmatrix} \\right) X_k\\]
